package com.learn.domain.activity.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Carton
 * @date 2025/11/3 20:47
 * @description TODO: 活动状态值对象
 */

@Getter
@AllArgsConstructor
public enum ActivityStateVO {
    create("create", "创建"),
    open("open", "开始"),
    close("close", "关闭"),
    ;

    private final String code;
    private final String info;
}
