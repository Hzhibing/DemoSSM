package com.dzxx.ssm.Service;

import com.dzxx.ssm.Dao.BaseDao;
import com.dzxx.ssm.Model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;

public class UserRoleImpl extends BaseServiceImpl<UserRole> {
    @Autowired
    private BaseDao baseDao;
    @Override
    public BaseDao getBaseDao() {
        return baseDao;
    }
}
