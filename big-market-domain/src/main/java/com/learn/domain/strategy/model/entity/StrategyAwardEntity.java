package com.learn.domain.strategy.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Carton
 * @date 2025/9/28 22:21
 * @description TODO:策略奖品的实体
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyAwardEntity {

    /** 抽奖策略id */
    private Long strategyId;
    /** 抽奖奖品id */
    private Long awardId;
    /** 抽奖奖品标题 */
    private String awardTitle;
    /** 抽奖奖品副标题 */
    private String awardSubTitle;
    /** 奖品中奖概率 */
    private BigDecimal awardRate;
    /** 奖品库存总量 */
    private Integer awardCount;
    /** 奖品库存剩余 */
    private Integer awardCountSurplus;
    /** 抽奖奖品排序 */
    private Integer sort;
}
