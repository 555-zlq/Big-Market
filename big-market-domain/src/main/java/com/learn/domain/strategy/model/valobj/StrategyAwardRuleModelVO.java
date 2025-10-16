package com.learn.domain.strategy.model.valobj;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/10/13 21:31
 * @description TODO: 策略奖品对应的规则模型对象，只用来数据库的查询
 */

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyAwardRuleModelVO {

    private String ruleModels;



}
