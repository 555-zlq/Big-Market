package com.learn.domain.task.repository;


import com.learn.domain.task.model.entity.TaskEntity;

import java.util.List;

/**
 * @author Carton
 * @date 2025/11/12 19:15
 * @description TODO: 任务仓储接口
 */

public interface ITaskRepository {
    List<TaskEntity> queryNoSendMessageTaskList();

    void sendMessage(TaskEntity taskEntity);

    void updateTaskSendMessageCompleted(String userId, String messageId);

    void updateTaskSendMessageFail(String userId, String messageId);
}
