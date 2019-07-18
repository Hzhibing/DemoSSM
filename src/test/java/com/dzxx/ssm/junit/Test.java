package com.dzxx.ssm.junit;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;

public class Test {
    @org.junit.Test
    public void test(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring.xml");
        DataSource dataSource = (DataSource)applicationContext.getBean("dataSource");
        System.out.println("数据源对象为："+dataSource.getClass());
    }
}
