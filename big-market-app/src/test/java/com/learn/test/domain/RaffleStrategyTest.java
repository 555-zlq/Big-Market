package com.learn.test.domain;


import com.alibaba.fastjson.JSON;
import com.learn.domain.strategy.model.entity.RaffleAwardEntity;
import com.learn.domain.strategy.model.entity.RaffleFactoryEntity;
import com.learn.domain.strategy.service.IRaffleStrategy;
import com.learn.domain.strategy.service.armory.IStrategyArmory;
import com.learn.domain.strategy.service.rule.filter.impl.RuleLockLogicFilter;
import com.learn.domain.strategy.service.rule.filter.impl.RuleWeightLogicFilter;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;

/**
 * @author Carton
 * @date 2025/10/11 15:51
 * @description TODO: 抽奖测试类
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleStrategyTest {

    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IRaffleStrategy raffleStrategy;

    @Resource
    private RuleWeightLogicFilter ruleWeightLogicFilter;
    @Autowired
    private RuleLockLogicFilter ruleLockLogicFilter;

    @Before
    public void setUp() {

        strategyArmory.assembleLotteryStrategy(10001L);
        strategyArmory.assembleLotteryStrategy(10003L);

        ReflectionTestUtils.setField(ruleWeightLogicFilter, "userScore", 3000L);
        ReflectionTestUtils.setField(ruleLockLogicFilter, "userRaffleCount", 0L);
    }

    @Test
    public void test_performRaffle() {
        RaffleFactoryEntity raffleFactoryEntity = RaffleFactoryEntity.builder()
                .userId("carton")
                .strategyId(10001L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactoryEntity);

        log.info("请求参数 {}", JSON.toJSONString(raffleFactoryEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }

    @Test
    public void test_performRaffle_blacklist() {
        RaffleFactoryEntity raffleFactoryEntity = RaffleFactoryEntity.builder()
                .userId("user003")
                .strategyId(10001L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactoryEntity);

        log.info("请求参数 {}", JSON.toJSONString(raffleFactoryEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }

    @Test
    public void test_performRaffle_lock() {
        RaffleFactoryEntity raffleFactoryEntity = RaffleFactoryEntity.builder()
                .userId("yzp")
                .strategyId(10003L)
                .build();

        RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(raffleFactoryEntity);

        log.info("请求参数 {}", JSON.toJSONString(raffleFactoryEntity));
        log.info("测试结果：{}", JSON.toJSONString(raffleAwardEntity));
    }
}
