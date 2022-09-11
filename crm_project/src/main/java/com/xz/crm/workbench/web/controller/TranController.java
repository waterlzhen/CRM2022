package com.xz.crm.workbench.web.controller;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.settings.domain.User;
import com.xz.crm.settings.service.UserService;
import com.xz.crm.workbench.domain.Tran;
import com.xz.crm.workbench.domain.TranHistory;
import com.xz.crm.workbench.domain.TranRemark;
import com.xz.crm.workbench.mapper.CustomerMapper;
import com.xz.crm.workbench.service.CustomerService;
import com.xz.crm.workbench.service.TranHistoryService;
import com.xz.crm.workbench.service.TranRemarkService;
import com.xz.crm.workbench.service.TranService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-21-下午 04:52
 * @since 2022/8/21 0021-下午 04:52
 */
@Controller
public class TranController {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TranService tranService;

    @Autowired
    private TranRemarkService tranRemarkService;

    @Autowired
    private TranHistoryService tranHistoryService;

    @RequestMapping("/workbench/transaction/index.do")
    public String index(){
        return "workbench/transaction/index";
    }

    @RequestMapping("/workbench/transaction/toSave.do")
    public String toSave(HttpServletRequest request){
        List<User> userList = userService.queryAllUsers();
        request.setAttribute("userList",userList);

        return "workbench/transaction/save";
    }

    @RequestMapping("/workbench/transaction/getPossibilityByStage.do")
    @ResponseBody
    public Object getPossibilityByStage(String stageValue){
        ResourceBundle bundle =ResourceBundle.getBundle("possibility");
        String possibility = bundle.getString(stageValue);
        return possibility;
    }


    @RequestMapping("/workbench/transaction/queryCustomerNameByCondition.do")
    @ResponseBody
    public Object  queryCustomerNameByCondition(String customerName){

//    调用Service    根据名称模糊查询所有公司名称
        List<String> list = customerService.queryCustomerNameByCondition(customerName);

        return list;
    }

    @RequestMapping("/workbench/transaction/saveCreateTran.do")
    @ResponseBody
    public Object saveCreateTran(@RequestParam Map<String,Object> map, HttpSession session){
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        map.put(Constant.SESSION_USER,user);
        ReturnObject returnObject=new ReturnObject();
        try {

            tranService.saveCreateTran(map);
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，亲稍后重试...");
        }
        return returnObject;
    }

    @RequestMapping("/workbench/transaction/detailTran.do")
    public String detailTran(String id,HttpServletRequest request){
        Tran tran = tranService.queryTranForDetailById(id);
        List<TranRemark> tranRemarkList=tranRemarkService.queryTranRemarkForDetailByTranId(id);
        List<TranHistory> tranHistoryList =tranHistoryService.queryTranHistoryForDetailByTranId(id);


        ResourceBundle bundle =ResourceBundle.getBundle("possibility");
        tran.setPossibility( bundle.getString(tran.getStage()));

        request.setAttribute("tran",tran);
        request.setAttribute("tranRemarkList",tranRemarkList);
        request.setAttribute("tranHistoryList",tranHistoryList);

        return "workbench/transaction/detail";
    }

}
