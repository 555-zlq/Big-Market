package com.learn.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * (RaffleActivity)实体类
 *
 * @author makejava
 * @since 2025-10-30 21:55:21
 */
@Data
public class RaffleActivity implements Serializable {
    private static final long serialVersionUID = -62805302459735615L;
    /**
     * 自增id
     */
    private Long id;
    /**
     * 活动id
     */
    private Long activityId;
    /**
     * 活动名称
     */
    private String activityName;
    /**
     * 活动描述
     */
    private String activityDesc;
    /**
     * 开始时间
     */
    private Date beginDateTime;
    /**
     * 结束时间
     */
    private Date endDateTime;
    /**
     * 库存总量
     */
    private Integer stockCount;
    /**
     * 剩余库存
     */
    private Integer stockCountSurplus;
    /**
     * 活动参与次数配置
     */
    private Long activityCountId;
    /**
     * 抽奖策略ID
     */
    private Long strategyId;
    /**
     * 活动状态
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

