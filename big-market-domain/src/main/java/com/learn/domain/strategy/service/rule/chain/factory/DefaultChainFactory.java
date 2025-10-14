package com.learn.domain.strategy.service.rule.chain.factory;


import com.learn.domain.strategy.model.entity.StrategyEntity;
import com.learn.domain.strategy.repository.IStrategyRepository;
import com.learn.domain.strategy.service.rule.chain.ILogicChain;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Carton
 * @date 2025/10/14 20:06
 * @description TODO: 工厂
 */

@Service
public class DefaultChainFactory {

    // Spring的自动分组装配会根据beanName进行自动装配
    private final Map<String, ILogicChain> logicChainGroup;
    protected IStrategyRepository repository;

    public DefaultChainFactory(Map<String, ILogicChain> logicChainGroup, IStrategyRepository repository) {
        this.logicChainGroup = logicChainGroup;
        this.repository = repository;
    }

    public ILogicChain openLogicChain(Long strategyId) {
        StrategyEntity strategy = repository.queryStrategyEntityByStrategyId(strategyId);
        String[] ruledModels = strategy.ruleModels();

        // 如果没有配置策略规则，只有一个默认
        if (null == ruledModels || 0 == ruledModels.length) return logicChainGroup.get("default");

        // 按照配置顺序装填用户配置的责任链；rule_blacklist、rule_weight 「注意此数据从Redis缓存中获取，如果更新库表，记得在测试阶段手动处理缓存」
        ILogicChain logicChain = logicChainGroup.get(ruledModels[0]);
        ILogicChain current = logicChain;
        for (int i = 1; i < ruledModels.length; i++) {
            ILogicChain nextChain = logicChainGroup.get(ruledModels[i]);
            current = current.appendNext(nextChain);
        }

        current.appendNext(logicChainGroup.get("default"));

        return logicChain;
    }
}
