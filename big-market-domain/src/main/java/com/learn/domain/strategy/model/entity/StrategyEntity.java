package com.learn.domain.strategy.model.entity;


import com.learn.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.StringUtils;

/**
 * @author Carton
 * @date 2025/10/9 11:03
 * @description TODO: 策略实体
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StrategyEntity {

    /** 抽奖策略id*/
    private Long  strategyId;
    /** 抽奖策略描述*/
    private String  strategyDesc;
    /** 策略模型*/
    private String  ruleModels;

    public String[] ruleModels() {
        // isBlank函数判断字符串是否为空，包括为null, "", "   "
        if (StringUtils.isBlank(ruleModels)) return null;
        return ruleModels.split(Constants.SPLIT);
    }

    public String getRuleWeight() {
        String[] ruledModels = this.ruleModels();
        if (null == ruledModels) return null;
        for (String ruleModel : ruledModels) {
            if ("rule_weight".equals(ruleModel)) return ruleModel;
        }
        return null;
    }
}
