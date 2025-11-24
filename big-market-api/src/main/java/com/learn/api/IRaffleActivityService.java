package com.learn.api;


import com.learn.api.dto.ActivityDrawRequestDTO;
import com.learn.api.dto.ActivityDrawResponseDTO;
import com.learn.api.dto.UserActivityAccountRequestDTO;
import com.learn.api.dto.UserActivityAccountResponseDTO;
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


    /**
     * 日历签到返利接口
     *
     * @param userId 用户ID
     * @return 签到结果
     */
    Response<Boolean> calendarSignRebate(String userId);

    /**
     * 判断是否完成日历签到返利接口
     *
     * @param userId 用户ID
     * @return 签到结果 true 已签到，false 未签到
     */
    Response<Boolean> isCalendarSignRebate(String userId);

    /**
     * 查询用户活动账户
     *
     * @param request 请求对象「活动ID、用户ID」
     * @return 返回结果「总额度、月额度、日额度」
     */
    Response<UserActivityAccountResponseDTO> queryUserActivityAccount(UserActivityAccountRequestDTO request);

}
