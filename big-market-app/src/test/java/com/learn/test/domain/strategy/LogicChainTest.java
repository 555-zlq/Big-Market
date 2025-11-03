package com.learn.test.domain.strategy;


import com.alibaba.fastjson.JSON;
import com.learn.domain.strategy.service.armory.IStrategyArmory;
import com.learn.domain.strategy.service.rule.chain.ILogicChain;
import com.learn.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.learn.domain.strategy.service.rule.chain.impl.RuleWeightLogicChain;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.util.ReflectionTestUtils;

import javax.annotation.Resource;

/**
 * @author Carton
 * @date 2025/10/14 20:25
 * @description TODO: 验证不同的规则下走不同的责任链
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class LogicChainTest {

    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private RuleWeightLogicChain ruleWeightLogicChain;

    @Resource
    private DefaultChainFactory defaultChainFactory;


    @Before
    public void setup() {
        strategyArmory.assembleLotteryStrategy(10001L);

    }

    @Test
    public void test_logicChain_rule_blacklist() {
        ILogicChain logicChain = defaultChainFactory.openLogicChain(10001L);
        DefaultChainFactory.StrategyAwardVO strategyAwardVO = logicChain.logic("user001", 10001L);
        log.info("测试结果：{}", JSON.toJSONString(strategyAwardVO));
    }

    @Test
    public void test_LogicChain_rule_weight() {
        // 通过反射 mock 规则中的值
        ReflectionTestUtils.setField(ruleWeightLogicChain, "userScore", 4900L);

        ILogicChain logicChain = defaultChainFactory.openLogicChain(10001L);
        DefaultChainFactory.StrategyAwardVO strategyAwardVO = logicChain.logic("carton", 10001L);
        log.info("测试结果：{}", strategyAwardVO);
    }

    @Test
    public void test_LogicChain_rule_default() {
        ILogicChain logicChain = defaultChainFactory.openLogicChain(10001L);
        DefaultChainFactory.StrategyAwardVO strategyAwardVO = logicChain.logic("carton", 10001L);
        log.info("测试结果：{}", strategyAwardVO);
    }


}
