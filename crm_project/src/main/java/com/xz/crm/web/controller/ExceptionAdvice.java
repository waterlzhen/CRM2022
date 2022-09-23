package com.xz.crm.web.controller;

import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.exception.MyException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @Description
 * @auther zhen
 * @create 2022-09-15-下午 02:29
 * @since 2022/9/15 0015-下午 02:29
 */

@ControllerAdvice
public class ExceptionAdvice {

    @ExceptionHandler(MyException.class)
    public ReturnObject doMyException(MyException ex, Model model){
        model.addAttribute("code",ex.getCode());//展示没有想好1001什么意思，就当他是错误代码
        model.addAttribute("ex",ex.getMessage());
        model.addAttribute("message", "系统忙，请稍后重试。。。");

        ReturnObject returnObject= new ReturnObject();
        returnObject.setCode(""+ex.getCode());
        returnObject.setMessage(ex.getMessage());
        return returnObject;
    }


    @ExceptionHandler(Exception.class)
    public ReturnObject doOtherException(Exception ex, Model model){
        model.addAttribute("ex",ex);
        model.addAttribute("code",1002);
        model.addAttribute("message","网络连接超时。。。");
        ReturnObject returnObject= new ReturnObject();
            returnObject.setCode("1001");
            returnObject.setMessage("系统忙，请稍后重试。。。");
        return returnObject;
    }


}
