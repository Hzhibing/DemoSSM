package com.dzxx.ssm.Service;

import com.dzxx.ssm.Dao.BaseDao;
import com.dzxx.ssm.Dao.UserDao;
import com.dzxx.ssm.Model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
    @Autowired
    private UserDao userDao;
    @Override
    public BaseDao getBaseDao() {
        return userDao;
    }
}
