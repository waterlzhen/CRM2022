package com.xz.crm.workbench.service;

import com.xz.crm.settings.domain.User;
import com.xz.crm.workbench.domain.FunnelVO;
import com.xz.crm.workbench.domain.Tran;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-上午 07:32
 * @since 2022/8/22 0022-上午 07:32
 */
public interface TranService {

    void saveCreateTran(Map<String,Object> map);

    Tran queryTranForDetailById(String id);

   List<FunnelVO> queryCountTranGroupByStage();
}
