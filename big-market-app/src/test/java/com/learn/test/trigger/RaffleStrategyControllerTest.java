package com.learn.test.trigger;


import com.alibaba.fastjson.JSON;
import com.learn.api.IRaffleStrategyService;
import com.learn.api.dto.RaffleAwardListRequestDTO;
import com.learn.api.dto.RaffleAwardListResponseDTO;
import com.learn.api.dto.RaffleStrategyRuleWeightRequestDTO;
import com.learn.api.dto.RaffleStrategyRuleWeightResponseDTO;
import com.learn.api.response.Response;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Carton
 * @date 2025/11/17 16:04
 * @description TODO: 营销抽奖服务测试
 */

@Slf4j
@SpringBootTest
@RunWith(SpringRunner.class)
public class RaffleStrategyControllerTest {

    @Resource
    private IRaffleStrategyService raffleStrategyService;

    @Test
    public void test_queryRaffleAwardList() {
        RaffleAwardListRequestDTO request = new RaffleAwardListRequestDTO();
        request.setUserId("carton");
        request.setActivityId(100301L);
        Response<List<RaffleAwardListResponseDTO>> response = raffleStrategyService.queryRaffleAwardList(request);

        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));
    }

    @Test
    public void test_queryRaffleStrategyRuleWeight() {
        RaffleStrategyRuleWeightRequestDTO request = new RaffleStrategyRuleWeightRequestDTO();
        request.setUserId("carton");
        request.setActivityId(100301L);

        Response<List<RaffleStrategyRuleWeightResponseDTO>> response = raffleStrategyService.queryRaffleStrategyRuleWeight(request);
        log.info("请求参数：{}", JSON.toJSONString(request));
        log.info("测试结果：{}", JSON.toJSONString(response));
    }



}
