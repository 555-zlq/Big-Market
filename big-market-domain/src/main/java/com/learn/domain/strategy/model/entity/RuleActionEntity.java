package com.learn.domain.strategy.model.entity;


import com.learn.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import lombok.*;

/**
 * @author Carton
 * @date 2025/10/10 11:00
 * @description TODO: 抽奖规则动作实体，其实就是定义了一个结构体代表抽奖得到的信息
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RuleActionEntity<T extends RuleActionEntity.RaffleEntity> {

    private String code = RuleLogicCheckTypeVO.ALLOW.getCode();
    private String info = RuleLogicCheckTypeVO.ALLOW.getInfo();

    private String ruleModel;
    private T data;

    static public class RaffleEntity {

    }

    @EqualsAndHashCode(callSuper = true) // 生成equals和hashcode方法，callSuper代表考虑父类的元素
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    static public class RaffleBeforeEntity extends RaffleEntity{
        private Long strategyId;
        private String ruleWeightValueKey;
        private Long awardId;
    }

    static public class RaffleCenterEntity extends RaffleEntity{

    }

    static public class RaffleAfterEntity extends RaffleEntity{

    }
}
