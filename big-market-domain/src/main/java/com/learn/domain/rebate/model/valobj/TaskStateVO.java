package com.learn.domain.rebate.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Carton
 * @date 2025/11/20 16:33
 * @description TODO: 任务状态的枚举类
 */
@Getter
@AllArgsConstructor
public enum TaskStateVO {

    create("create", "创建"),
    complete("complete", "发送完成"),
    fail("fail", "发送失败"),
    ;

    private final String code;
    private final String desc;

}
