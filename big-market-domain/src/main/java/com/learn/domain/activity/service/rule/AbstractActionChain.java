package com.learn.domain.activity.service.rule;


/**
 * @author Carton
 * @date 2025/11/4 20:12
 * @description TODO: 下单规则责任链的抽象类
 */

public abstract class AbstractActionChain implements IActionChain{

    private IActionChain next;

    @Override
    public IActionChain next() {
        return next;
    }

    @Override
    public IActionChain appendNext(IActionChain next) {
        this.next = next;
        return next;
    }
}
