package com.learn.api.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/11/13 21:34
 * @description TODO: 活动抽奖请求对象
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActivityDrawRequestDTO {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;


}
