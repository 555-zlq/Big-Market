package com.learn.test.domain;


import com.alibaba.fastjson.JSON;
import com.learn.domain.strategy.model.valobj.*;
import com.learn.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import com.learn.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Carton
 * @date 2025/10/15 19:54
 * @description TODO: 规则树测试
 */

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class LogicTreeTest {

    @Resource
    private DefaultTreeFactory defaultTreeFactory;

    /**
     * rule_lock --左--> rule_luck_award
     *           --右--> rule_stock --右--> rule_luck_award
     */
    @Test
    public void test_tree_rule() {
        // 构建参数
        RuleTreeNodeVO rule_lock = RuleTreeNodeVO.builder()
                .treeId("100000001")
                .ruleKey("rule_lock")
                .ruleDesc("限定用户已完成N次抽奖后解锁")
                .ruleValue("1")
                // 双花括号语法，匿名子类的实例初始化块
                .treeNodeLineVOList(new ArrayList<RuleTreeNodeLineVO>() {{
                    add(RuleTreeNodeLineVO.builder()
                            .treeId("100000001")
                            .ruleNodeFrom("rule_lock")
                            .ruleNodeTo("rule_luck_award")
                            .ruleLimitTypeVO(RuleLimitTypeVO.EQUAL)
                            .ruleLimitValue(RuleLogicCheckTypeVO.TAKE_OVER)
                            .build());

                    add(RuleTreeNodeLineVO.builder()
                            .treeId("100000001")
                            .ruleNodeFrom("rule_lock")
                            .ruleNodeTo("rule_stock")
                            .ruleLimitTypeVO(RuleLimitTypeVO.EQUAL)
                            .ruleLimitValue(RuleLogicCheckTypeVO.ALLOW)
                            .build());
                }})
                .build();

        RuleTreeNodeVO rule_luck_award = RuleTreeNodeVO.builder()
                .treeId("100000001")
                .ruleKey("rule_luck_award")
                .ruleDesc("限定用户已完成N次抽奖后解锁")
                .ruleValue("1")
                .treeNodeLineVOList(null)
                .build();

        RuleTreeNodeVO rule_stock = RuleTreeNodeVO.builder()
                .treeId("100000001")
                .ruleKey("rule_stock")
                .ruleDesc("库存处理规则")
                .ruleValue(null)
                .treeNodeLineVOList(new ArrayList<RuleTreeNodeLineVO>() {{
                    add(RuleTreeNodeLineVO.builder()
                            .treeId("100000001")
                            .ruleNodeFrom("rule_lock")
                            .ruleNodeTo("rule_luck_award")
                            .ruleLimitTypeVO(RuleLimitTypeVO.EQUAL)
                            .ruleLimitValue(RuleLogicCheckTypeVO.TAKE_OVER)
                            .build());
                }})
                .build();

        RuleTreeVO ruleTreeVO = new RuleTreeVO();
        ruleTreeVO.setTreeId("100000001");
        ruleTreeVO.setTreeName("决策树规则；增加dall-e-3画图模型");
        ruleTreeVO.setTreeDesc("决策树规则；增加dall-e-3画图模型");
        ruleTreeVO.setTreeRootRuleNode("rule_lock");

        ruleTreeVO.setTreeNodeMap(new HashMap<String, RuleTreeNodeVO>() {{
            put("rule_lock", rule_lock);
            put("rule_stock", rule_stock);
            put("rule_luck_award", rule_luck_award);
        }});

        IDecisionTreeEngine treeEngine = defaultTreeFactory.openLogicTree(ruleTreeVO);

        DefaultTreeFactory.StrategyAwardVO data = treeEngine.process("carton", 10001L, 100L);
        log.info("测试结果：{}", JSON.toJSONString(data));
    }

}
