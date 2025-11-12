package com.learn.domain.award.model.aggregate;


import com.learn.domain.award.model.entity.TaskEntity;
import com.learn.domain.award.model.entity.UserAwardRecordEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/11/12 15:43
 * @description TODO:  用户中奖记录聚合对象 【聚合代表一个事务操作】
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAwardRecordAggregate {

    private UserAwardRecordEntity userAwardRecordEntity;

    private TaskEntity taskEntity;
}
