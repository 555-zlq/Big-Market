package com.learn.infrastructure.persistent.dao;


import cn.bugstack.middleware.db.router.annotation.DBRouter;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import com.learn.infrastructure.persistent.po.UserRaffleOrder;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Carton
 * @date 2025/11/9 14:50
 * @description TODO: 用户抽奖订单表
 */

@Mapper
@DBRouterStrategy(splitTable = true)
public interface IUserRaffleOrderDao {
    void insert(UserRaffleOrder build);

    @DBRouter
    UserRaffleOrder queryNoUsedRaffleOrder(UserRaffleOrder userRaffleOrderReq);
}
