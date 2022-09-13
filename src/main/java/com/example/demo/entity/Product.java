package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;


@Entity
@Table(name="product",schema = "backend")
@Data
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productId;

    private Integer userId;

    private String name;

    private String category;

    private String location;

    private double price;

    private Integer quantity;
}
