package com.example.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name="order",schema = "backend")
//因为jpa在映射实体是需要一个id，使用联合主键
@IdClass(Order.class)
public class Order implements Serializable {
    @Id
    private Integer productId;
    @Id
    private Integer userId;

    private Integer warehouse_id;

    private Integer quantity;

}
