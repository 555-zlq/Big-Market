package com.learn.domain.activity.service.quota.rule.factory;


import com.learn.domain.activity.service.quota.rule.IActionChain;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Carton
 * @date 2025/11/4 20:18
 * @description TODO: 责任链工厂
 */

@Service
public class DefaultActivityChainFactory {

    private final IActionChain actionChain;

    public DefaultActivityChainFactory(Map<String, IActionChain> actionChainGroup) {
        actionChain = actionChainGroup.get(ActionModel.activity_base_action.code);
        actionChain.appendNext((actionChainGroup.get(ActionModel.activity_sku_stock_action.code)));
    }

    public IActionChain openActionChain() {
        return this.actionChain;
    }


    @Getter
    @AllArgsConstructor
    public enum ActionModel {
        activity_base_action("activity_base_action", "活动的库存、时间校验"),
        activity_sku_stock_action("activity_sku_stock_action", "活动sku库存"),
        ;

        private final String code;
        private final String info;
    }
}
