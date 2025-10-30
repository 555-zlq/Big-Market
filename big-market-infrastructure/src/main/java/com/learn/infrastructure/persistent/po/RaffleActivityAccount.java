package com.learn.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * 抽奖活动账户表(RaffleActivityAccount)实体类
 *
 * @author makejava
 * @since 2025-10-30 22:00:22
 */

@Data
public class RaffleActivityAccount implements Serializable {
    private static final long serialVersionUID = -44892350755579494L;
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
     * 总次数
     */
    private Integer totalCount;
    /**
     * 总次数-剩余
     */
    private Integer totalCountSurplus;
    /**
     * 日次数
     */
    private Integer dayCount;
    /**
     * 日次数-剩余
     */
    private Integer dayCountSurplus;
    /**
     * 月次数
     */
    private Integer monthCount;
    /**
     * 月次数-剩余
     */
    private Integer monthCountSurplus;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

}

