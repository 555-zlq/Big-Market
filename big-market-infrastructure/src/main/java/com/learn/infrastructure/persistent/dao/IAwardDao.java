package com.learn.infrastructure.persistent.dao;


import com.learn.infrastructure.persistent.po.Award;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Carton
 * @date 2025/9/25 16:48
 * @description TODO: 奖品配置信息 DAO
 */

@Mapper
public interface IAwardDao {

    List<Award> queryAwardList();


}
