package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.TranHistory;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-下午 01:15
 * @since 2022/8/22 0022-下午 01:15
 */
public interface TranHistoryService {

    List<TranHistory> queryTranHistoryForDetailByTranId(String tranId);
}
