package com.learn.domain.strategy.service.rule.tree.impl;


import com.learn.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.learn.domain.strategy.service.rule.tree.ILogicTreeNode;
import com.learn.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author Carton
 * @date 2025/10/15 11:27
 * @description TODO:
 */


@Slf4j
@Component("rule_stock")
public class RuleStockLogicTreeNode implements ILogicTreeNode {
    @Override
    public DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Long awardID) {
        return DefaultTreeFactory.TreeActionEntity.builder()
                .ruleLogicCheckTypeVO(RuleLogicCheckTypeVO.TAKE_OVER)
                .build();
    }
}
