package com.learn.infrastructure.persistent.po;


import lombok.Data;

import java.util.Date;

/**
 * @author Carton
 * @date 2025/9/25 15:56
 * @description TODO: 抽奖策略
 */

@Data /* lombok注入get set方法 */
public class Strategy {

    /** 自增索引*/
    private Long  id;
    /** 抽奖策略id*/
    private Long  strategyId;
    /** 抽奖策略描述*/
    private String  strategyDesc;
    /** 创建时间*/
    private Date createTime;
    /** 更新时间*/
    private Date  updateTime;
    /** 策略模型*/
    private String  ruleModels;

}
