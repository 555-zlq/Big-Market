package com.learn.domain.award.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Carton
 * @date 2025/11/12 15:38
 * @description TODO: 任务状态值对象
 */
@Getter
@AllArgsConstructor
public enum TaskStateVO {

    create("create", "创建"),
    complete("complete", "完成"),
    fail("fail", "失败"),
    ;

    private final String code;
    private final String info;
}
