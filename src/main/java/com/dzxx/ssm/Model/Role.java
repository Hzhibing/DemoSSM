package com.dzxx.ssm.Model;

public class Role {
    private String name;
    private Integer id;
    private String code;
    public void setName(String name) {
        this.name = name;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public Integer getId() {
        return id;
    }

    public String getCode() {
        return code;
    }


    @Override
    public String toString() {
        return "Role{" +
                "name='" + name + '\'' +

                ", id=" + id +
                ", code='" + code + '\'' +
                '}';
    }
}
