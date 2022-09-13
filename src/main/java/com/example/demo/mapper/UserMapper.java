package com.example.demo.mapper;

import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

//spring-data-jpa支持自定义简单函数，Respository会根据函数名，自动生成sql
//直接使用，无需实现函数体
//可以查看日志，生成的sql，类似：
//select * from user where name=?


public interface UserMapper extends CrudRepository<User, Integer> {

    public User findUserByUsername(String username);

}
