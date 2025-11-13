package com.learn.infrastructure.persistent.dao;

import com.learn.infrastructure.persistent.po.RaffleActivity;
import org.apache.ibatis.annotations.Mapper;

/**
 * (RaffleActivity)表数据库访问层
 *
 * @author makejava
 * @since 2025-10-30 23:27:10
 */

@Mapper
public interface IRaffleActivityDao {

    RaffleActivity queryRaffleActivityByActivityId(long l);

    Long queryStrategyIdByActivityId(Long activityId);

    Long queryActivityIdByStrategyId(Long strategyId);
}

