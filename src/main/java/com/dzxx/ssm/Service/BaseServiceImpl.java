package com.dzxx.ssm.Service;

import com.dzxx.ssm.Dao.BaseDao;
import com.dzxx.ssm.Tools.MapToEntityTool;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Service
public abstract class BaseServiceImpl<T> implements BaseService<T> {

    public Class<?> clazz;
    String tableName;
    public BaseServiceImpl(){

        //此处的Type类型为接口类型，
        Type type=  this.getClass().getGenericSuperclass();
        //转换为子接口类型
        ParameterizedType type1 = (ParameterizedType)type;
        Type[] types = type1.getActualTypeArguments();
        clazz = (Class<?>)types[0];
        //h获取表的名字
        tableName = "t_"+clazz.getSimpleName().toLowerCase();
        //System.out.println("表的名字"+tableName);
        /*
        * 下面是把上面的步骤结合起来了
        * */
        //clazz = (Class<?>)((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    //获取BaseDao对象的解决方案，也就是Service层拿到Dao层的对象
    public abstract BaseDao getBaseDao();
    /*
    *
    * 在后面的增删改查方法当中，需要知道泛型T的具体类型
    * */
    @Override
    public void add(T t) {
        List<Object> list = new ArrayList<>();
        for(Field field:t.getClass().getDeclaredFields()){
            field.setAccessible(true);//打开获取私有属性的权限设置
            try{
                list.add(field.get(t));//field.get(t)为获得字段值
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        System.out.println(list.toArray());
        getBaseDao().add(tableName,list.toArray());
    }
    public void addNoMatch(Object[]fileds,Object[]filedValues){
        getBaseDao().addNoMatch(tableName,fileds,filedValues);
    }
    @Override
    public void delete(int id) {
        try{
          getBaseDao().delete(tableName,id);
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    public void update(T t) {
        List<Object> list = new ArrayList<>();
        int id = 0;
        for(Field field:t.getClass().getDeclaredFields()){
            field.setAccessible(true);
            try{
                if(field.get(t)==null){
                    continue;
                }
                if (("id").equals(field.getName())) {
                    id = (Integer) field.get(t);
                    continue;
                }
                if(field.getName().equals("id")){
                    id = (int)field.get(t);
                    System.out.println("用户id为"+id);
                    continue;
                }
                //剩下的才是真正修改的字段,下面的是把修改的字段名和值连接起来，在放入list集合中去。如set name = alice
                list.add(field.getName()+"='"+field.get(t)+"'");
            }catch (Exception e){
                e.printStackTrace();
            }

        }
       getBaseDao().update(tableName,id,list.toArray());
    }

    @Override
    public T select(int id) {
        /*
        最重要的步骤就是要把Map类型的变量转换成为T类型
        * */
        Map<Object,Object> rsMap =getBaseDao().select(tableName,id);
        return (T) MapToEntityTool.map2entity(rsMap,clazz);
    }

    @Override
    public List<T> selectAll() {
          /*
        最重要的步骤就是要把Map类型的变量转换成为T类型
        * */
          List<T> list = new ArrayList<>();//用来存放将，map转换过来的结果
        List<Map<Object, Object>> rsList = getBaseDao().selectAll(tableName);
        T t = null;
        for(Map<Object, Object> map:rsList){
            t =(T)MapToEntityTool.map2entity(map,clazz);
            list.add(t);
        }
        return list;
    }
}
