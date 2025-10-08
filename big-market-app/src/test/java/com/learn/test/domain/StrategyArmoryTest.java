package com.learn.test.domain;


import com.learn.domain.strategy.service.armory.IStrategyArmory;
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
public class StrategyArmoryTest {

    @Resource
    private IStrategyArmory strategyArmory;

    @Test
    public void test_strategyArmory() {
        strategyArmory.assembleLotteryStrategy(10001L);

    }

    @Test
    public void test_getAssembleRandomVal() {
        log.info("测试结果：{} - 奖品id值", strategyArmory.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyArmory.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyArmory.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyArmory.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyArmory.getRandomAwardId(10001L));
        log.info("测试结果：{} - 奖品id值", strategyArmory.getRandomAwardId(10001L));
    }
}
