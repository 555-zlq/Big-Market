package com.learn.domain.activity.service;


import com.learn.domain.activity.repository.IActivityRepository;
import org.springframework.stereotype.Service;

/**
 * @author Carton
 * @date 2025/11/3 21:29
 * @description TODO: 抽奖活动服务
 */

@Service
public class RaffleActivityService extends AbstractRaffleActivity{

    public RaffleActivityService(IActivityRepository activityRepository) {
        super(activityRepository);
    }
}
