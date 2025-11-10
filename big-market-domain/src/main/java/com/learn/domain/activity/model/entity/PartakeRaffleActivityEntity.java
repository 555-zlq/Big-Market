package com.learn.domain.activity.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/11/10 21:31
 * @description TODO: 参与抽奖活动实体对象
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PartakeRaffleActivityEntity {

    private String userId;

    private Long activityId;
}
