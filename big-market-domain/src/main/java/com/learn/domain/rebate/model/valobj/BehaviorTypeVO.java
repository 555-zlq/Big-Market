package com.learn.domain.rebate.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Carton
 * @date 2025/11/20 16:09
 * @description TODO: 行为值对象
 */
@Getter
@AllArgsConstructor
public enum BehaviorTypeVO {

    SIGN("sign", "签到（日历）"),
    OPENAI_PAY("openai_pay", "openai 外部支付完成"),
    ;

    private final String code;
    private final String info;

}
