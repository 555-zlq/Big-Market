package com.learn.trigger.listener;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.learn.domain.activity.service.IRaffleActivitySkuStockService;
import com.learn.types.events.BaseEvent;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Carton
 * @date 2025/11/6 20:09
 * @description TODO: 活动sku库存耗尽
 */

@Slf4j
@Component
public class ActivitySkuStockZeroCustomer {

    @Value("${spring.rabbitmq.topic.activity_sku_stock_zero}")
    private String topic;

    @Resource
    private IRaffleActivitySkuStockService skuStock;

    @RabbitListener(queuesToDeclare = @Queue(value = "activity_sku_stock_zero"))
    public void listener(String message) {
        try {
            log.info("监听活动sku库存消耗为0消息 topic: {} message: {}", topic, message);
            BaseEvent.EventMessage<Long> eventMessage = JSON.parseObject(message, new TypeReference<BaseEvent.EventMessage<Long>>() {}.getType());
            Long sku = eventMessage.getData();
            skuStock.clearQueueValue();
        } catch (Exception e) {
            log.error("监听活动sku库存消耗为0消息， 消费失败 topic:{} message:{}", topic, message);
            throw e;
        }
    }
}
