package com.xz.crm.workbench.service.impl;

import com.xz.crm.workbench.domain.TranHistory;
import com.xz.crm.workbench.mapper.TranHistoryMapper;
import com.xz.crm.workbench.service.TranHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-下午 01:15
 * @since 2022/8/22 0022-下午 01:15
 */
@Service
public class TranHistoryServiceImpl implements TranHistoryService {


    @Autowired
    private TranHistoryMapper tranHistoryMapper;
    @Override
    public List<TranHistory> queryTranHistoryForDetailByTranId(String tranId) {
        return tranHistoryMapper.selectTranHistoryForDetailByTranId(tranId);
    }
}
