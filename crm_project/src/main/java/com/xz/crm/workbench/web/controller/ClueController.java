package com.xz.crm.workbench.web.controller;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.commons.utils.UUIDUtils;
import com.xz.crm.settings.domain.DicValue;
import com.xz.crm.settings.domain.User;
import com.xz.crm.settings.service.DicValueService;
import com.xz.crm.settings.service.UserService;
import com.xz.crm.workbench.domain.Activity;
import com.xz.crm.workbench.domain.Clue;
import com.xz.crm.workbench.domain.ClueActivityRelation;
import com.xz.crm.workbench.domain.ClueRemark;
import com.xz.crm.workbench.service.ActivityService;
import com.xz.crm.workbench.service.ClueActivityRelationService;
import com.xz.crm.workbench.service.ClueRemarkService;
import com.xz.crm.workbench.service.ClueService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.spec.ECField;
import java.util.*;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-15-下午 06:12
 * @since 2022/8/15 0015-下午 06:12
 */
@Controller
public class ClueController {
    @Autowired
    private UserService userService;

    @Autowired
    private ClueService clueService;

    @Autowired
    private ClueRemarkService clueRemarkService;

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ClueActivityRelationService clueActivityRelationService;

    @Autowired
    private DicValueService dicValueService;

    @RequestMapping("/workbench/clue/index.do")//前往线索主页
    public String index(HttpServletRequest request) {

        //查询所有用户
        List<User> userList = userService.queryAllUsers();
        //将用户保存到request作用域中
        request.setAttribute("userList", userList);
        return "workbench/clue/index";
    }

    @RequestMapping("/workbench/clue/saveCreateClue.do")//保存创建的线索
    @ResponseBody
    public Object saveCreateClue(Clue clue, HttpSession session) {
        User user = (User) session.getAttribute(Constant.SESSION_USER);

//        封装参数
        clue.setId(UUIDUtils.getUUID());
        clue.setCreateBy(user.getId());
        clue.setCreateTime(DateUtil.now());
        ReturnObject returnObject = new ReturnObject();
        try {
            int ret = clueService.saveCreateClue(clue);
            if (ret > 0) {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            } else {
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

    @RequestMapping("/workbench/clue/queryClueByCondition.do")//根据条件查询线索信息
    @ResponseBody
    public Object queryClueByCondition(String fullname, String owner, String company, String mphone, String state,
                                       String phone, String source, int pageNo, int pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("fullname", fullname);
        map.put("owner", owner);
        map.put("company", company);
        map.put("mphone", mphone);
        map.put("state", state);
        map.put("phone", phone);
        map.put("source", source);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Clue> clueList = clueService.queryClueByConditionForPage(map);
        int totalRows = clueService.queryCountOfClueByCondition(map);
        Map<String, Object> retMap = new HashMap<>();
        retMap.put("clueList", clueList);
        retMap.put("totalRows", totalRows);

        return retMap;


    }

    @RequestMapping("/workbench/clue/deleteClueByIds.do")//批量删除线索信息
    @ResponseBody
    public Object deleteClueByIds(String[] id) {
        ReturnObject returnObject = new ReturnObject();
        try {
            int ret = clueService.deleteClueByIds(id);
            if (ret > 0) {
//            删除成功
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            } else {
//            删除失败
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

    @RequestMapping("/workbench/clue/queryClueById.do")//根据id查询线索信息
    @ResponseBody
    public Object queryClueById(String id) {

//        根据id查询是市场活动
        Clue clue = clueService.queryClueById(id);
//      根据查询结果，返回响应信息
        return clue;
    }

    @RequestMapping("/workbench/clue/saveEditClue.do")//保存编辑的线索信息
    @ResponseBody
    public Object saveEditClue(Clue clue, HttpSession session) {
        User user = (User) session.getAttribute(Constant.SESSION_USER);
        clue.setEditBy(user.getId());
        clue.setEditTime(DateUtil.now());

        ReturnObject returnObject = new ReturnObject();
        try {
            int ret = clueService.saveEditClue(clue);
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

    @RequestMapping("/workbench/clue/detailClue.do")//线索信息详情
    public String detailClue(String id,HttpServletRequest request){

        Clue clue = clueService.queryClueForDetailById(id);
        List<ClueRemark> clueRemarkList=clueRemarkService.queryClueRemarkForDetailByClueId(id);
        List<Activity> activityList =activityService.queryActivityForDetailByClueId(id);
        request.setAttribute("clue",clue);
        request.setAttribute("remarkList",clueRemarkList);
        request.setAttribute("activityList",activityList);
        return "workbench/clue/detail";
    }

    @RequestMapping("/workbench/clue/queryActivityForDetailByNameClueId.do")//根据市场活动名称模糊和线索id查询 市场活动列表
    @ResponseBody
    public Object queryActivityForDetailByNameClueId(String activityName,String clueId){
        Map<String,Object> map =new HashMap<>();
        map.put("activityName", activityName);
        map.put("clueId",clueId);
        List<Activity> activityList = activityService.queryActivityForDetailByNameClueId(map);
        return activityList;
    }

    @RequestMapping("/workbench/clue/saveBindRelation.do")//关联线索和市场活动
    @ResponseBody
    public Object saveBind(String[] activityId,String clueId){

        List<ClueActivityRelation> relationList =new ArrayList<>();
        ClueActivityRelation car =null;
        for (String id:activityId){
            car=  new ClueActivityRelation();
            car.setId(UUIDUtils.getUUID());
            car.setActivityId(id);
            car.setClueId(clueId);
            relationList.add(car);
        }
        ReturnObject returnObject =new ReturnObject();
        try {
            int ret =clueActivityRelationService.saveCreateClueActivityRelationByList(relationList);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
                List<Activity> activityList = activityService.queryActivityForDetailByIds(activityId);
                returnObject.setRetData(activityList);
            }else{
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

    @RequestMapping("/workbench/clue/deleteBind.do")//解除绑定
    @ResponseBody
    public Object deleteBind(ClueActivityRelation relation){

        ReturnObject returnObject=new ReturnObject();
        try {
//            解除绑定的service层
          int ret   =   clueActivityRelationService.deleteClueActivityRelationByClueIdActivityId(relation);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            }else{
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

    @RequestMapping("/workbench/clue/toConvert.do")//前往转化线索页面
    public String toConvert(String id,HttpServletRequest request){

        Clue clue = clueService.queryClueForDetailById(id);
        List<DicValue> stageList= dicValueService.queryDicValueByTypeCode("stage");
        request.setAttribute("clue",clue);

        return "workbench/clue/convert";
    }

    @RequestMapping("/workbench/clue/queryActivityForConvertByNameClueId.do")//根据线索id和市场活动名称 查询市场活动
    @ResponseBody
    public Object queryActivityForConvertByNameClueId(String activityName,String clueId){
        Map<String,Object> map= new HashMap<>();
        map.put("activityName",activityName);
        map.put("clueId",clueId);
        List<Activity> activityList = activityService.queryActivityForConvertByNameClueId(map);

        return activityList;
    }

    @RequestMapping("/workbench/clue/convertClue.do") //转化线索
    @ResponseBody
    public Object convertClue(String clueId,String money,String name,String expectedDate,
                              String stage,String activityId,String isCreateTran,HttpSession session){
        User user= (User)session.getAttribute(Constant.SESSION_USER);
        ReturnObject returnObject= new ReturnObject();

        Map<String,Object> map=new HashMap<>();
        map.put("clueId",clueId);
        map.put(Constant.SESSION_USER, user);
        map.put("money",money);
        map.put("name",name);
        map.put("expectedDate",expectedDate);
        map.put("stage",stage);
        map.put("activityId",activityId);
        map.put("isCreateTran",isCreateTran);
//        调用service层方法
        try {
            clueService.saveConvertClue(map);
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");
        }


        return returnObject;
    }
}
