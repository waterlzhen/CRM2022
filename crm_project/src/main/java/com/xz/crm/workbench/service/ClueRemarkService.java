package com.xz.crm.workbench.service;

import com.xz.crm.workbench.domain.ClueRemark;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-20-上午 07:42
 * @since 2022/8/20 0020-上午 07:42
 */
public interface ClueRemarkService {

    List<ClueRemark> queryClueRemarkForDetailByClueId(String  clueId);

    int saveCreateClueRemark(ClueRemark clueRemark);

    int deleteClueRemarkById(String id);

    int saveEditClueRemark(ClueRemark clueRemark);
}
