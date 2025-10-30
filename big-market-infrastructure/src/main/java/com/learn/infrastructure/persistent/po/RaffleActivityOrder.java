package com.learn.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * 抽奖活动单(RaffleActivityOrder)实体类
 *
 * @author makejava
 * @since 2025-10-30 22:00:22
 */
@Data
public class RaffleActivityOrder implements Serializable {
    private static final long serialVersionUID = -50848760601581546L;
    /**
     * 自增ID
     */
    private Long id;
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 活动ID
     */
    private Long activityId;
    /**
     * 活动名称
     */
    private String activityName;
    /**
     * 抽奖策略ID
     */
    private Long strategyId;
    /**
     * 订单ID
     */
    private String orderId;
    /**
     * 下单时间
     */
    private Date orderTime;
    /**
     * 订单状态（not_used、used、expire）
     */
    private String state;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

}

