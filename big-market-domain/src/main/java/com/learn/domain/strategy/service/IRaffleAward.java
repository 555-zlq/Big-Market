package com.learn.domain.strategy.service;


import com.learn.domain.strategy.model.entity.StrategyAwardEntity;

import java.util.List;

/**
 * @author Carton
 * @date 2025/10/26 15:20
 * @description TODO: 策略奖品接口
 */

public interface IRaffleAward {

    /**
     * 根据策略id查询抽奖奖品列表
     *
     * @param strategyId 策略Id
     * @return 奖品列表
     */
    List<StrategyAwardEntity> queryRaffleStrategyAwardList(Long strategyId);

    List<StrategyAwardEntity> queryRaffleStrategyAwardListByActivityId(Long activityId);
}
