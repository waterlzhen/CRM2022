package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.TranRemark;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-下午 01:12
 * @since 2022/8/22 0022-下午 01:12
 */
public interface TranRemarkService {

    List<TranRemark> queryTranRemarkForDetailByTranId(String tranId);
}
