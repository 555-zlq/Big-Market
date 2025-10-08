package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.Strategy;
import com.learn.infrastructure.persistent.po.StrategyRule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Carton
 * @date 2025/9/25 16:50
 * @description TODO: 抽奖的策略规则 Dao
 */

@Mapper
public interface IStrategyRuleDao {

    List<StrategyRule> queryStrategyRuleList();
}
