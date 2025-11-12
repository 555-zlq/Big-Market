package com.learn.domain.task.service;




import com.learn.domain.task.model.entity.TaskEntity;

import java.util.List;

/**
 * @author Carton
 * @date 2025/11/12 19:11
 * @description TODO: 消息任务服务接口
 */

public interface ITaskService {

    List<TaskEntity> queryNoSendMessageTaskList();

    void sendMessage(TaskEntity taskEntity);

    void updateTaskSendMessageCompleted(String userId, String messageId);

    void updateTaskSendMessageFail(String userId, String messageId);
}
