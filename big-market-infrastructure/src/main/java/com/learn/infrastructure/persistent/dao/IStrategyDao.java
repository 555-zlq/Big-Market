package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.Strategy;
import com.learn.infrastructure.persistent.po.StrategyAward;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Carton
 * @date 2025/9/25 16:49
 * @description TODO: 抽奖策略 DAO
 */

@Mapper
public interface IStrategyDao {

    List<Strategy> queryStrategyList();


    Strategy queryStrategyByStrategyId(Long strategyId);
}
