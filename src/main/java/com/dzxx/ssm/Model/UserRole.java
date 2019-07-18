package com.dzxx.ssm.Model;

public class UserRole {
    private Integer id;
    private Integer userid;
    private Integer roleid;
    public Integer getId() {
        return id;
    }

    public Integer getUserid() {
        return userid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    @Override
    public String toString() {
        return "UserRole{" +
                "id=" + id +
                ", userid=" + userid +
                ", roleid=" + roleid +
                '}';
    }
}
