package com.learn.domain.strategy.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Carton
 * @date 2025/10/15 11:29
 * @description TODO: 规则树节点对象
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeNodeVO {

    /** 规则 树ID*/
    private Integer treeId;
    /** 规则 Key*/
    private String ruleKey;
    /** 规则 描述*/
    private String ruleDesc;
    /** 规则 比值*/
    private String ruleValue;
    /** 规则 连线*/
    private List<RuleTreeNodeLineVO> treeNodeLineVOList;
}
