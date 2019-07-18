package com.dzxx.ssm.Tools;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapToEntityTool {
    /**
     * 通过具体类型参数entityClass获取类型里面属性名的集合
     * 通过具体类型参数entityClass获取类型里面set方法的map集合
     *获取set方法的map集合的整体思路，
     * 1.获取set方法名
     * 2.通过set方法名和set方法里面参数的类型获得set方法的对象
     * 3.把每一个set方法的对象存储到一个Map集合里面，键为属性名，值为set方法的对象
     */
    //建立缓存类
    private static Map<String,EntityCacheItem> convertItemCache = new HashMap<>();

    public static <T> T map2entity(Map<Object,Object> map,Class<T> entityClass){
       //直接尝试从convertItemCache缓存中获取EntityCacheItem对象
        EntityCacheItem entityCacheItem = convertItemCache.get(entityClass.getName());//以实体类的类名作为参数去获取
        if(entityCacheItem==null){
            //第一次访问缓存里面肯定没有，所以就创建一个对象
            entityCacheItem = EntityCacheItem.createEntityCacheIteme(entityClass);
            //把创建的对象添加到缓存当中，以便于以后的使用
            convertItemCache.put(entityClass.getName(),entityCacheItem);
        }
        List<String> fieldNameList =entityCacheItem.getFieldNameList();
        Map<String,Method>setMethodMap = entityCacheItem.getSetMethodMap();
        /*
        *排除数据库中字段中的下划线 */
        String key;
        String key1;
        String key2;
        Map<Object,Object> targetMap = new HashMap<>();
         //遍历数据库传过来的map集合
        for(Map.Entry<Object, Object> entry:map.entrySet()) {
            key = entry.getKey().toString();
            while(key.contains("_")) {
                key1 = key.substring(0,key.indexOf('_'));
                key2 = key.substring(key.indexOf('_')+1);
                key2 = key2.substring(0,1).toUpperCase() + key2.substring(1);
                key = key1 + key2;
            }

            targetMap.put(key, entry.getValue());
        }
        /*
        * 获取泛型T的对象，然后返回
        * */
        T entity = null;
        try{
            //通过反射机制获取这个类的一个对象
            entity = entityClass.newInstance();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
       /*
        下面要把传过来的map里面的额数据注入到对象里面，要不然实例化了也是空的
        */

        //从上面定义的属性数组里面取到每一个属性的值
        Object mapFieldValue;
        //用来获取set方法里面的参数
        Class<?>[]parameterTypes=null;
        //从上面的set方法集合里面获取指定属性名的set方法
        Method setMethod1;
        for(String fieldName1:fieldNameList){
            //用属性名来获取map传过来的属性值
            mapFieldValue = targetMap.get(fieldName1);
            if(mapFieldValue==null) {
                continue;
            }
            //从上面的set方法集合里面获取本次循环属性的set方法
            setMethod1 = setMethodMap.get(fieldName1);
            if(setMethod1==null){
                continue;
            }
            //获取set方法里的参数
            /*
            * java.lang.reflect.Method.getParameterTypes()方法返回一个Class对象数组，
            * 它们以声明顺序表示由此Method对象表示的方法的形式参数类型。如果底层方法没有参数，
            * 则返回长度为0的数组

             */
            parameterTypes = setMethod1.getParameterTypes();//getParameterTypes()返回的是方法形参的类型，是一个Class类型的数组
            if(parameterTypes==null||parameterTypes.length>1){
                continue;
            }
            //set方法的参数类型和map穿过来的字段值的类型是否一致
            if(parameterTypes[0].isAssignableFrom(mapFieldValue.getClass())){
                try{
                    //调用对象的set方法把应有的属性值注入到对象中
                    setMethod1.invoke(entity,mapFieldValue);
                }catch (Exception e){
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return entity;
    }
    /**
     *
     *此处定义的静态内部类，目的是为了避免重复的代码执行，在上面的代码中每一次执行查询操作都要去遍历一次整个类当中的属性，显得格外麻烦
     */
    static class EntityCacheItem{
        private EntityCacheItem() {
        }
        //两个属性
        private List<String> fieldNameList = new ArrayList<>();
        private Map<String ,Method> setMethodMap = new HashMap<>();
        //两个get方法，为上面的类提供值
        public List<String> getFieldNameList() {
            return fieldNameList;
        }
        public Map<String, Method> getSetMethodMap() {
            return setMethodMap;
        }

        public void parseEntity(Class<?> entityClass){
            Field fields[] = entityClass.getDeclaredFields();
            //用来存放属性名的计集合
            String fieldName;
            //属性的set方法名
            String setMethodName;
            //方法对象
            Method setMethod = null;
            for(Field field:fields){
                field.setAccessible(true);
                fieldName =  field.getName();
                fieldNameList.add(fieldName);
                //构造set方法名,
                setMethodName = "set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
                try{
                    //field.getType()为属性值
                    setMethod = entityClass.getDeclaredMethod(setMethodName,field.getType());//getType()返回的为属性的类型
                }catch (Exception e){
                    e.printStackTrace();
                }
                setMethodMap.put(fieldName,setMethod);//键为字段名，值为反射得到的方法对象
            }
        }
        public static EntityCacheItem createEntityCacheIteme(Class<?> entityClass){
            EntityCacheItem entityCacheItem = new EntityCacheItem();
            entityCacheItem.parseEntity(entityClass);
            return entityCacheItem;
        }
    }
}
