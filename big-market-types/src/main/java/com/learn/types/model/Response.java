package com.learn.types.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author Carton
 * @date 2025/10/26 14:07
 * @description TODO: 通用的响应
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Response<T> implements Serializable {

    private String code;
    private String info;
    private T data;
}
