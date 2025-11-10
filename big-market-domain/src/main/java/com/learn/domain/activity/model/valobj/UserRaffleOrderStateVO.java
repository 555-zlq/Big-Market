package com.learn.domain.activity.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Carton
 * @date 2025/11/10 21:34
 * @description TODO: 用户抽奖订单次数枚举
 */

@Getter
@AllArgsConstructor
public enum UserRaffleOrderStateVO {

    create("create", "创建"),
    used("used", "已使用"),
    cancel("cancel", "已作废"),
    ;

    private final String code;
    private final String desc;

}
