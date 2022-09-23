package com.xz.crm.web.controller;

import com.xz.crm.settings.domain.DicValue;
import com.xz.crm.settings.service.DicValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-11-下午 03:51
 * @since 2022/8/11 0011-下午 03:51
 */
@Controller
public class IndexController {


    @RequestMapping("/")
    public String index(HttpSession session){
        return "index";
    }



}
