package com.xz.crm.settings.web.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import com.mysql.cj.Session;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.settings.domain.User;
import com.xz.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-11-下午 04:23
 * @since 2022/8/11 0011-下午 04:23
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("settings/qx/user/toLogin.do")
    public String ToLogin() {
        return "settings/qx/user/login";
    }


    @RequestMapping("/settings/qx/user/login.do")
    @ResponseBody
    public Object login(String loginAct, String loginPwd, String isRemPwd, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("loginAct", loginAct);
        map.put("loginPwd", loginPwd);
        User user = userService.queryUserByLoginActAndLoginPwd(map);
        ReturnObject returnObject = new ReturnObject();
        //  判断账号是否存在
        if (user == null) {
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("用户名或密码错误");
        } else {
        //    验证账号是否过期
            if (DateUtil.formatDate(new Date()).compareTo(user.getExpiretime()) > 0) {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("账号已过期， 请和管理员联系");
            } 
        //账号是否被锁定
            else if ("0".equals(user.getLockstate())) {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("账号已锁定，请和管理员联系");

            //判断是否在允许登陆的ip地址中
            } else if (!user.getAllowips().contains(request.getRemoteAddr())) {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("IP地址受限");
            } else {
                //登录成功
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
                HttpSession session = request.getSession();
               // 将账号保存到session作用于域中
                session.setAttribute(Constant.SESSION_USER, user);

               //如果记住密码，则往外写cookie
                if ("true".equals(isRemPwd)){
                    Cookie loginActCookie= new Cookie("loginAct", user.getLoginact());
                    Cookie loginPwdCookie= new Cookie("loginPwd", user.getLoginpwd());
                    loginActCookie.setMaxAge(60*60*24*10);//有效时长10天
                    loginPwdCookie.setMaxAge(60*60*24*10);//有效时长10天
                    response.addCookie(loginActCookie);
                    response.addCookie(loginPwdCookie);
                }else {
                    //把未过期的cookie删除；
                    //删除cookie的原理，将cookie的生命周期设置为0秒 并返回给浏览器 这样原先的cookie被覆盖了————等同于删除了cookie
                    Cookie loginActCookie= new Cookie("loginAct","-1");
                    Cookie loginPwdCookie= new Cookie("loginPwd", "-1");
                    loginActCookie.setMaxAge(0);//有效时长0
                    loginPwdCookie.setMaxAge(0);//有效时长0
                    response.addCookie(loginActCookie);
                    response.addCookie(loginPwdCookie);
                }
            }
        }

        return returnObject;
    }

    @RequestMapping("/settings/qx/user/logout.do")
    public String logout(HttpSession session,HttpServletResponse response){
        //清除cookie
        Cookie loginActCookie= new Cookie("loginAct","-1");
        Cookie loginPwdCookie= new Cookie("loginPwd", "-1");
        loginActCookie.setMaxAge(0);//有效时长0
        loginPwdCookie.setMaxAge(0);//有效时长0
        response.addCookie(loginActCookie);
        response.addCookie(loginPwdCookie);


//        销毁session  1、销毁session对象 2、把session域中的所有值清空
        session.invalidate();

        return "redirect:/";

    }
}
