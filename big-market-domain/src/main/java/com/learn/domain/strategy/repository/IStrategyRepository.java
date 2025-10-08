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

    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    void storeStrategyAwardSearchRateTables(Long strategyId, Integer rateRange, HashMap<Integer, Integer> shuffleStrategyAwardSearchRateTable);

    int getRateRange(Long strategyId);

    Integer getStrategyAwardAssemble(Long strategyId, int i);
}
