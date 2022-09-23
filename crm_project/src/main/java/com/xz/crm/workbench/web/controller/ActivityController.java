package com.xz.crm.workbench.web.controller;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.domain.ReturnObject;
import com.xz.crm.commons.utils.HSSFUtils;
import com.xz.crm.commons.utils.UUIDUtils;
import com.xz.crm.exception.MyException;
import com.xz.crm.settings.domain.User;
import com.xz.crm.settings.service.UserService;
import com.xz.crm.workbench.domain.Activity;
import com.xz.crm.workbench.domain.ActivityRemark;
import com.xz.crm.workbench.service.ActivityRemarkService;
import com.xz.crm.workbench.service.ActivityService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-13-上午 10:54
 * @since 2022/8/13 0013-上午 10:54
 */
@Controller
public class ActivityController {

    @Autowired
    private ActivityService activityService;
    @Autowired
    private UserService userService;

    @Autowired
    private ActivityRemarkService activityRemarkService;

    @RequestMapping("/workbench/activity/index.do")//前往index页面
    public String index(HttpServletRequest request) {

        //查询所有用户
        List<User> userList = userService.queryAllUsers();
        //将用户保存到request作用域中
        request.setAttribute("userList", userList);

        //转发到页面上
        return "workbench/activity/index";
    }

    @RequestMapping("/workbench/activity/saveCreateActivity.do")//保存创建的市场活动
    @ResponseBody
    public Object saveCreateActivity(Activity activity, HttpServletRequest request) {

        User createUser = (User) request.getSession().getAttribute(Constant.SESSION_USER);
        //完善activity信息
        activity.setId(UUIDUtils.getUUID());
        activity.setCreateTime(DateUtil.now());//创建时间

        activity.setCreateBy(createUser.getId());//创建者的id
        ReturnObject returnObject = new ReturnObject();
//        调用Services层的方法
        try {
            int ret = activityService.saveCreateActivity(activity);

            if (ret > 0) {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            } else {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试...");
            }
            return returnObject;
        } catch (Exception e) {
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");
        }
        return null;

    }

    @RequestMapping("/workbench/activity/queryActivityByCondition.do")//根据条件查询市场活动列表
    @ResponseBody
    public Object queryActivityByCondition(String owner, String name, String startDate, String endDate, int pageNo, int pageSize) {      //封装参数

        Map<String, Object> map = new HashMap<>();
        map.put("owner", owner);
        map.put("name", name);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("beginNo", (pageNo - 1) * pageSize);
        map.put("pageSize", pageSize);
        List<Activity> activityList = activityService.queryActivityByConditionForPage(map);//获取分页后的市场活动列表
        int totalRows = activityService.queryCountOfActivityByCondition(map);//获取符合条件的记录总条数

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("activityList", activityList);
        resultMap.put("totalRows", totalRows);

        return resultMap;

    }

    @RequestMapping("/workbench/activity/deleteActivityByIds.do")//根据id批量删除市场活动
    @ResponseBody
    public Object deleteActivityByIds(String[] id){
        ReturnObject returnObject=new ReturnObject();
        try {
            int ret = activityService.deleteActivityByIds(id);

            if (ret>0){
//            删除成功
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            }else {
//            删除失败
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试...");
            }
        }
        catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");

        }
        return returnObject;
    }

    @RequestMapping("/workbench/activity/queryActivityById.do")//根据id查询市场活动详细信息
    @ResponseBody
    public Object queryActivityById(String id){

//        根据id查询是市场活动
        Activity activity = activityService.queryActivityById(id);
//      根据查询结果，返回响应信息
        return activity;
    }

    @RequestMapping("/workbench/activity/saveEditActivity.do")//保存编辑的市场活动
    @ResponseBody
    public Object saveEditActivity(Activity activity , HttpSession session){
        User user = (User) session.getAttribute(Constant.SESSION_USER);
//        封装参数
        activity.setEditTime(DateUtil.now());
        activity.setEditBy(user.getId());

        ReturnObject returnObject= new ReturnObject();
        try {
            int ret = activityService.saveEditActivity(activity);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
            }else {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试...");
            }

        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");

        }
//        返回结果
        return returnObject;

    }

    //测试文件下载
    @RequestMapping("/workbench/activity/fileDownload.do")
    public void fileDownload(HttpServletResponse response) throws IOException {

//        System.out.println("文件下载");
//        1、设置响应类型
        response.setContentType("application/octet-stream;charset=UTF-8");

        /*
        浏览器收到响应信息之后，在默认情况下，直接在显示窗口打开响应信息；
        即使浏览器打不开，也会调用应用程序打开，只有实在打不开，待会激活文件下载窗口
        在这里我们可以通过设置响应头信息，告诉浏览器以附件（attachment）行方式打开,
        这样可以直接激活下载窗口，下载为附件
        filename设置文件下载的名字
        */
//        2、设置响应头
        response.addHeader("Content-Disposition", "attachment;filename=myTestExcel.xls");

//        3、获取输出流
        OutputStream out = response.getOutputStream();
//
        InputStream is= new FileInputStream("E:\\BaiduNetdiskDownload\\temp.xls");
        byte[] buffer = new byte[256];
        int len=0;
        while ((len=is.read(buffer))!=-1){
            out.write(buffer, 0,len);
        }
//        4、关闭资源
        is.close();
        out.flush();
    }


    @RequestMapping("/workbench/activity/exportAllActivities.do")//导出市场活动为excel文件
    public void exportAllActivities( HttpServletResponse response) throws Exception{

//        1、查询出所有市场活动
        List<Activity> activityList = activityService.queryAllActivities();
//        2、调用ActivitiesToHSSFWorkbook自定义方法
        HSSFWorkbook wb= this.ActivitiesToHSSFWorkbook(activityList);
/*
*           1、查出activityList数据
*           2、将数据封装到HSSFWorkbook wb对象中
*           3、将wb中的数据写入 response的 OutputStream out 中
*           4、flush到浏览器（刷新缓冲区）
*           5、关闭资源
*
* */
        //根据web对生成excel文件
/*        OutputStream os =new FileOutputStream("E:\\prejectALL\\ssm\\crm2022\\serverDir\\activityList.xls");
        wb.write(os);
//        关闭资源
        os.close();
        wb.close();*/
//        把生成的excel文件下载客户端
        response.setContentType("application/octet-stream;charset=UTF-8");
        String timeStamp = DateUtil.format(new Date(), "yyyyMMddHHmmss");
        response.addHeader("Content-Disposition", "attachment;filename=ActivityList_"+timeStamp+".xls");
        OutputStream out =response.getOutputStream();

/*        InputStream is =new FileInputStream("E:\\prejectALL\\ssm\\crm2022\\serverDir\\activityList.xls");
        byte[] buffer=new byte[256];
        int length=0;
        while ((length=is.read(buffer))!=-1){
            out.write(buffer,0,length);
        }
        is.close();*/

        //3、将wb中的数据写入 response的 OutputStream out 中
        wb.write(out);
        // 4、flush到浏览器（刷新缓冲区）
        out.flush();
        // 5、关闭资源
        wb.close();
    }
    
    @RequestMapping("/workbench/activity/exportXzActivity.do")//根据id导出为excel市场活动
    public void exportXzActivity(String[] id ,HttpServletResponse response) throws Exception{
        List<Activity> activityList = activityService.queryActivityByIds(id);
        HSSFWorkbook wb = this.ActivitiesToHSSFWorkbook(activityList);

        response.setContentType("application/octet-stream;charset=UTF-8");
        String timeStamp = DateUtil.format(new Date(), "yyyyMMddHHmmss");
        response.addHeader("Content-Disposition", "attachment;filename=ActivityList_"+timeStamp+".xls");

        OutputStream os = response.getOutputStream();
        wb.write(os);
        os.flush();
        wb.close();
    }

    @RequestMapping("/workbench/activity/inputActivity.do")//导入市场活动
    @ResponseBody
    public Object inputActivity(MultipartFile activityFile ,HttpSession session){

        User user = (User) session.getAttribute(Constant.SESSION_USER);
        ReturnObject returnObject = new ReturnObject();
        try {
            //将excel文件写入到磁盘目录中
           /* String originalFilename = activityFile.getOriginalFilename();//获取文件上传是的名称（包括后缀名）
            File file = new File("E:\\prejectALL\\ssm\\crm2022\\serverDir\\", originalFilename);//需要将文件保存的路径
            activityFile.transferTo(file);//将文件写入到磁盘中*/


            //解析excel文件，获取其中的数据，并封装成 activityList
//            InputStream is = new FileInputStream(file);//读取这个文件
            InputStream is = activityFile.getInputStream();
            HSSFWorkbook wb = new HSSFWorkbook(is);
            HSSFSheet sheet = wb.getSheetAt(0);
            HSSFRow row = null;
            HSSFCell cell = null;
            List<Activity> activityList = new ArrayList<>();
            Activity activity = null;
            String CreateTime= DateUtil.now();
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                row = sheet.getRow(i);
                //每一行生成一条 activity对象
                activity = new Activity();
                activity.setId(UUIDUtils.getUUID());
                activity.setOwner(user.getId());
                activity.setCreateTime(CreateTime);
                activity.setCreateBy(user.getId());

                for (int j = 0; j < row.getLastCellNum(); j++) {
                    cell = row.getCell(j);

                    //将单元格cell中的内容转为字符串 存入 cellValue中
                    String cellValue = HSSFUtils.getCellValueToStr(cell);
                    if (j == 0) {
                        activity.setName(cellValue);
                    } else if (j == 1) {
                        activity.setStartDate(cellValue);
                    } else if (j == 2) {
                        activity.setEndDate(cellValue);
                    } else if (j == 3) {
                        activity.setCost(cellValue);
                    } else if (j == 4) {
                        activity.setDescription(cellValue);
                    }

                }
                //保存到 activityList
                activityList.add(activity);
            }
            int ret = activityService.saveCreateActivityByList(activityList);
            if (ret>0){
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_SUCCESS);
                returnObject.setRetData(ret);
            }else {
                returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试...");
            }

        } catch (IOException e) {
            e.printStackTrace();
            returnObject.setCode(Constant.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");
        }

        return returnObject;


    }

    @RequestMapping("/workbench/activity/detailActivity.do")//前往市场的活动详情页面
    public String detaliActivity(String id,HttpServletRequest request){
        Activity activity = activityService.queryActivityForDetail(id);
        List<ActivityRemark> remarkList =activityRemarkService.queryActivityRemarkForDetailByActivityId(id);

        request.setAttribute("activity",activity);
        request.setAttribute("remarkList",remarkList);

//        请求转发
    return "workbench/activity/detail";
    }

    /**
     *
     * 将市场活动列表中的数据封装到 HSSFWorkbook wb 文件中
     * @param activityList 需要被写入文件中的数据
     * @return HSSFWorkbook对象
     */
    private HSSFWorkbook ActivitiesToHSSFWorkbook(List<Activity> activityList){
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet wbSheet = wb.createSheet("市场活动列表");
        HSSFRow row = wbSheet.createRow(0);//标题行
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("ID");
        cell = row.createCell(1);
        cell.setCellValue("所有者");
        cell = row.createCell(2);
        cell.setCellValue("名称");
        cell = row.createCell(3);
        cell.setCellValue("开始日期");
        cell = row.createCell(4);
        cell.setCellValue("结束日期");
        cell = row.createCell(5);
        cell.setCellValue("成本");
        cell = row.createCell(6);
        cell.setCellValue("描述");
        cell = row.createCell(7);
        cell.setCellValue("创建时间");
        cell = row.createCell(8);
        cell.setCellValue("创建人");
        cell = row.createCell(9);
        cell.setCellValue("修改时间");
        cell = row.createCell(10);
        cell.setCellValue("修改人");

                 
        if (activityList!=null&&activityList.size()>0){
            Activity activity=null;
            for (int i =0;i<activityList.size();i++){
                activity=activityList.get(i);
                row = wbSheet.createRow(i+1);
                cell = row.createCell(0);
                cell.setCellValue(activity.getId());
                cell = row.createCell(1);
                cell.setCellValue(activity.getOwner());
                cell = row.createCell(2);
                cell.setCellValue(activity.getName());
                cell = row.createCell(3);
                cell.setCellValue(activity.getStartDate());
                cell = row.createCell(4);
                cell.setCellValue(activity.getEndDate());
                cell = row.createCell(5);
                cell.setCellValue(activity.getCost());
                cell = row.createCell(6);
                cell.setCellValue(activity.getDescription());
                cell = row.createCell(7);
                cell.setCellValue(activity.getCreateTime());
                cell = row.createCell(8);
                cell.setCellValue(activity.getCreateBy());
                cell = row.createCell(9);
                cell.setCellValue(activity.getEditTime());
                cell = row.createCell(10);
                cell.setCellValue(activity.getEditBy());
            }
        }
        return wb;
    }


}
