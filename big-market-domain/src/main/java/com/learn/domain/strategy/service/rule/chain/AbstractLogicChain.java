package com.learn.domain.strategy.service.rule.chain;


/**
 * @author Carton
 * @date 2025/10/14 11:10
 * @description TODO:
 */

public abstract class AbstractLogicChain implements ILogicChain {

    private ILogicChain next;

    @Override
    public ILogicChain next() {
        return next;
    }

    @Override
    public ILogicChain appendNext(ILogicChain next) {
        this.next = next;
        return next;
    }

    // 抽象类使用protected关键字，对外部封闭，对子类开放
    protected abstract String ruleModel();
}
