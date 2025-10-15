package com.learn.domain.strategy.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * @author Carton
 * @date 2025/10/15 11:29
 * @description TODO: 规则树对象
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeVO {
    /** 规则树 id*/
    private Integer treeId;
    /** 规则树 名称*/
    private String  treeName;
    /** 规则树 描述*/
    private String treeDesc;
    /** 规则树 根节点*/
    private String treeRootRuleNode;

    /** 规则节点 */
    private Map<String, RuleTreeNodeVO> treeNodeMap;
}
