package com.learn.domain.strategy.service.rule.tree.factory;


import com.learn.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.learn.domain.strategy.model.valobj.RuleTreeVO;
import com.learn.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.learn.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import com.learn.domain.strategy.service.rule.tree.factory.engine.impl.DecisionTreeEngine;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Carton
 * @date 2025/10/15 15:50
 * @description TODO: 规则树工厂
 */

@Service
public class DefaultTreeFactory {

    private final Map<String, ILogicTreeNode> logicTreeNodeGroup;

    public DefaultTreeFactory(Map<String, ILogicTreeNode> logicTreeNodeGroup) {
        this.logicTreeNodeGroup = logicTreeNodeGroup;
    }

    public IDecisionTreeEngine openLogicTree(RuleTreeVO ruleTreeVO) {
        return new DecisionTreeEngine(ruleTreeVO, logicTreeNodeGroup);
    }

    /** 决策树动作信息 */
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class TreeActionEntity {
        private RuleLogicCheckTypeVO ruleLogicCheckTypeVO;
        private StrategyAwardVO strategyAwardData;
    }


    /** 抽奖奖品信息 */
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class StrategyAwardVO {
        private Long awardID;
        // 抽奖奖品规则
        private String awardRuleValue;
    }
}
