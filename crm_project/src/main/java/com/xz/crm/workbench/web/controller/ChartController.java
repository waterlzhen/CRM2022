package com.xz.crm.workbench.web.controller;

import com.xz.crm.workbench.domain.FunnelVO;
import com.xz.crm.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-下午 05:20
 * @since 2022/8/22 0022-下午 05:20
 */
@Controller
public class ChartController {

    @Autowired
    private TranService tranService;

    @RequestMapping("/workbench/chart/transaction/index.do")
    public String index(){

        return "workbench/chart/transaction/index";
    }

    @RequestMapping("/workbench/chart/transaction/queryCountTranGroupByStage.do")
    @ResponseBody
    public Object queryCountTranGroupByStage(){

//        调用service 层方法，查询数据
        List<FunnelVO> funnelVOList =tranService.queryCountTranGroupByStage();
//        根据查询结果，返回响应请求
        return funnelVOList;

    }
}
