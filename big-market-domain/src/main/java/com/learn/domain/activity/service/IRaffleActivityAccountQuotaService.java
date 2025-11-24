package com.learn.domain.activity.service;


import com.learn.domain.activity.model.entity.ActivityAccountEntity;
import com.learn.domain.activity.model.entity.ActivityOrderEntity;
import com.learn.domain.activity.model.entity.ActivityShopCarEntity;
import com.learn.domain.activity.model.entity.SkuRechargeEntity;

/**
 * @author Carton
 * @date 2025/11/3 20:43
 * @description TODO: 抽奖活动订单接口
 */

public interface IRaffleActivityAccountQuotaService {

    /***
     * 以sku创建抽奖活动订单
     *
     * @param activityShopCarEntity 活动sku实体，通过sku领取活动
     * @return 活动参与记录实体
     */
    ActivityOrderEntity createRaffleActivityOrder(ActivityShopCarEntity activityShopCarEntity);

    String createSkuRechargeOrder(SkuRechargeEntity skuRechargeEntity);

    Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId);

    /**
     * 查询活动账户额度「总、月、日」
     *
     * @param activityId 活动ID
     * @param userId     用户ID
     * @return 账户实体
     */
    ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId);

    /**
     * 查询活动账户 - 总，参与次数
     *
     * @param activityId 活动ID
     * @param userId     用户ID
     * @return 参与次数
     */
    Integer queryRaffleActivityAccountPartakeCount(Long activityId, String userId);

}
