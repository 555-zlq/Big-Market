package com.learn.domain.strategy.repository;


import com.learn.domain.strategy.model.entity.StrategyAwardEntity;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
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
     * @param strategyId
     * @param rateRange
     * @param shuffleStrategyAwardSearchRateTable
     * @description 将打乱后的概率-奖品表存储到redis中
     */
    void storeStrategyAwardSearchRateTables(Long strategyId, Integer rateRange, HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTable);

    /**
     * 获取策略所对应的一系列概率值
     *
     * @param strategyId
     */
    int getRateRange(Long strategyId);

    /**
     * 根据随机生成的值获取策略实体
     *
     * @param strategyId
     * @param i
     */
    Integer getStrategyAwardAssemble(Long strategyId, int i);
}
