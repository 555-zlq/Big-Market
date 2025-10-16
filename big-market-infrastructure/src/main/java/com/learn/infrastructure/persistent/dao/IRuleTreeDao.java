package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.RuleTree;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Carton
 * @date 2025/10/16 21:00
 * @description TODO: 规则树表dao
 */

@Mapper
public interface IRuleTreeDao {
    RuleTree queryRuleTreeByTreeId(String treeId);
}
