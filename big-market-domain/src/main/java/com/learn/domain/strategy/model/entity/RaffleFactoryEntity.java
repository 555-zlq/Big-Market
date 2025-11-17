package com.learn.domain.strategy.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Carton
 * @date 2025/10/10 10:39
 * @description TODO: 抽奖因子实体
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleFactoryEntity {

    private String userId;
    private Long strategyId;
    private Long awardId;
    /**
     * 结束时间
     */
    private Date endDateTime;
}
