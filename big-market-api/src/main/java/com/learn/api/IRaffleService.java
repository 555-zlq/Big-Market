package com.learn.api;


import com.learn.api.dto.RaffleAwardListRequestDTO;
import com.learn.api.dto.RaffleAwardListResponseDTO;
import com.learn.api.dto.RaffleRequestDTO;
import com.learn.api.dto.RaffleResponseDTO;
import com.learn.api.response.Response;

import java.util.List;

/**
 * @author Carton
 * @date 2025/10/26 14:04
 * @description TODO: 抽奖服务的接口
 */

public interface IRaffleService {

    /**
     * 策略装配接口
     *
     * @param strategyId 策略id
     * @return 是否装配成功地响应信息
     */
    Response<Boolean> strategyArmory(Long strategyId);

    /**
     * 获取抽奖奖品列表接口
     *
     * @param raffleAwardListRequest 抽奖奖品请求
     * @return 抽奖响应奖品列表
     */
    Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(RaffleAwardListRequestDTO raffleAwardListRequest);

    /**
     * 随机抽奖接口
     *
     * @param raffleRequest 随机抽奖请求
     * @return 随机抽奖响应
     */
    Response<RaffleResponseDTO> randomRaffle(RaffleRequestDTO raffleRequest);
}
