package com.learn.domain.strategy.service.rule.tree.factory.engine;


import com.learn.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.learn.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;

/**
 * @author Carton
 * @date 2025/10/15 15:51
 * @description TODO: 规则树组合接口
 */

public interface IDecisionTreeEngine {
    DefaultTreeFactory.StrategyAwardData process (String userId, Long strategyId, Long awardId);
}
