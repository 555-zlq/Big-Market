package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.RuleTreeNodeLine;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Carton
 * @date 2025/10/16 21:02
 * @description TODO: 规则树连线表接口
 */

@Mapper
public interface IRuleTreeNodeLineDao {
    List<RuleTreeNodeLine> queryRuleTreeNodeLineListByTreeId(String treeId);
}
