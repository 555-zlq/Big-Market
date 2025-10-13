package com.learn.domain.strategy.service.rule.factory;


import com.learn.domain.strategy.model.entity.RuleActionEntity;
import com.learn.domain.strategy.service.annotation.LogicStrategy;
import com.learn.domain.strategy.service.rule.ILogicFilter;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author Carton
 * @date 2025/10/10 17:26
 * @description TODO: 规则工厂 + 策略模式
 */

@Service
public class DefaultLogicFactory {

    // 存的是过滤器名字->过滤器实例 ？代表通配符，兼容所有泛型版本的ILogicFilter
    // ConcurrentHashMap是线程安全的HashMap
    public Map<String, ILogicFilter<?>> logicFilterMap = new ConcurrentHashMap<>();

    /**
     *
     * @param logicFilters 所有实现了ILogicFilter的过滤器实例
     */
    public DefaultLogicFactory(List<ILogicFilter<?>> logicFilters) {
        logicFilters.forEach(logic -> {
            // AnnotationUtils.findAnnotation() 获取过滤器类上标注的@LogicStrategy注解实例
            // 返回值strategy就是一个注解，其中的logicMode()已经被赋为相应的值
            LogicStrategy strategy = AnnotationUtils.findAnnotation(logic.getClass(), LogicStrategy.class);
            if (null != strategy) {
                logicFilterMap.put(strategy.logicMode().getCode(), logic);
            }
        });
    }

    /**
     * 泛型开放方法，桥梁作用
     * 为什么说是桥梁作用，底层存储的是没有类型的过滤器，通过泛型投影 + 强制转换，让编译器能正确识别其类型
     *
     * @return Map<String, ILogicFilter<T>> 就是说要返回一个带类型信息的过滤器
     * @param <T> 调用这个方法时，可指定一个参数，它必须继承或实现 RuleActionEntity.RaffleEntity
     */
    public <T extends RuleActionEntity.RaffleEntity> Map<String, ILogicFilter<T>> openLogicFilter() {

        // 两层强制转换，泛型安全桥接技巧
        // Map<?,?> 消除编译器对泛型不匹配的抱怨，再转换为期望类型
        return (Map<String, ILogicFilter<T>>) (Map<?, ?>) logicFilterMap;
    }

    @Getter
    @AllArgsConstructor
    public enum LogicModel {

        RULE_WIGHT("rule_weight","【抽奖前规则】根据抽奖权重返回可抽奖范围KEY", "before"),
        RULE_BLACKLIST("rule_blacklist","【抽奖前规则】黑名单规则过滤，命中黑名单则直接返回", "before"),
        RULE_LOCK("rule_lock","【抽奖中规则】解锁规则过滤，若没有解锁返回保底奖品", "center"),

        ;

        private final String code;
        private final String info;
        private final String stage;

        public static boolean isCenter(String ruleModel) {
            return "center".equals(LogicModel.valueOf(ruleModel.toUpperCase()).stage);
        }



    }


}
