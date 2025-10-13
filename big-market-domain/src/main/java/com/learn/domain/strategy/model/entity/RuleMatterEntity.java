package com.learn.domain.strategy.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/10/10 10:56
 * @description TODO: 规则物料实体对象，根据哪些规则进行过滤
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleMatterEntity {

    private String userId;
    /** 抽奖策略id */
    private  Long strategyId;
    /** 抽奖奖品ID - 内部流转使用 */
    private Long awardId;
    /** 抽奖规则类型【rule_random - 随机值计算、rule_lock - 抽奖几次后解锁、 rule_luck_award - 幸运值兜底奖品】 */
    private String ruleModel;
}
