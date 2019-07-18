package com.dzxx.ssm.Dao;
import com.dzxx.ssm.Model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userdao")
public interface UserDao extends BaseDao {
    User selectByName(@Param("name") String name);
    List<User> selectRelevanceUsers();
    /*
    * 通过用户的id号查询对应的用户记录，和用户对应的角色
    * */
    User selectById(@Param("id") int id);
    boolean removeUser(@Param("id") int id);
    List<User> selectUsersBySearchPage(@Param("studentInfo") String studentInfo);
    int selectByNameAndMiMa(@Param("username")String username, @Param("psd") String password);
}
