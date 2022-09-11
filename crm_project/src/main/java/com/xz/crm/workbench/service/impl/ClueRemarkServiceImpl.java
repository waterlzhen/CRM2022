package com.xz.crm.workbench.service.impl;

import com.xz.crm.workbench.domain.ClueRemark;
import com.xz.crm.workbench.mapper.ClueRemarkMapper;
import com.xz.crm.workbench.service.ClueRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-20-上午 07:43
 * @since 2022/8/20 0020-上午 07:43
 */
@Service
public class ClueRemarkServiceImpl  implements ClueRemarkService {

    @Autowired
    private ClueRemarkMapper clueRemarkMapper;
    @Override
    public List<ClueRemark> queryClueRemarkForDetailByClueId(String clueId) {
        return clueRemarkMapper.selectClueRemarkForDetailByClueId(clueId);
    }

    @Override
    public int saveCreateClueRemark(ClueRemark clueRemark) {
        return clueRemarkMapper.insertClueRemark(clueRemark);
    }

    @Override
    public int deleteClueRemarkById(String id) {
        return clueRemarkMapper.deleteClueRemarkById(id);
    }

    @Override
    public int saveEditClueRemark(ClueRemark clueRemark) {
        return clueRemarkMapper.updateClueRemark(clueRemark);
    }
}
