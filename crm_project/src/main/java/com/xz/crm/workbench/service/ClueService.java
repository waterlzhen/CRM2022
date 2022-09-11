package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.Activity;
import com.xz.crm.workbench.domain.Clue;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-19-下午 03:37
 * @since 2022/8/19 0019-下午 03:37
 */
public interface ClueService {

    int saveCreateClue(Clue clue);

    List<Clue> queryClueByConditionForPage(Map<String,Object> map);

    int queryCountOfClueByCondition(Map<String,Object> map);

    int deleteClueByIds(String[] ids);

    Clue queryClueById(String  id);

    int saveEditClue(Clue clue);

    Clue queryClueForDetailById(String id);

    void saveConvertClue(Map<String,Object> map);
}
