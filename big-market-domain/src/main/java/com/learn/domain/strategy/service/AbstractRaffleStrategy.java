package com.learn.domain.strategy.service;


import com.learn.domain.strategy.model.entity.RaffleAwardEntity;
import com.learn.domain.strategy.model.entity.RaffleFactoryEntity;
import com.learn.domain.strategy.model.entity.RuleActionEntity;
import com.learn.domain.strategy.model.valobj.RuleLogicCheckTypeVO;
import com.learn.domain.strategy.model.valobj.StrategyAwardRuleModelVO;
import com.learn.domain.strategy.repository.IStrategyRepository;
import com.learn.domain.strategy.service.armory.IStrategyDispatch;
import com.learn.domain.strategy.service.rule.chain.ILogicChain;
import com.learn.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.learn.types.enums.ResponseCode;
import com.learn.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

/**
 * @author Carton
 * @date 2025/10/10 10:46
 * @description TODO: 模板模式定义抽奖流程 抽奖策略抽象类
 * @description 使用的是模板设计模式，在父类中定义通用的算法流程，在子类中实现可变的部分
 */

@Slf4j
public abstract class AbstractRaffleStrategy implements IRaffleStrategy {

    // protected关键字，代表可以被继承访问，不可以被外部类访问，常用在抽象类的设计中
    protected IStrategyRepository repository;

    protected IStrategyDispatch strategyDispatch;

    private final DefaultChainFactory defaultChainFactory;

    public AbstractRaffleStrategy(IStrategyRepository repository, IStrategyDispatch strategyDispatch, DefaultChainFactory defaultChainFactory) {
        this.repository = repository;
        this.strategyDispatch = strategyDispatch;
        this.defaultChainFactory = defaultChainFactory;
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

        // 2. 获取责任链 - 前置规则的责任链处理
        ILogicChain logicChain = defaultChainFactory.openLogicChain(strategyId);

        // 3. 通过责任链获取奖品id
        Integer awardId = logicChain.logic(userId, strategyId);

        // 4. 查询奖品规则，rule_lock规则：抽奖达到一定次数后解锁
        StrategyAwardRuleModelVO strategyAwardRuleModelVO = repository.queryStrategyAwardRuleModels(strategyId, awardId);

        // 5. 抽奖中规则过滤
        RuleActionEntity<RuleActionEntity.RaffleCenterEntity> ruleActionCenterEntity = this.doCheckRaffleCenterLogic(RaffleFactoryEntity.builder()
                .strategyId(strategyId)
                .userId(userId)
                .awardId(Long.valueOf(awardId))
                .build(), strategyAwardRuleModelVO.raffleCenterRuleModelList());

        if (RuleLogicCheckTypeVO.TAKE_OVER.getCode().equals(ruleActionCenterEntity.getCode())){
            log.info("【临时日志】中奖中规则拦截，通过抽奖后规则 rule_luck_award 走兜底奖励。");
            return RaffleAwardEntity.builder()
                    .awardDesc("中奖中规则拦截，通过抽奖后规则 rule_luck_award 走兜底奖励。")
                    .build();
        }


        return RaffleAwardEntity.builder()
                .awardId(Long.valueOf(awardId))
                .build();
    }

    protected abstract RuleActionEntity<RuleActionEntity.RaffleBeforeEntity> doCheckRaffleBeforeLogic(RaffleFactoryEntity bulid, String ...logics);

    protected abstract RuleActionEntity<RuleActionEntity.RaffleCenterEntity> doCheckRaffleCenterLogic(RaffleFactoryEntity bulid, String ...logics);
}
