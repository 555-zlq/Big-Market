package com.learn.infrastructure.persistent.dao;

import cn.bugstack.middleware.db.router.annotation.DBRouter;
import com.learn.infrastructure.persistent.po.RaffleActivityAccount;
import org.apache.ibatis.annotations.Mapper;

/**
 * 抽奖活动账户表(RaffleActivityAccount)表数据库访问层
 *
 * @author makejava
 * @since 2025-10-30 23:31:26
 */
@Mapper
public interface IRaffleActivityAccountDao {

    int updateAccountQuota(RaffleActivityAccount activityAccount);

    void insert(RaffleActivityAccount activityAccount);

    @DBRouter
    RaffleActivityAccount queryActivityAccountByUserId(RaffleActivityAccount raffleActivityAccountReq);

    int updateActivityAccountSubtractionQuota(RaffleActivityAccount raffleActivityAccount);

    void updateActivityAccountMonthSurplusImageQuota(RaffleActivityAccount raffleActivityAccount);

    void updateActivityAccountDaySurplusImageQuota(RaffleActivityAccount raffleActivityAccount);

}

