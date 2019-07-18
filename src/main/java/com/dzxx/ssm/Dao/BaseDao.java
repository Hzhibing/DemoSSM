package com.dzxx.ssm.Dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BaseDao {
    /*
    *  tableName为操作的数据表名，另外接口要和接收接口的xml配置文件做相应的映射，
    *  在多参数时需加注解指定接口中的参数名在xml配置文件中被接收的参数的名字
    * */
    void add(@Param("tableName") String tableName,@Param("objects") Object[] objects);
    void addNoMatch(@Param("tableName") String tableName,@Param("fileds") Object[] fileds,@Param("filedsValues") Object[] filedsValues);
    void delete(@Param("tableName") String tableName,@Param("id") Integer id);
    void update(@Param("tableName") String tableName,@Param("id") Integer id,@Param("objects") Object[] objects);
    //查询一条记录
    Map<Object,Object> select(@Param("tableName") String tableName, @Param("id") Integer id);
    //查询所有记录
    List<Map<Object,Object>> selectAll(@Param("tableName") String tableName);


}
