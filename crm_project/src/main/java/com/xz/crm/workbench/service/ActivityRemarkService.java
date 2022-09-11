package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.ActivityRemark;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-17-下午 09:31
 * @since 2022/8/17 0017-下午 09:31
 */
public interface ActivityRemarkService {

    int deleteActivityRemarkByActivityId(String[] activityIds);

    List<ActivityRemark> queryActivityRemarkForDetailByActivityId(String activityId);

    int saveCreateActivityRemark(ActivityRemark remark);

    int deleteActivityRemarkById(String id);

    int saveEditActivityRemark(ActivityRemark remark);
}
