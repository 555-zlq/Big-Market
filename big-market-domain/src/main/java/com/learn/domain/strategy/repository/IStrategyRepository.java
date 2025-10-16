package com.learn.domain.strategy.repository;


import com.learn.domain.strategy.model.entity.StrategyAwardEntity;
import com.learn.domain.strategy.model.entity.StrategyEntity;
import com.learn.domain.strategy.model.entity.StrategyRuleEntity;
import com.learn.domain.strategy.model.valobj.RuleTreeVO;
import com.learn.domain.strategy.model.valobj.StrategyAwardRuleModelVO;

import java.util.HashMap;
import java.util.List;

/**
 * @author Carton
 * @date 2025/9/28 22:16
 * @description TODO: 策略存储接口
 */
public interface IStrategyRepository {

    /**
     *
     * @param strategyId
     * @return strategyAwardEntities
     * @description 查询策略奖励实体列表
     */
    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    /**
     *
     * @param key
     * @param rateRange
     * @param shuffleStrategyAwardSearchRateTable
     * @description 将打乱后的概率-奖品表存储到redis中
     */
    void storeStrategyAwardSearchRateTables(String key, Integer rateRange, HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTable);

    /**
     * 获取策略所对应的一系列概率值
     *
     * @param strategyId
     */
    int getRateRange(Long strategyId);

    int getRateRange(String key);

    /**
     *
     * @param key
     * @param i
     * @return
     */
    Integer getStrategyAwardAssemble(String key, int i);

    StrategyEntity queryStrategyEntityByStrategyId(Long strategyId);

    StrategyRuleEntity queryStrategyRuleEntity(Long strategyId, String ruleModel);

    String queryStrategyRuleValue(Long strategyId, String ruleModel);

    String queryStrategyRuleValue(Long strategyId, Long awardId, String ruleModel);

    StrategyAwardRuleModelVO queryStrategyAwardRuleModels(Long strategyId, Integer awardId);

    RuleTreeVO queryRuleTreeVOByTreeId(String ruleModels);
}
