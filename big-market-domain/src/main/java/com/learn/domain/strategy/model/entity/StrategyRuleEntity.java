package com.learn.domain.strategy.model.entity;


import com.learn.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Carton
 * @date 2025/10/9 21:29
 * @description TODO: 策略规则实体
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyRuleEntity {
    /** 策略id */
    private Long strategyId;
    /** 奖品id */
    private Long awardId;
    /** 抽奖规则类型【1-策略规则，2-奖品规则】 */
    private String ruleType;
    /** 抽奖规则类型【rule_lock】 */
    private String ruleModel;
    /** 抽奖规则比值 */
    private String ruleValue;
    /** 抽奖规则描述 */
    private String ruleDesc;

//    将字符串进行分割“4000:102,103,104,105 5000:102,103,104,105,106 6000:102,103,104,105,106,107,108,109”
    public Map<String, List<Long>> getRuleWeightValues() {
        if (!"rule_weight".equals(ruleModel)) return null;
        String[] ruleValueGroups = ruleValue.split(Constants.SPACE);
        Map<String, List<Long>> resultMap = new HashMap<>();
        for (String ruleValueGroup : ruleValueGroups) {
            if (ruleValueGroup == null || ruleValueGroup.isEmpty()) {
                return resultMap;
            }

           // 分割字符串
            String[] parts = ruleValueGroup.split(Constants.COLON);
            if (parts.length != 2) {
                throw new IllegalArgumentException("rule_weight rule_value invalid input format" + ruleValueGroup);
            }

            // 解析值
            String[] valueStrings = parts[1].split(Constants.SPLIT);
            List<Long> values = new ArrayList<>();
            for (String valueString : valueStrings) {
                values.add(Long.valueOf(valueString));
            }

            resultMap.put(ruleValueGroup, values);
        }

        return resultMap;
    }
}
