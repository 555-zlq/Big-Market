package com.learn.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * 抽奖活动次数配置表(RaffleActivityCount)实体类
 *
 * @author makejava
 * @since 2025-10-30 21:58:01
 */

@Data
public class RaffleActivityCount implements Serializable {
    private static final long serialVersionUID = 247364505001177433L;
    /**
     * 自增ID
     */
    private Long id;
    /**
     * 活动次数编号
     */
    private Long activityCountId;
    /**
     * 总次数
     */
    private Integer totalCount;
    /**
     * 日次数
     */
    private Integer dayCount;
    /**
     * 月次数
     */
    private Integer monthCount;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

}

