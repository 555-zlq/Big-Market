package com.learn.infrastructure.persistent.po;


import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Carton
 * @date 2025/9/25 16:20
 * @description TODO: 策略奖品的明细配置
 */

@Data
public class StrategyAward {

    /** 自增id */
    private Long id;
    /** 抽奖策略id */
    private Long strategyId;
    /** 抽奖奖品id */
    private Long awardId;
    /** 抽奖奖品title */
    private String awardTitle;
    /** 抽奖奖品副标题 */
    private String awardSubTitle;
    /** 奖品库存总量 */
    private Integer awardCount;
    /** 奖品库存剩余 */
    private Integer awardCountSurplus;
    /** 规则模型 */
    private String ruleModels;
    /** 奖品中奖概率 */
    private BigDecimal awardRate;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;
    /** 奖品顺序 */
    private Integer sort;

}
