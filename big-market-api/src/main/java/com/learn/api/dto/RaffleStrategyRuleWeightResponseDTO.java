package com.learn.api.dto;


import lombok.Data;

import java.util.List;

/**
 * @author Carton
 * @date 2025/11/24 22:47
 * @description TODO: 策略服务请求抽奖权重信息返回对象
 */

@Data
public class RaffleStrategyRuleWeightResponseDTO {
    // 权重规则配置的抽奖次数
    private Integer ruleWeightCount;
    // 用户在一个活动下完成的总抽奖次数
    private Integer userActivityAccountTotalUseCount;
    // 当前可抽奖范围
    private List<StrategyAward> strategyAwards;

    @Data
    public static class StrategyAward {
        // 奖品ID
        private Integer awardId;
        // 奖品标题
        private String awardTitle;
    }

}
