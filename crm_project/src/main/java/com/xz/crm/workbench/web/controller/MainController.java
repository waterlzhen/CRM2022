package com.xz.crm.workbench.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-13-上午 10:39
 * @since 2022/8/13 0013-上午 10:39
 */
@Controller
public class MainController {

    @RequestMapping("/workbench/main/index.do")
    public String index(){
        return "workbench/main/index";
    }
}
