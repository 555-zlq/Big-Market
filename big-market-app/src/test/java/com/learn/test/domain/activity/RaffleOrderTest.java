package com.learn.test.domain.activity;


import com.alibaba.fastjson.JSON;
import com.learn.domain.activity.model.entity.ActivityOrderEntity;
import com.learn.domain.activity.model.entity.ActivityShopCarEntity;
import com.learn.domain.activity.service.IRaffleOrder;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author Carton
 * @date 2025/11/3 21:20
 * @description TODO: 抽奖活动订单单测
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleOrderTest {

    @Resource
    private IRaffleOrder raffleOrder;

    @Test
    public void test_createRaffleActivityOrder() {
        ActivityShopCarEntity activityShopCarEntity = new ActivityShopCarEntity();
        activityShopCarEntity.setUserID("carton");
        activityShopCarEntity.setSku(9011L);
        ActivityOrderEntity raffleActivityOrder = raffleOrder.createRaffleActivityOrder(activityShopCarEntity);
        log.info("测试结果： {}", JSON.toJSONString(raffleActivityOrder));
    }
}
