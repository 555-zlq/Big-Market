package com.learn.test.domain.strategy;


import com.learn.domain.strategy.service.armory.IStrategyArmory;
import com.learn.domain.strategy.service.armory.IStrategyDispatch;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author Carton
 * @date 2025/9/28 23:29
 * @description TODO: 策略概率的装配操作测试
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class StrategyArmoryDispatchTest {

    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IStrategyDispatch strategyDispatch;

    @Test
    public void test_strategyArmory() {
        strategyArmory.assembleLotteryStrategy(10001L);

    }

    @Test
    public void test_getAssembleRandomVal() {
        log.info("测试结果：{} - 奖品id值", strategyDispatch.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyDispatch.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyDispatch.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyDispatch.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyDispatch.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyDispatch.getRandomAwardId(10001L));
    }

    @Test
    public void test_getAssembleRandomVal_byWeightValue() {
        log.info("测试结果：{} - 4000策略配置", strategyDispatch.getRandomAwardId(10001L, "4000:102,103,104,105"));
        log.info("测试结果：{} - 5000策略配置", strategyDispatch.getRandomAwardId(10001L, "5000:102,103,104,105,106"));
        log.info("测试结果：{} - 6000策略配置", strategyDispatch.getRandomAwardId(10001L, "6000:102,103,104,105,106,107,108,109"));
        log.info("测试结果：{} - 4000策略配置", strategyDispatch.getRandomAwardId(10001L, "4000:102,103,104,105"));
        log.info("测试结果：{} - 5000策略配置", strategyDispatch.getRandomAwardId(10001L, "5000:102,103,104,105,106"));
        log.info("测试结果：{} - 6000策略配置", strategyDispatch.getRandomAwardId(10001L, "6000:102,103,104,105,106,107,108,109"));
    }
}
