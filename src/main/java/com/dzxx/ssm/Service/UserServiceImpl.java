package com.dzxx.ssm.Service;

import com.dzxx.ssm.Dao.BaseDao;
import com.dzxx.ssm.Dao.RoleDao;
import com.dzxx.ssm.Dao.UserDao;
import com.dzxx.ssm.Dao.UserRole;
import com.dzxx.ssm.Model.User;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{
  @Autowired
  private UserDao userDao;
  @Autowired
  private UserRole userRole;
  @Autowired
  private RoleDao roleDao;
    @Override
    public BaseDao getBaseDao() {
        return userDao;
    }
    public void addUser(User user,  Integer[]roles){
      this.addNoMatch(new Object[]{"username","password","phone","email","enable"}, new Object[]{user.getUsername(),
              user.getPassword(),user.getPhone(),user.getEmail(),1});
      User use = userDao.selectByName(user.getUsername());
      userRole.add("t_user_role",new Object[]{null,use.getId(),roles[0]});
    }

  @Override
  public List<User> selectRelevanceUsers() {
    return userDao.selectRelevanceUsers();
  }

  @Override
  public PageInfo<User> selectByPage(int pageNum, int pageSize) {
    Page<User> users = PageHelper.startPage( pageNum,pageSize);
    List<User> userList = userDao.selectRelevanceUsers();
    PageInfo<User> pageInfo = new PageInfo<>(userList);
    return pageInfo;
  }

  @Override
  public User selectById(int id) {
    User user = userDao.selectById(id);
    return user;
  }

  @Override
  public boolean removeUser(int id) {
    return userDao.removeUser(id);
  }

  @Override
  public void deleteUsers(Integer[] integers) {
    for(Integer i :integers){
      userDao.removeUser(i);
    }
  }

  @Override
  public PageInfo<User> selectUsersBySearchPage(int pageNum, int pageSize,String studentInfo) {
    Page<User> users = PageHelper.startPage( pageNum,pageSize);
    List<User> userList = userDao.selectUsersBySearchPage("%"+studentInfo+"%");
    PageInfo<User> pageInfo = new PageInfo<>(userList);
    return pageInfo;
  }

  @Override
  public void updateUser(User user, Integer[] roles) {
      //直接调用baseservice去修改用户，角色在下面修改
    //this.update(user);
    System.out.println(user);
    super.update(user);
    roleDao.deleteById(user.getId());
    userRole.add("t_user_role",new Object[]{null,user.getId(),roles[0]});
  }

  @Override
  public int selectByNameAndMiMa(String username, String password) {
    return userDao.selectByNameAndMiMa(username, password);
  }
}
