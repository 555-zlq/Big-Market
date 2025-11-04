package com.learn.domain.activity.service.rule.impl;


import com.learn.domain.activity.model.entity.ActivityCountEntity;
import com.learn.domain.activity.model.entity.ActivityEntity;
import com.learn.domain.activity.model.entity.ActivitySkuEntity;
import com.learn.domain.activity.service.rule.AbstractActionChain;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author Carton
 * @date 2025/11/4 20:16
 * @description TODO: 商品库存规则节点
 */

@Slf4j
@Component("activity_sku_stock_action")
public class ActivitySkuStockActionChain extends AbstractActionChain {

    @Override
    public boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        log.info("活动责任链-商品库存处理【校验&扣减】开始。");

        return true;
    }
}
