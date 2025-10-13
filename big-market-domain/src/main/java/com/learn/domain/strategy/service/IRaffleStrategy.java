package com.learn.domain.strategy.service;


import com.learn.domain.strategy.model.entity.RaffleAwardEntity;
import com.learn.domain.strategy.model.entity.RaffleFactoryEntity;

/**
 * @author Carton
 * @date 2025/10/10 10:36
 * @description TODO: 抽奖策略的接口
 */

public interface IRaffleStrategy {

    RaffleAwardEntity performRaffle(RaffleFactoryEntity raffleFactoryEntity);
}
