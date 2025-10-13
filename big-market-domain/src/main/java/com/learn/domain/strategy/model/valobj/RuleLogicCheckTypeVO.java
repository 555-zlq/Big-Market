package com.learn.domain.strategy.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Carton
 * @date 2025/10/10 11:12
 * @description TODO: 规则过滤校验类型值对象
 */

@Getter
@AllArgsConstructor
public enum RuleLogicCheckTypeVO {

    ALLOW("0000", "放行，执行后续的流程，不受规则引擎的影响"),
    TAKE_OVER("0001", "接管，后续的流程， 受规则引擎的影响"),
    ;

    private final String code;
    private final String info;
}
