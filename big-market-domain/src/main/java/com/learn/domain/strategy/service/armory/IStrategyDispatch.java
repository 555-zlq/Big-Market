package com.learn.domain.strategy.service.armory;


import java.util.Date;

/**
 * @author Carton
 * @date 2025/10/9 10:38
 * @description TODO: 策略抽奖的调度接口
 */

public interface IStrategyDispatch {

    /**
     * 根据策略id获取随机奖品
     *
     * @param strategyId
     *
     */
    Integer getRandomAwardId(Long strategyId);

    /**
     * 根据策略id以及规则权重值获取随机奖品
     *
     * @param strategyId
     * @param ruleWeightValue
     *
     */
    Integer getRandomAwardId(Long strategyId, String ruleWeightValue);

    Boolean subtractionAwardStock(Long strategyId, Long awardId, Date endDateTime);

}
