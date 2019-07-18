package com.dzxx.ssm.Service;

import com.dzxx.ssm.Model.User;
import com.github.pagehelper.PageInfo;

import java.util.List;
public interface UserService extends BaseService<User>{
    void addUser(User user, Integer[]roles);
    List<User> selectRelevanceUsers();
    PageInfo<User> selectByPage(int pageNum,int pageSize);
    User selectById(int id);
    boolean removeUser(int id);
    void deleteUsers(Integer []integers);
    PageInfo<User> selectUsersBySearchPage(int pageNum,int pageSize,String studentInfo);
    void updateUser(User user,Integer[]roles );
    int selectByNameAndMiMa(String username,String password);
}
