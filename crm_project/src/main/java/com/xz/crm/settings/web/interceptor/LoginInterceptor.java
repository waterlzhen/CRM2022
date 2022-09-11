package com.xz.crm.settings.web.interceptor;

import com.xz.crm.commons.constant.Constant;
import com.xz.crm.settings.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-13-上午 09:37
 * @since 2022/8/13 0013-上午 09:37
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //判断session中是否存在user对象；
        User currentUser = (User) httpServletRequest.getSession().getAttribute(Constant.SESSION_USER);
        //如果存在---放行，不存在---跳转到登录页面
        if (currentUser == null) {
            //重定向到登录页面
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath());//手动重定向时，url必须必须加上项目名
            return false;
        }
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
