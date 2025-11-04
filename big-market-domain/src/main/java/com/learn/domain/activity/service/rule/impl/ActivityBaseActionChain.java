package com.learn.domain.activity.service.rule.impl;


import com.learn.domain.activity.model.entity.ActivityCountEntity;
import com.learn.domain.activity.model.entity.ActivityEntity;
import com.learn.domain.activity.model.entity.ActivitySkuEntity;
import com.learn.domain.activity.service.rule.AbstractActionChain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author Carton
 * @date 2025/11/4 20:14
 * @description TODO: 活动规则过滤【日期、状态】
 */

@Slf4j
@Component("activity_base_action")
public class ActivityBaseActionChain extends AbstractActionChain {

    @Override
    public boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {

        log.info("活动责任链-基础信息【有效期、状态】校验开始。");
        return next().action(activitySkuEntity, activityEntity, activityCountEntity);
    }
}
