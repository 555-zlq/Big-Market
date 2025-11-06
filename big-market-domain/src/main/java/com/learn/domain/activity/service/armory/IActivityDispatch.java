package com.learn.domain.activity.service.armory;


import java.util.Date;

/**
 * @author Carton
 * @date 2025/11/5 21:38
 * @description TODO: 活动调度扣减库存
 */

public interface IActivityDispatch {
    /**
     *  根据sku 扣减奖品缓存库存
     *
     * @param sku 活动sku
     * @param endDateTime 活动结束时间
     * @return 是否成功
     */
    boolean subtractionActivitySkuStock(Long sku, Date endDateTime);
}
