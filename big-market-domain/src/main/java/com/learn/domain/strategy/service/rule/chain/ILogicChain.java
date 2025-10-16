package com.learn.domain.strategy.service.rule.chain;


import com.learn.domain.strategy.service.rule.chain.factory.DefaultChainFactory;

/**
 * @author Carton
 * @date 2025/10/14 11:06
 * @description TODO: 责任链接口
 */

public interface ILogicChain extends ILogicChainArmory{

    DefaultChainFactory.StrategyAwardVO logic(String userId, Long strategyId);
}
