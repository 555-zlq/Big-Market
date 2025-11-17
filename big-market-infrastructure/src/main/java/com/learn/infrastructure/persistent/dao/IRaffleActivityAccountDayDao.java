package com.learn.infrastructure.persistent.dao;


import cn.bugstack.middleware.db.router.annotation.DBRouter;
import com.learn.infrastructure.persistent.po.RaffleActivityAccountDay;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Carton
 * @date 2025/11/9 14:47
 * @description TODO: 抽奖活动账户表-日次数
 */
@Mapper
public interface IRaffleActivityAccountDayDao {

    @DBRouter
    RaffleActivityAccountDay queryActivityAccountDayByUserId(RaffleActivityAccountDay raffleActivityAccountDayReq);

    void insertActivityAccountDay(RaffleActivityAccountDay build);

    int updateActivityAccountDaySubtractionQuota(RaffleActivityAccountDay build);

    @DBRouter
    Integer queryRaffleActivityAccountDayPartakeCount(RaffleActivityAccountDay raffleActivityAccountDay);
}
