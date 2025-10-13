package com.learn.domain.strategy.service.raffle;


import com.learn.domain.strategy.model.entity.RaffleAwardEntity;
import com.learn.domain.strategy.model.entity.RaffleFactoryEntity;
import com.learn.domain.strategy.model.entity.RuleActionEntity;
import com.learn.domain.strategy.model.entity.StrategyEntity;
import com.learn.domain.strategy.model.vo.RuleLogicCheckTypeVO;
import com.learn.domain.strategy.repository.IStrategyRepository;
import com.learn.domain.strategy.service.IRaffleStrategy;
import com.learn.domain.strategy.service.armory.IStrategyDispatch;
import com.learn.domain.strategy.service.rule.factory.DefaultLogicFactory;
import com.learn.types.enums.ResponseCode;
import com.learn.types.exception.AppException;
import org.apache.commons.lang3.StringUtils;

/**
 * @author Carton
 * @date 2025/10/10 10:46
 * @description TODO: 模板模式定义抽奖流程 抽奖策略抽象类
 * @description 使用的是模板设计模式，在父类中定义通用的算法流程，在子类中实现可变的部分
 */

public abstract class AbstractRaffleStrategy implements IRaffleStrategy {

    // protected关键字，代表可以被继承访问，不可以被外部类访问，常用在抽象类的设计中
    protected IStrategyRepository repository;

    protected IStrategyDispatch strategyDispatch;

    public AbstractRaffleStrategy(IStrategyRepository repository, IStrategyDispatch strategyDispatch) {
        this.repository = repository;
        this.strategyDispatch = strategyDispatch;
    }

    @Override
    public RaffleAwardEntity performRaffle(RaffleFactoryEntity raffleFactoryEntity) {
        // 1. 参数校验
        String userId = raffleFactoryEntity.getUserId();
        Long strategyId = raffleFactoryEntity.getStrategyId();
        // isBlank()函数判断是否为空白字符串，包括空格，制表符等等
        if (null == strategyId || StringUtils.isBlank((userId))) {
            throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
        }

        // 2. 策略查询
        StrategyEntity strategy = repository.queryStrategyEntityByStrategyId(strategyId);

        // 3. 抽奖前-规则过滤
        RuleActionEntity<RuleActionEntity.RaffleBeforeEntity> ruleActionEntity = this.doCheckRaffleBeforeLogic(RaffleFactoryEntity.builder().userId(userId).strategyId(strategyId).build(), strategy.ruleModels());

        if (RuleLogicCheckTypeVO.TAKE_OVER.getCode().equals(ruleActionEntity.getCode())) {
            if (DefaultLogicFactory.LogicModel.RULE_BLACKLIST.getCode().equals(ruleActionEntity.getRuleModel())) {
                return RaffleAwardEntity.builder()
                        .awardId(ruleActionEntity.getData().getAwardId())
                        .build();
            } else if (DefaultLogicFactory.LogicModel.RULE_WIGHT.getCode().equals(ruleActionEntity.getRuleModel())) {
                // 根据返回的信息进行抽奖
                RuleActionEntity.RaffleBeforeEntity raffleBeforeEntity = ruleActionEntity.getData();
                String ruleWeightValueKey = raffleBeforeEntity.getRuleWeightValueKey();

                Integer awardId = strategyDispatch.getRandomAwardId(strategyId, ruleWeightValueKey);
                return RaffleAwardEntity.builder()
                        .awardId(Long.valueOf(awardId))
                        .build();
            }
        }

        Integer awardId = strategyDispatch.getRandomAwardId(strategyId);

        return RaffleAwardEntity.builder()
                .awardId(Long.valueOf(awardId))
                .build();
    }

    protected abstract RuleActionEntity<RuleActionEntity.RaffleBeforeEntity> doCheckRaffleBeforeLogic(RaffleFactoryEntity bulid, String ...logics);
}
