package com.xz.crm.workbench.service.impl;

import com.xz.crm.workbench.domain.ActivityRemark;
import com.xz.crm.workbench.mapper.ActivityRemarkMapper;
import com.xz.crm.workbench.service.ActivityRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-17-下午 09:32
 * @since 2022/8/17 0017-下午 09:32
 */
@Service
public class ActivityRemarkServiceImpl implements ActivityRemarkService {

    @Autowired
    private ActivityRemarkMapper activityRemarkMapper;
    @Override
    public int deleteActivityRemarkByActivityId(String[] activityIds) {
        return  activityRemarkMapper.deleteActivityRemarkByActivityIds(activityIds);
    }

    @Override
    public List<ActivityRemark> queryActivityRemarkForDetailByActivityId(String activityId) {
        return activityRemarkMapper.selectActivityRemarkForDetailByActivityId(activityId);
    }

    @Override
    public int saveCreateActivityRemark(ActivityRemark remark) {
        return activityRemarkMapper.insertActivityRemark(remark);
    }

    @Override
    public int deleteActivityRemarkById(String id) {
        return activityRemarkMapper.deleteActivityRemarkById(id);
    }

    @Override
    public int saveEditActivityRemark(ActivityRemark remark) {
        return activityRemarkMapper.updateActivityRemark(remark);
    }
}
