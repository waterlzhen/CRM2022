package com.xz.crm.workbench.service.impl;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.utils.UUIDUtils;
import com.xz.crm.settings.domain.User;
import com.xz.crm.workbench.domain.Customer;
import com.xz.crm.workbench.domain.FunnelVO;
import com.xz.crm.workbench.domain.Tran;
import com.xz.crm.workbench.domain.TranHistory;
import com.xz.crm.workbench.mapper.CustomerMapper;
import com.xz.crm.workbench.mapper.TranHistoryMapper;
import com.xz.crm.workbench.mapper.TranMapper;
import com.xz.crm.workbench.service.TranService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-22-上午 07:32
 * @since 2022/8/22 0022-上午 07:32
 */
@Service
public class TranServiceImpl implements TranService {

    @Autowired
    private TranMapper tranMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private TranHistoryMapper tranHistoryMapper;

    @Override
    public void saveCreateTran(Map<String,Object> map) {
     String customerName =(String) map.get("customerName");


        Customer customer = customerMapper.selectCustomerByName(customerName);
        User user = (User) map.get(Constant.SESSION_USER);
//        判断客户是否存在 ,不存在则创建客户
        if (customer==null){


            customer =new Customer();
            customer.setId(UUIDUtils.getUUID());
            customer.setName(customerName);
            customer.setOwner(user.getId());
            customer.setCreateBy(user.getId());
            customer.setCreateTime(DateUtil.now());
            customerMapper.insertCustomer(customer);
        }
//        保存交易

        Tran t=new Tran();
        t.setId(UUIDUtils.getUUID());
        t.setType((String) map.get("type"));
        t.setSource((String)map.get("source"));
        t.setDescription((String) map.get("description"));
        t.setContactSummary((String) map.get("contactSummary"));
        t.setNextContactTime((String) map.get("nextContactTime"));
        t.setOwner(user.getId());
        t.setMoney((String) map.get("money"));
        t.setName((String) map.get("name"));
        t.setStage((String)map.get("stage"));
        t.setCreateTime(DateUtil.now());
        t.setCreateBy(user.getId());
        t.setCustomerId(customer.getId());
        t.setExpectedDate((String) map.get("expectedDate"));
        t.setContactsId((String)map.get("contactsId"));
        t.setActivityId((String)  map.get("activityId"));

        tranMapper.insertTran(t);

//        保存一条交易历史
        TranHistory th =new TranHistory();
        th.setId(UUIDUtils.getUUID());
        th.setMoney(t.getMoney());
        th.setCreateTime(t.getCreateTime());
        th.setCreateBy(t.getCreateBy());
        th.setTranId(t.getId());
        th.setStage(t.getStage());
        th.setExpectedDate(t.getExpectedDate());

        tranHistoryMapper.insertTranHistory(th);

    }

    @Override
    public Tran queryTranForDetailById(String id) {
        return tranMapper.selectTranForDetailById(id);
    }

    @Override
    public List<FunnelVO> queryCountTranGroupByStage() {
        return tranMapper.selectCountTranGroupByStage();
    }
}
