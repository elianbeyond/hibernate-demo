package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;



@Entity
@Table(name="user",schema = "backend")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    //实体类字段属性不要使用基本数据类型（比如int ，long等），要使用Long，Integer等包装类
    //hibernate 通过实体bean的set 为实体ben属性赋值
    private Integer id;

    private Integer productId;

    private Integer voucherId;

    private String username;

    private String password;

    private String userEmail;

    private String address;

    private boolean admin;

    private boolean isBan;



}
