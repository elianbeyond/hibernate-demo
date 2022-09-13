package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name="voucher",schema = "backend")
@Data
public class Voucher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer userId;

    private String name;

    private double price;
}
