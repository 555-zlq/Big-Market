package com.learn.domain.strategy.service.rule.tree.factory.engine.impl;


import com.learn.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.learn.domain.strategy.model.valobj.RuleTreeNodeLineVO;
import com.learn.domain.strategy.model.valobj.RuleTreeNodeVO;
import com.learn.domain.strategy.model.valobj.RuleTreeVO;
import com.learn.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.learn.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import com.learn.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

/**
 * @author Carton
 * @date 2025/10/15 15:51
 * @description TODO: 决策树引擎，就是实现决策树节点连接的部分
 */

@Slf4j
public class DecisionTreeEngine implements IDecisionTreeEngine {

    private Map<String, ILogicTreeNode> logicTreeNodeGroup;

    private final RuleTreeVO ruleTreeVO;

    public DecisionTreeEngine(RuleTreeVO ruleTreeVO, Map<String, ILogicTreeNode> logicTreeNodeGroup) {
        this.ruleTreeVO = ruleTreeVO;
        this.logicTreeNodeGroup = logicTreeNodeGroup;
    }


    @Override
    public DefaultTreeFactory.StrategyAwardVO process(String userId, Long strategyId, Long awardId) {
        DefaultTreeFactory.StrategyAwardVO strategyAwardData = null;

        // 获取基础信息
        String nextNode = ruleTreeVO.getTreeRootRuleNode();
        Map<String, RuleTreeNodeVO> treeNodeVOMap = ruleTreeVO.getTreeNodeMap();

        // 获取起点信息
        RuleTreeNodeVO ruleTreeNode = treeNodeVOMap.get(nextNode);
        while (null != nextNode) {
            // 获取决策节点
            ILogicTreeNode logicTreeNode = logicTreeNodeGroup.get(ruleTreeNode.getRuleKey());

            // 决策节点计算
            DefaultTreeFactory.TreeActionEntity logicEntity = logicTreeNode.logic(userId, strategyId, awardId);
            RuleLogicCheckTypeVO ruleLogicCheckTypeVO = logicEntity.getRuleLogicCheckTypeVO();
            strategyAwardData = logicEntity.getStrategyAwardData();
            log.info("决策树引擎【{}】treeId: {} node:{} code:{}", ruleTreeVO.getTreeName(), ruleTreeVO.getTreeId(), nextNode, ruleLogicCheckTypeVO.getCode());

            // 获取下一个节点
            nextNode = nextNode(ruleLogicCheckTypeVO.getCode(), ruleTreeNode.getTreeNodeLineVOList());
            ruleTreeNode = treeNodeVOMap.get(nextNode);
        }

        return strategyAwardData;
    }

    private String nextNode(String matterValue, List<RuleTreeNodeLineVO> treeNodeLineVOList) {
        if (null == treeNodeLineVOList || treeNodeLineVOList.isEmpty()) return null;
        for (RuleTreeNodeLineVO nodeLine : treeNodeLineVOList) {
            if (decisionLogic(matterValue, nodeLine)) {
                return nodeLine.getRuleNodeTo();
            }
        }
        throw new RuntimeException("决策树引擎，nextNode计算失败 未找到可执行的节点");
    }

    private boolean decisionLogic(String matterValue, RuleTreeNodeLineVO nodeLine) {
        switch (nodeLine.getRuleLimitTypeVO()) {
            case EQUAL:
                return matterValue.equals(nodeLine.getRuleLimitValue().getCode());
            case GE:
            case GT:
            case LE:
            case LT:
            default:
                return false;
        }
    }


}
