package com.xz.crm.workbench.service.impl;

import com.xz.crm.workbench.domain.TranRemark;
import com.xz.crm.workbench.mapper.TranRemarkMapper;
import com.xz.crm.workbench.service.TranRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-下午 01:12
 * @since 2022/8/22 0022-下午 01:12
 */
@Service
public class TranRemarkServiceImpl implements TranRemarkService {

    @Autowired
    private TranRemarkMapper tranRemarkMapper;
    @Override
    public List<TranRemark> queryTranRemarkForDetailByTranId(String tranId) {
        return tranRemarkMapper.selectTranRemarkForDetailByTranId(tranId);
    }
}
