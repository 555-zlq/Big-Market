package com.learn.domain.activity.service.rule;


/**
 * @author Carton
 * @date 2025/11/4 20:10
 * @description TODO: 活动下单的装配接口
 */

public interface IActionChainArmory {

    IActionChain next();

    IActionChain appendNext(IActionChain next);
}
