package com.learn.domain.activity.service;


import com.learn.domain.activity.model.valobj.ActivitySkuStockKeyVO;

/**
 * @author Carton
 * @date 2025/11/6 16:20
 * @description TODO: 活动sku库存处理接口
 */

public interface IRaffleActivitySkuStockService {

    /**
     * 获取活动sku的消耗队列
     *
     * @return 奖品库存key的信息
     * @throws InterruptedException 异常
     */
    ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException;

    /**
     * 清空队列
     */
    void clearQueueValue();

    /**
     * 延迟队列 + 任务趋势更新活动库存
     * @param sku sku
     */
    void updateActivitySkuStock(Long sku);

    /**
     * 缓存库存以消耗完成
     *
     * @param sku sku
     */
    void clearActivitySkuStock(Long sku);
}
