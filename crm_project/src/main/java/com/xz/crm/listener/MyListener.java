package com.xz.crm.listener;
/**
 * @Description
 * @auther zhen
 * @create 2022-09-10-下午 04:59
 * @since 2022/9/10 0010-下午 04:59
 */

import com.xz.crm.settings.service.DicValueService;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;


public class MyListener extends ContextLoaderListener {


    private DicValueService dicValueService;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);

        DicValueService bean = getCurrentWebApplicationContext().getBean(DicValueService.class);
        dicValueService= bean;
        ServletContext context = event.getServletContext();

        String[] strs =new String[]{"appellation","clueState","source","stage","transactionType"};
//      将字典值 查出并存入 application域
        for (String type:strs){
            context.setAttribute(type+"List",dicValueService.queryDicValueByTypeCode(type));
        }
/*        List<DicValue> appellationList= dicValueService.queryDicValueByTypeCode("appellation");
        List<DicValue> clueStateList = dicValueService.queryDicValueByTypeCode("clueState");
        List<DicValue> sourceList = dicValueService.queryDicValueByTypeCode("source");
        List<DicValue> stageList= dicValueService.queryDicValueByTypeCode("stage");
        List<DicValue> transactionTypeList= dicValueService.queryDicValueByTypeCode("transactionType");
        context.setAttribute("appellationList",appellationList);
        context.setAttribute("clueStateList",clueStateList);
        context.setAttribute("sourceList",sourceList);
        context.setAttribute("stageList",stageList);
        context.setAttribute("transactionTypeList",transactionTypeList);*/


    }
}
