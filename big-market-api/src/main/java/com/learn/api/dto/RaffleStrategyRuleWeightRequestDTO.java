package com.learn.api.dto;


import lombok.Data;

/**
 * @author Carton
 * @date 2025/11/24 22:46
 * @description TODO: 策略服务请求抽奖权重信息接口对象
 */

@Data
public class RaffleStrategyRuleWeightRequestDTO {

    // 用户ID
    private String userId;
    // 抽奖活动ID
    private Long activityId;

}
