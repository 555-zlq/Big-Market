package com.learn.domain.strategy.service.rule.chain;


/**
 * @author Carton
 * @date 2025/10/14 11:06
 * @description TODO: 责任链装配接口
 */

public interface ILogicChainArmory {

    ILogicChain next();

    ILogicChain appendNext(ILogicChain next);
}
