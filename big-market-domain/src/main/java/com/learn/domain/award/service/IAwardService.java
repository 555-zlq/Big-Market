package com.learn.domain.award.service;


import com.learn.domain.award.model.entity.UserAwardRecordEntity;

/**
 * @author Carton
 * @date 2025/11/12 15:13
 * @description TODO: 奖品服务接口
 */

public interface IAwardService {

    void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity);
}
