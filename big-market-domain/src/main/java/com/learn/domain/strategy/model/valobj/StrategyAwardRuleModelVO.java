package com.learn.domain.strategy.model.valobj;


import com.learn.domain.strategy.service.rule.factory.DefaultLogicFactory;
import com.learn.types.common.Constants;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.apache.tomcat.util.bcel.classfile.Constant;

import java.util.ArrayList;
import java.util.List;

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

    public String[] raffleCenterRuleModelList() {
        List<String> ruleModelList = new ArrayList<>();
        String[] ruleModelValues = ruleModels.split(Constants.SPLIT);
        for (String ruleModelValue : ruleModelValues) {
            if (DefaultLogicFactory.LogicModel.isCenter(ruleModelValue)) {
                ruleModelList.add(ruleModelValue);
            }
        }
        return ruleModelList.toArray(new String[0]);
    }

}
