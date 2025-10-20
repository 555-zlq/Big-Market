package com.learn.domain.strategy.service;


import com.learn.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

/**
 * @author Carton
 * @date 2025/10/20 15:43
 * @description TODO: 抽奖库存相关服务，获取库存消耗队列
 */

public interface IRaffleStock {

    /**
     * 获取奖品库存的消耗队列
     *
     * @return 奖品库存的key信息
     * @throws InterruptedException 异常
     */
    StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException;

    /**
     * 更新库存消耗记录
     *
     * @param strategyId
     * @param awardId
     */
    void updateStrategyAwardStock(Long strategyId, Long awardId);
}
