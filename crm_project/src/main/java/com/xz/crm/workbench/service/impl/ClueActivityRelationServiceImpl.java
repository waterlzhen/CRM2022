package com.xz.crm.workbench.service.impl;

import com.xz.crm.workbench.domain.ClueActivityRelation;
import com.xz.crm.workbench.mapper.ClueActivityRelationMapper;
import com.xz.crm.workbench.service.ClueActivityRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-20-下午 05:33
 * @since 2022/8/20 0020-下午 05:33
 */
@Service
public class ClueActivityRelationServiceImpl implements ClueActivityRelationService {

    @Autowired
    private ClueActivityRelationMapper ClueActivityRelationMapper;

    @Override
    public int saveCreateClueActivityRelationByList(List<ClueActivityRelation> relationList) {
        return ClueActivityRelationMapper.insertClueActivityRelationByList(relationList);
    }

    @Override
    public int deleteClueActivityRelationByClueIdActivityId(ClueActivityRelation relation) {
        return ClueActivityRelationMapper.deleteClueActivityRelationByClueIdActivityId(relation);
    }
}
