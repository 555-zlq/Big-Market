package com.learn.api.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/10/26 14:20
 * @description TODO: 随机抽奖响应实体
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleStrategyResponseDTO {

    // 奖品ID
    private Integer awardId;

    // 奖品索引
    private Integer awardIndex;
}
