package com.learn.domain.activity.service;


import com.learn.domain.activity.model.entity.ActivityCountEntity;
import com.learn.domain.activity.model.entity.ActivityEntity;
import com.learn.domain.activity.model.entity.ActivitySkuEntity;
import com.learn.domain.activity.repository.IActivityRepository;
import com.learn.domain.activity.service.rule.factory.DefaultActivityChainFactory;

/**
 * @author Carton
 * @date 2025/11/4 20:03
 * @description TODO: 抽奖活动的支撑类
 */

public class RaffleActivitySupport {

    protected DefaultActivityChainFactory defaultActivityChainFactory;

    protected IActivityRepository activityRepository;

    public RaffleActivitySupport(DefaultActivityChainFactory defaultActivityChainFactory, IActivityRepository activityRepository) {
        this.defaultActivityChainFactory = defaultActivityChainFactory;
        this.activityRepository = activityRepository;
    }

    public ActivitySkuEntity queryActivitySku(Long sku) {
        return activityRepository.queryActivitySku(sku);
    }

    public ActivityEntity queryRaffleActivityByActivityId(Long activityId) {
        return activityRepository.queryRaffleActivityByActivityId(activityId);
    }

    public ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId) {
        return activityRepository.queryRaffleActivityCountByActivityCountId(activityCountId);
    }

}
