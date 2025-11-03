package com.learn.infrastructure.persistent.dao;

import com.learn.infrastructure.persistent.po.RaffleActivityCount;
import org.apache.ibatis.annotations.Mapper;

/**
 * 抽奖活动次数配置表(RaffleActivityCount)表数据库访问层
 *
 * @author makejava
 * @since 2025-10-30 23:27:10
 */
@Mapper
public interface IRaffleActivityCountDao {

    RaffleActivityCount queryRaffleActivityCountByActivityCountId(Long activityCountId);

}

