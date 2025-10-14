package com.learn.domain.strategy.service.rule.filter;


import com.learn.domain.strategy.model.entity.RuleActionEntity;
import com.learn.domain.strategy.model.entity.RuleMatterEntity;

/**
 * @author Carton
 * @date 2025/10/10 10:54
 * @description TODO: 抽奖规则过滤接口
 */

public interface ILogicFilter<T extends RuleActionEntity.RaffleEntity> {

    // 根据抽奖过滤信息过滤出抽奖信息实体
    RuleActionEntity<T> filter(RuleMatterEntity ruleMatterEntity);
}
