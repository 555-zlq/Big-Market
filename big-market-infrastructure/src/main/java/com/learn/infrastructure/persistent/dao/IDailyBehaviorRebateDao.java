package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.DailyBehaviorRebate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Carton
 * @date 2025/11/20 15:32
 * @description TODO: 常行为返利活动配置
 */
@Mapper
public interface IDailyBehaviorRebateDao {

    List<DailyBehaviorRebate> queryDailyBehaviorRebateByBehaviorType(String code);
}
