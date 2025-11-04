package com.learn.domain.activity.service.rule;


import com.learn.domain.activity.model.entity.ActivityCountEntity;
import com.learn.domain.activity.model.entity.ActivityEntity;
import com.learn.domain.activity.model.entity.ActivitySkuEntity;

/**
 * @author Carton
 * @date 2025/11/4 20:09
 * @description TODO: 活动下单规则过滤接口
 */

public interface IActionChain extends IActionChainArmory{

    boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity);
}
