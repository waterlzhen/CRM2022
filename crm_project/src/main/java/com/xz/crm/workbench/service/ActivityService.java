package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.Activity;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-13-下午 12:45
 * @since 2022/8/13 0013-下午 12:45
 */
public interface ActivityService {


    int saveCreateActivity(Activity activity);

    List<Activity> queryActivityByConditionForPage(Map<String,Object> map);

    int queryCountOfActivityByCondition(Map<String,Object> map);

    int deleteActivityByIds(String[] ids);

    Activity queryActivityById(String id);

    int saveEditActivity(Activity activity);

    List<Activity> queryAllActivities();
    
    List<Activity> queryActivityByIds(String[] ids);

    int saveCreateActivityByList(List<Activity> activityList);

    Activity queryActivityForDetail(String id);

    List<Activity> queryActivityForDetailByClueId(String clueId);

    List<Activity> queryActivityForDetailByNameClueId(Map<String,Object> map);

    List<Activity> queryActivityForDetailByIds(String[] ids);

    List<Activity> queryActivityForConvertByNameClueId(Map<String,Object> map);
}
