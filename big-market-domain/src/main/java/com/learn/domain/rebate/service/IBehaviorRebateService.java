package com.learn.domain.rebate.service;


import com.learn.domain.rebate.model.entity.BehaviorEntity;
import com.learn.domain.rebate.model.entity.BehaviorRebateOrderEntity;

import java.util.List;

/**
 * @author Carton
 * @date 2025/11/20 16:06
 * @description TODO: 行为返利服务接口
 */

public interface IBehaviorRebateService {

    /**
     * 创建行为动作的入账订单
     *
     * @param behaviorEntity 行为实体对象
     * @return 订单列表
     */
    List<String> createOrder(BehaviorEntity behaviorEntity);

    /**
     * 根据外部单号查询订单
     *
     * @param userId        用户ID
     * @param outBusinessNo 业务ID；签到则是日期字符串，支付则是外部的业务ID
     * @return 返利订单实体
     */
    List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo);

}
