package com.xz.crm.workbench.web.controller;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.commons.utils.UUIDUtils;
import com.xz.crm.settings.domain.User;
import com.xz.crm.workbench.domain.ActivityRemark;
import com.xz.crm.workbench.service.ActivityRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-19-上午 06:16
 * @since 2022/8/19 0019-上午 06:16
 */
@Controller
public class ActivityRemarkController {

    @Autowired
    private ActivityRemarkService activityRemarkService;

    @RequestMapping("/workbench/activity/saveCreateActivityRemark.do")//保存创建的市场活动备注信息
    @ResponseBody
    public Object saveCreateActivityRemark(ActivityRemark remark, HttpSession session){

        User user =(User)session.getAttribute(Constant.SESSION_USER);
//        封装参数
        remark.setId(UUIDUtils.getUUID());
        remark.setCreateTime(DateUtil.now());
        remark.setCreateBy(user.getId());
        remark.setEditFlag(Constant.REMARK_EDIT_FLAG_NO_MODIFIED);

//        调用service层方法
        ReturnObject returnObject=new ReturnObject();
      try {

          int ret = activityRemarkService.saveCreateActivityRemark(remark);
          if (ret>0){
              returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
              returnObject.setRetData(remark);
          }else {
              returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
              returnObject.setMessage("系统忙，请稍后重试...");
          }

      }catch (Exception e){
          e.printStackTrace();
          returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
          returnObject.setMessage("系统忙，请稍后重试...");
      }
      return returnObject;
    }

    @RequestMapping("/workbench/activity/deleteActivityRemarkById.do")//删除市场活动备注信息
    @ResponseBody
    public Object deleteActivityRemarkById(String id) {

        ReturnObject returnObject=new ReturnObject();
        try {
            int ret = activityRemarkService.deleteActivityRemarkById(id);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            }else {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试...");
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");
        }

        return returnObject;
    }


   @RequestMapping("/workbench/activity/saveEditActivityRemark.do")//保存编辑的市场活动备注信息
   @ResponseBody
    public Object saveEditActivityRemark(ActivityRemark remark,HttpSession session){
        User user=(User)session.getAttribute(Constant.SESSION_USER);
        remark.setEditTime(DateUtil.now());
        remark.setEditBy(user.getId());
        remark.setEditFlag(Constant.REMARK_EDIT_FLAG_MODIFIED);
        ReturnObject returnObject=new ReturnObject() ;
        try {
            int ret = activityRemarkService.saveEditActivityRemark(remark);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
                returnObject.setRetData(remark);
            }else {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，亲稍后重试...");
            }
        }catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，亲稍后重试...");
        }
        return returnObject;
   }

}
