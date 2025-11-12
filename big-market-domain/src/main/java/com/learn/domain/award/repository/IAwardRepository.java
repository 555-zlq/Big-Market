package com.learn.domain.award.repository;


import com.learn.domain.award.model.aggregate.UserAwardRecordAggregate;

/**
 * @author Carton
 * @date 2025/11/12 15:25
 * @description TODO: 奖品的仓储接口
 */

public interface IAwardRepository {
    void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate);
}
