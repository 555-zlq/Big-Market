package com.learn.domain.activity.service;


import com.learn.domain.activity.model.entity.PartakeRaffleActivityEntity;
import com.learn.domain.activity.model.entity.UserRaffleOrderEntity;

/**
 * @author Carton
 * @date 2025/11/10 21:30
 * @description TODO: 抽奖活动参与服务
 */

public interface IRaffleActivityPartakeService {

    /**
     * 根据参与抽奖活动实体返回订单
     *
     * @param partakeRaffleActivityEntity 抽奖活动实体
     * @return 订单实体
     */
    UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);

    UserRaffleOrderEntity createOrder(String userId, Long activityId);
}
