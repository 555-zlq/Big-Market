package com.learn.infrastructure.persistent.po;


import lombok.Data;

import java.util.Date;

/**
 * @author Carton
 * @date 2025/9/25 16:29
 * @description TODO: 抽奖的策略规则
 */

@Data
public class StrategyRule {


    /** 自增id */
    private Long id;
    /** 策略id */
    private Long strategyId;
    /** 奖品id */
    private Long awardId;
    /** 抽奖规则类型【1-策略规则，2-奖品规则】 */
    private String ruleType;
    /** 抽奖规则类型【rule_lock】 */
    private String ruleModel;
    /** 抽奖规则比值 */
    private Integer ruleValue;
    /** 抽奖规则描述 */
    private String ruleDesc;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;
}
