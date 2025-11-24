package com.learn.domain.rebate.repository;


import com.learn.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import com.learn.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import com.learn.domain.rebate.model.valobj.BehaviorTypeVO;
import com.learn.domain.rebate.model.valobj.DailyBehaviorRebateVO;

import java.util.List;

/**
 * @author Carton
 * @date 2025/11/20 16:14
 * @description TODO: 返利行为仓储接口
 */

public interface IBehaviorRebateRepository {
    
    List<DailyBehaviorRebateVO> queryDailyBehaviorRebateConfig(BehaviorTypeVO behaviorTypeVO);

    void saveUserRebateRecord(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates);

    List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo);
}
