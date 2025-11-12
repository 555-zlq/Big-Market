package com.learn.domain.award.model.entity;


import com.learn.domain.award.event.SendAwardMessageEvent;
import com.learn.domain.award.model.valobj.TaskStateVO;
import com.learn.types.events.BaseEvent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Carton
 * @date 2025/11/12 15:35
 * @description TODO: 任务实体对象
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TaskEntity {

    /** 活动Id */
    private String userId;
    /** 消息主题 */
    private String topic;
    /** 消息编号 */
    private String messageId;
    /** 消息主体 */
    private BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> message;
    /** 任务状态 */
    private TaskStateVO state;
}
