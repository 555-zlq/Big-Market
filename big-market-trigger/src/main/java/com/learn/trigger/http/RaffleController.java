package com.learn.trigger.http;


import com.alibaba.fastjson.JSON;
import com.learn.api.IRaffleService;
import com.learn.api.dto.RaffleAwardListRequestDTO;
import com.learn.api.dto.RaffleAwardListResponseDTO;
import com.learn.api.dto.RaffleRequestDTO;
import com.learn.api.dto.RaffleResponseDTO;
import com.learn.api.response.Response;
import com.learn.domain.strategy.model.entity.RaffleAwardEntity;
import com.learn.domain.strategy.model.entity.RaffleFactoryEntity;
import com.learn.domain.strategy.model.entity.StrategyAwardEntity;
import com.learn.domain.strategy.service.IRaffleAward;
import com.learn.domain.strategy.service.IRaffleStrategy;
import com.learn.domain.strategy.service.armory.IStrategyArmory;
import com.learn.types.enums.ResponseCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Carton
 * @date 2025/10/26 14:51
 * @description TODO: 抽奖服务
 */

@Slf4j
@RestController
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/")
public class RaffleController implements IRaffleService {

    @Resource
    IStrategyArmory strategyArmory;

    @Resource
    IRaffleAward raffleAward;

    @Resource
    IRaffleStrategy raffleStrategy;

    /**
     * 策略装配，将策略信息装配到缓存中
     * <a href="http://localhost:8091/api/v1/raffle/strategy_armory">/api/v1/raffle/strategy_armory</a>
     *
     * @param strategyId 策略id
     * @return 装配结果
     */
    @RequestMapping(value = "strategy_armory", method = RequestMethod.GET)
    @Override
    public Response<Boolean> strategyArmory(@RequestParam Long strategyId) {
        try {
            log.info("抽奖策略装配开始 strategyId：{}", strategyId);
            boolean armoryStatus = strategyArmory.assembleLotteryStrategy(strategyId);
            Response<Boolean> response = Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(armoryStatus)
                    .build();
            log.info("抽奖策略装配完成 strategyId：{} response: {}", strategyId, JSON.toJSONString(response));
            return response;
        } catch (Exception e) {
            log.error("抽奖策略装配失败 strategyId：{}", strategyId, e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    /**
     * 查询奖品列表
     * <a href="http://localhost:8091/api/v1/raffle/query_raffle_award_list">/api/v1/raffle/query_raffle_award_list</a>
     * 请求参数 raw json
     *
     * @param raffleAwardListRequest 抽奖奖品请求
     * @return 奖品列表
     */
    @RequestMapping(value = "query_raffle_award_list", method = RequestMethod.POST)
    @Override
    public Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(@RequestBody RaffleAwardListRequestDTO raffleAwardListRequest) {
        try {
            log.info("查询抽奖奖品列表配开始 strategyId：{}", raffleAwardListRequest.getStrategyId());
            // 查询奖品配置信息
            List<StrategyAwardEntity> strategyAwardEntities = raffleAward.queryRaffleStrategyAwardList(raffleAwardListRequest.getStrategyId());
            List<RaffleAwardListResponseDTO> raffleAwardListResponseDTOS = new ArrayList<>(strategyAwardEntities.size());
            for (StrategyAwardEntity strategyAward : strategyAwardEntities) {
                raffleAwardListResponseDTOS.add(RaffleAwardListResponseDTO.builder()
                                .awardId(Math.toIntExact(strategyAward.getAwardId()))
                                .awardTitle(strategyAward.getAwardTitle())
                                .awardSubTitle(strategyAward.getAwardSubTitle())
                                .sort(strategyAward.getSort())
                                .build());
            }
            Response<List<RaffleAwardListResponseDTO>> response = Response.<List<RaffleAwardListResponseDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(raffleAwardListResponseDTOS)
                    .build();
            log.info("查询抽奖奖品列表配置完成 strategyId：{} response: {}", raffleAwardListRequest.getStrategyId(), JSON.toJSONString(response));
            // 返回结果
            return response;

        } catch (Exception e) {
            log.error("查询抽奖奖品列表配置失败 strategyId：{}", raffleAwardListRequest.getStrategyId(), e);
            return Response.<List<RaffleAwardListResponseDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    /**
     * 随机抽奖接口
     * <a href="http://localhost:8091/api/v1/raffle/random_raffle">/api/v1/raffle/random_raffle</a>
     *
     * @param raffleRequest 随机抽奖请求
     * @return 抽奖结果
     */
    @RequestMapping(value = "random_raffle", method = RequestMethod.POST)
    @Override
    public Response<RaffleResponseDTO> randomRaffle(@RequestBody RaffleRequestDTO raffleRequest) {
        try {
            log.info("随机抽奖开始 strategyId: {}", raffleRequest.getStrategyId());
            // 调用抽奖接口
            RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(RaffleFactoryEntity.builder()
                    .userId("system")
                    .strategyId(raffleRequest.getStrategyId())
                    .build());
            Response<RaffleResponseDTO> response = Response.<RaffleResponseDTO>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(RaffleResponseDTO.builder()
                            .awardId(Math.toIntExact(raffleAwardEntity.getAwardId()))
                            .awardIndex(raffleAwardEntity.getSort())
                            .build())
                    .build();
            log.info("随机抽奖完成 strategyId: {} response: {}", raffleRequest.getStrategyId(), JSON.toJSONString(response));
            return response;

        } catch (Exception e) {
            log.error("随机抽奖失败 strategyId：{}", raffleRequest.getStrategyId(), e);
            return Response.<RaffleResponseDTO>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }
}
