package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.ClueActivityRelation;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-20-下午 05:33
 * @since 2022/8/20 0020-下午 05:33
 */
public interface ClueActivityRelationService {

    int saveCreateClueActivityRelationByList(List<ClueActivityRelation> relationList);

    int deleteClueActivityRelationByClueIdActivityId(ClueActivityRelation relation );
}
