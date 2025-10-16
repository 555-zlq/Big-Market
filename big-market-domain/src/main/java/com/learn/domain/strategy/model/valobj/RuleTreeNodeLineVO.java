package com.learn.domain.strategy.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/10/15 11:30
 * @description TODO: 规则树节点指向线对象，用于衔接 from -> to
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleTreeNodeLineVO {

    /** 规则树 ID */
    private String treeId;
    /** 规则 key 结点 from*/
    private String ruleNodeFrom;
    /** 规则 key 结点 to*/
    private String ruleNodeTo;
    /** 规则 限定类型 */
    private RuleLimitTypeVO ruleLimitTypeVO;
    /** 规则 限定值*/
    private RuleLogicCheckTypeVO ruleLimitValue;
}
