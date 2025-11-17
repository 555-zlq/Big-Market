package com.learn.api.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/10/26 14:13
 * @description TODO: 抽奖奖品列表响应实体
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleAwardListResponseDTO {

    /** 奖品id */
    private Integer awardId;
    /** 奖品标题 */
    private String awardTitle;
    /** 奖品副标题 */
    private String awardSubTitle;
    /** 奖品排序 */
    private Integer sort;
    /** 抽奖N次后解锁，没有配置则为空 */
    private Integer awardRuleLockCount;
    /** 奖品是否上锁 */
    private Boolean isAwardUnlock;
    /** 奖品还剩几次解锁 */
    private Integer waitUnlockCount;

}
