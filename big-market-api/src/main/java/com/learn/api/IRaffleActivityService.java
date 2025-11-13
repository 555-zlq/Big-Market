package com.learn.api;


import com.learn.api.dto.ActivityDrawRequestDTO;
import com.learn.api.dto.ActivityDrawResponseDTO;
import com.learn.api.response.Response;

/**
 * @author Carton
 * @date 2025/11/13 21:27
 * @description TODO: 抽奖活动服务
 */

public interface IRaffleActivityService {

    /**
     * 活动装配，数据到缓存
     *
     * @param activityId 活动id
     * @return 成功
     */
    Response<Boolean> armory(Long activityId);

    /**
     * 抽奖活动接口
     *
     * @param request 请求对象
     * @return 返回结果
     */
    Response<ActivityDrawResponseDTO> draw(ActivityDrawRequestDTO request);


}
