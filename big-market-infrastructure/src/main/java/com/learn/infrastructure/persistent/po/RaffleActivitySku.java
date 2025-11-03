package com.learn.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * (RaffleActivitySku)实体类
 *
 * @author makejava
 * @since 2025-11-03 20:26:10
 */
@Data
public class RaffleActivitySku implements Serializable {
    private static final long serialVersionUID = -32782962161050527L;
    /**
     * 自增ID
     */
    private Integer id;
    /**
     * 商品sku - 把每一个组合当做一个商品
     */
    private Long sku;
    /**
     * 活动ID
     */
    private Long activityId;
    /**
     * 活动个人参与次数ID
     */
    private Long activityCountId;
    /**
     * 商品库存
     */
    private Integer stockCount;
    /**
     * 剩余库存
     */
    private Integer stockCountSurplus;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

}

