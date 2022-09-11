package com.xz.crm.workbench.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-12-下午 12:43
 * @since 2022/8/12 0012-下午 12:43
 */
@Controller
public class WorkbenchIndexController {

    @RequestMapping("/workbench/index.do")
    public String index(){
//        System.out.println("跳转到主页面");
        return "workbench/index";
    }


}
