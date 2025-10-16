package com.learn.infrastructure.persistent.po;


import lombok.Data;

import java.util.Date;

/**
 * @author Carton
 * @date 2025/10/16 20:53
 * @description TODO: 规则树节点
 */
@Data
public class RuleTreeNode {

    /** 自增id */
    private Long id;
    /** 规则树id */
    private String treeId;
    /** 规则key */
    private String ruleKey;
    /** 规则描述 */
    private String ruleDesc;
    /** 规则比值 */
    private String ruleValue;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;

}
