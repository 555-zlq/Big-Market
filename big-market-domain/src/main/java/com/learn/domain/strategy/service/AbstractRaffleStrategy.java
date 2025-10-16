package com.learn.domain.strategy.service;


import com.learn.domain.strategy.model.entity.RaffleAwardEntity;
import com.learn.domain.strategy.model.entity.RaffleFactoryEntity;
import com.learn.domain.strategy.repository.IStrategyRepository;
import com.learn.domain.strategy.service.armory.IStrategyDispatch;
import com.learn.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import com.learn.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
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
    // 策略仓储服务，提供对数据库的操作
    protected IStrategyRepository repository;

    // 策略调度服务，只负责抽奖处理，隔离职责
    protected IStrategyDispatch strategyDispatch;

    // 抽奖的责任链 -> 从抽奖的规则中，解耦出前置规则为责任链处理
    protected final DefaultChainFactory defaultChainFactory;

    // 抽奖的决策树 -> 负责抽奖中到抽奖后的规则过滤
    protected final DefaultTreeFactory defaultTreeFactory;

    public AbstractRaffleStrategy(IStrategyRepository repository, IStrategyDispatch strategyDispatch, DefaultChainFactory defaultChainFactory, DefaultTreeFactory defaultTreeFactory) {
        this.repository = repository;
        this.strategyDispatch = strategyDispatch;
        this.defaultChainFactory = defaultChainFactory;
        this.defaultTreeFactory = defaultTreeFactory;
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

        // 2. 责任链抽奖计算【这步拿到的是初步的抽奖ID，之后需要根据ID处理抽奖】注意；黑名单、权重等非默认抽奖的直接返回抽奖结果
        DefaultChainFactory.StrategyAwardVO chainStrategyAwardVO = raffleLogicChain(userId, strategyId);
        log.info("抽奖策略计算-责任链 {} {} {} {}", userId, strategyId, chainStrategyAwardVO.getAwardId(), chainStrategyAwardVO.getLogicModel());
        if (!DefaultChainFactory.LogicModel.RULE_DEFAULT.getCode().equals(chainStrategyAwardVO.getLogicModel())) {
            return RaffleAwardEntity.builder()
                    .awardId(chainStrategyAwardVO.getAwardId())
                    .build();
        }

        // 3. 规则树抽奖过滤【奖品ID，会根据抽奖次数判断、库存判断、兜底兜里返回最终的可获得奖品信息】
        DefaultTreeFactory.StrategyAwardVO treeStrategyAwardVO = raffleLogicTree(userId, strategyId, chainStrategyAwardVO.getAwardId());
        log.info("抽奖策略计算-规则树 {} {} {} {}", userId, strategyId, treeStrategyAwardVO.getAwardID(), treeStrategyAwardVO.getAwardRuleValue());

        return RaffleAwardEntity.builder()
                .awardId(treeStrategyAwardVO.getAwardID())
                .awardConfig(treeStrategyAwardVO.getAwardRuleValue())
                .build();

    }

    public abstract DefaultChainFactory.StrategyAwardVO raffleLogicChain(String userId, Long strategyId);

    public abstract DefaultTreeFactory.StrategyAwardVO raffleLogicTree(String userId, Long strategyId, Long awardId);

}