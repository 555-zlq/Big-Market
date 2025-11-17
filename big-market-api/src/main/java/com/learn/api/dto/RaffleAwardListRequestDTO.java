package com.learn.api.dto;


import lombok.Data;

/**
 * @author Carton
 * @date 2025/10/26 14:12
 * @description TODO: 抽奖奖品请求实体
 */

@Data
public class RaffleAwardListRequestDTO {

    // 抽奖策略id
    @Deprecated
    private Long strategyId;

    private String userId;

    private Long activityId;
}
