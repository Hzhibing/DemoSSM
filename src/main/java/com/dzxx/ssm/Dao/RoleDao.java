package com.dzxx.ssm.Dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("RoleDao")
public interface RoleDao extends BaseDao{
    //通过用户id删除与该用户关联的所有角色信息
    void deleteById(@Param("id") int id);
}
