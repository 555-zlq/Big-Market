package com.learn.infrastructure.persistent.dao;


import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import com.learn.infrastructure.persistent.po.UserBehaviorRebateOrder;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Carton
 * @date 2025/11/20 15:33
 * @description TODO: 用户行为返利流水订单表
 */

@Mapper
@DBRouterStrategy(splitTable = true)
public interface IUserBehaviorRebateOrderDao {

    void insert(UserBehaviorRebateOrder userBehaviorRebateOrder);
}
