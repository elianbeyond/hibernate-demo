package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name="cart",schema = "backend")
@Data
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Integer id;
    private Integer userId;

    private Integer productId;

    private Integer quantity;
}
