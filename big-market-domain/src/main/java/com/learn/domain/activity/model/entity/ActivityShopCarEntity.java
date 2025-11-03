package com.learn.domain.activity.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/11/3 20:51
 * @description TODO: 活动购物车实体对象
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActivityShopCarEntity {

    /** 用户ID */
    private String userID;

    /** 商品sku */
    private Long sku;
}
