package com.learn.domain.activity.repository;


import com.learn.domain.activity.model.aggregate.CreateOrderAggregate;
import com.learn.domain.activity.model.entity.ActivityCountEntity;
import com.learn.domain.activity.model.entity.ActivityEntity;
import com.learn.domain.activity.model.entity.ActivitySkuEntity;

/**
 * @author Carton
 * @date 2025/11/3 20:57
 * @description TODO: 抽奖活动仓储实体
 */

public interface IActivityRepository {

    ActivitySkuEntity queryActivitySku(Long sku);

    ActivityEntity queryRaffleActivityByActivityId(Long activityId);

    ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId);

    void doSaveOrder(CreateOrderAggregate createOrderAggregate);
}
