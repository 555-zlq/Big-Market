package com.learn.api.dto;


import lombok.Data;

/**
 * @author Carton
 * @date 2025/11/24 22:16
 * @description TODO: 用户活动账户数量配置的请求接口
 */

@Data
public class UserActivityAccountRequestDTO {

    private Long activityId;

    private String userId;
}
