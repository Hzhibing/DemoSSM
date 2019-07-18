package com.dzxx.ssm.Service;

import java.util.List;

public interface BaseService<T> {
    public void add(T t);
    public void addNoMatch(Object[]fileds,Object[]filedValues);
    public void delete(int id);

    public void update(T t);

    public T select(int id);

    public List<T> selectAll();
}
