package com.learn.domain.strategy.service.rule.tree;


import com.learn.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;

import java.util.Date;

/**
 * @author Carton
 * @date 2025/10/15 11:24
 * @description TODO: 规则树接口
 */

public interface ILogicTreeNode {

    DefaultTreeFactory.TreeActionEntity logic(String userId, Long strategyId, Long awardId, String ruleValue, Date endDateTime);

}
