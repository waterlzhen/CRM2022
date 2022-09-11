package com.xz.crm.workbench.web.controller;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.commons.utils.UUIDUtils;
import com.xz.crm.settings.domain.User;
import com.xz.crm.workbench.domain.ActivityRemark;
import com.xz.crm.workbench.domain.ClueRemark;
import com.xz.crm.workbench.service.ClueRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-20-上午 07:46
 * @since 2022/8/20 0020-上午 07:46
 */
@Controller
public class ClueRemarkController {

    @Autowired
    private ClueRemarkService clueRemarkService;

    @RequestMapping("/workbench/clue/saveCreateClueRemark.do")
    @ResponseBody
    public  Object saveCreateClueRemark(ClueRemark clueRemark, HttpSession session){
        User user =(User)session.getAttribute(Constant.SESSION_USER);
        clueRemark.setId(UUIDUtils.getUUID());
        clueRemark.setCreateBy(user.getId());
        clueRemark.setCreateTime(DateUtil.now());
        clueRemark.setEditFlag(Constant.REMARK_EDIT_FLAG_NO_MODIFIED);
        ReturnObject returnObject=new ReturnObject();
        try {

            int ret = clueRemarkService.saveCreateClueRemark(clueRemark);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
                returnObject.setRetData(clueRemark);
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

    @RequestMapping("/workbench/clue/deleteClueRemark.do")
    @ResponseBody
    public Object deleteClueRemark(String id){
        ReturnObject returnObject=new ReturnObject();
        try {
            int ret = clueRemarkService.deleteClueRemarkById(id);
            if (ret > 0) {

//            更新成功
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            } else {
//            更新失败
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

    @RequestMapping("/workbench/clue/saveEditClueRemark.do")
    @ResponseBody
    public Object saveEditActivityRemark(ClueRemark remark, HttpSession session){
        User user=(User)session.getAttribute(Constant.SESSION_USER);
        remark.setEditTime(DateUtil.now());
        remark.setEditBy(user.getId());
        remark.setEditFlag(Constant.REMARK_EDIT_FLAG_MODIFIED);
        ReturnObject returnObject=new ReturnObject() ;
        try {
            int ret = clueRemarkService.saveEditClueRemark(remark);
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
