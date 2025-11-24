package com.learn.domain.strategy.service;


import com.learn.domain.strategy.model.valobj.RuleWeightVO;

import java.util.List;
import java.util.Map;

/**
 * @author Carton
 * @date 2025/11/16 16:14
 * @description TODO: 抽奖规则接口
 */

public interface IRaffleRule {

    /**
     * 根据规则树ID集合查询奖品中加锁数量的配置「部分奖品需要抽奖N次解锁」
     *
     * @param treeIds 规则树ID
     * @return 规则树的加锁值
     */
    Map<String, Integer> queryAwardRuleLockCount(String[] treeIds);

    List<RuleWeightVO> queryAwardRuleWeightByActivityId(Long activityId);

    List<RuleWeightVO> queryAwardRuleWeight(Long strategyId);


}
