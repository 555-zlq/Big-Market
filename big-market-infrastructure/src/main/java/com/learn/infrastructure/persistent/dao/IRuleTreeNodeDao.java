package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.RuleTreeNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Carton
 * @date 2025/10/16 21:02
 * @description TODO: 规则树节点表DAO
 */

@Mapper
public interface IRuleTreeNodeDao {
    List<RuleTreeNode> queryRuleTreeNodeListByTreeId(String treeId);

    List<RuleTreeNode> queryRuleLocks(String[] treeIds);
}
