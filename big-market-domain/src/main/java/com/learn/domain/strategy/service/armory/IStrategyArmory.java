package com.learn.domain.strategy.service.armory;


/**
 * @author Carton
 * @date 2025/9/28 22:10
 * @description TODO: 策略装配工厂，负责初始化简略的计算
 */

public interface IStrategyArmory {

    /***
     *
     * @param strategyId
     * @description 根据策略id直接进行装配
     */
    void assembleLotteryStrategy(Long strategyId);

    Integer getRandomAwardId(Long strategyId);
}
