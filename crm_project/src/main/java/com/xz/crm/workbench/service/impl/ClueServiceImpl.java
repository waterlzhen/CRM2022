package com.xz.crm.workbench.service.impl;

import cn.hutool.core.date.DateUtil;
import com.xz.crm.commons.constant.Constant;
import com.xz.crm.commons.utils.UUIDUtils;
import com.xz.crm.settings.domain.User;
import com.xz.crm.workbench.domain.*;
import com.xz.crm.workbench.mapper.*;
import com.xz.crm.workbench.service.ClueService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-19-下午 03:38
 * @since 2022/8/19 0019-下午 03:38
 */
@Service
public class ClueServiceImpl implements ClueService {
    @Autowired
    private ClueMapper clueMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private ClueRemarkMapper clueRemarkMapper;

    @Autowired
    private CustomerRemarkMapper customerRemarkMapper;

    @Autowired
    private ContactsRemarkMapper contactsRemarkMapper;

    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    @Autowired
    private ContactsActivityRelationMapper contactsActivityRelationMapper;

    @Autowired
    private TranMapper tranMapper;

    @Autowired
    private TranRemarkMapper tranRemarkMapper;

    @Override
    public int saveCreateClue(Clue clue) {
        return clueMapper.insertClue(clue);
    }

    @Override
    public List<Clue> queryClueByConditionForPage(Map<String, Object> map) {
        return clueMapper.selectClueByConditionForPage(map);
    }

    @Override
    public int queryCountOfClueByCondition(Map<String, Object> map) {
        return clueMapper.selectCountOfClueByCondition(map);
    }

    @Override
    public int deleteClueByIds(String[] ids) {
        return clueMapper.deleteClueByIds(ids);
    }

    @Override
    public Clue queryClueById(String id) {
        return clueMapper.selectClueById(id);
    }

    @Override
    public int saveEditClue(Clue clue) {
        return clueMapper.updateClue(clue);
    }


    @Override
    public Clue queryClueForDetailById(String id) {
        return clueMapper.selectClueForDetailById(id);
    }

    @Override
    public void saveConvertClue(Map<String, Object> map) {
        //根据id查询线索的信息
        String clueId =(String) map.get("clueId");
        User user= (User)map.get(Constant.SESSION_USER);
        String isCreateTran =(String)map.get("isCreateTran");

        Clue clue = clueMapper.selectClueById(clueId);

        //封装客户对象
        Customer cus= new Customer();
        cus.setId(UUIDUtils.getUUID());
        cus.setOwner(user.getId());
        cus.setNextContactTime(clue.getNextContactTime());
        cus.setContactSummary(clue.getContactSummary());
        cus.setCreateBy(user.getId());
        cus.setCreateTime(DateUtil.now());
        cus.setPhone(clue.getPhone());
        cus.setName(clue.getCompany());
        cus.setDescription(clue.getDescription());
        cus.setWebsite(clue.getWebsite());
        cus.setAddress(clue.getAddress());
        //插入一条客户信息
        customerMapper.insertCustomer(cus);

//        封装联系人信息
        Contacts con =new Contacts();
        con.setId(UUIDUtils.getUUID());
        con.setSource(clue.getSource());
        con.setOwner(user.getId());
        con.setNextContactTime(clue.getNextContactTime());
        con.setMphone(clue.getMphone());
        con.setJob(clue.getJob());
        con.setFullname(clue.getFullname());
        con.setEmail(clue.getEmail());
        con.setDescription(clue.getDescription());
        con.setCustomerId(cus.getId());
        con.setContactSummary(clue.getContactSummary());
        con.setAppellation(clue.getAppellation());
        con.setAddress(clue.getAddress());
        con.setCreateBy(user.getId());
        con.setCreateTime(DateUtil.now());
        //插入一条联系人信息
        contactsMapper.insertContacts(con);

//        根据clueId查询该线索的所有备注
        List<ClueRemark> clueRemarkList = clueRemarkMapper.selectClueRemarkByClueId(clueId);
        //把线索的所有备注转换到客户备注表中一份，并且把该线索下所有的备注转换到联系人备注表一份
        if (clueRemarkList!=null&&clueRemarkList.size()>0){
            CustomerRemark customerRemark=null;
            List<CustomerRemark> cusList=new ArrayList<>();

            ContactsRemark contactsRemark=null;
            List<ContactsRemark> conList =new ArrayList<>();
            for (ClueRemark remark:clueRemarkList){
                 customerRemark=new CustomerRemark();
                 customerRemark.setId(UUIDUtils.getUUID());
                 customerRemark.setNoteContent(remark.getNoteContent());
                 customerRemark.setEditTime(remark.getEditTime());
                 customerRemark.setEditBy(remark.getEditBy());
                 customerRemark.setCreateBy(remark.getCreateBy());
                 customerRemark.setCreateTime(remark.getCreateTime());
                 customerRemark.setCustomerId(cus.getId());
                 customerRemark.setEditFlag(remark.getEditFlag());
               cusList.add(customerRemark);

                contactsRemark=new ContactsRemark();
                contactsRemark.setId(UUIDUtils.getUUID());
                contactsRemark.setNoteContent(remark.getNoteContent());
                contactsRemark.setEditTime(remark.getEditTime());
                contactsRemark.setEditBy(remark.getEditBy());
                contactsRemark.setEditFlag(remark.getEditFlag());
                contactsRemark.setCreateTime(remark.getCreateTime());
                contactsRemark.setCreateBy(remark.getCreateBy());
                contactsRemark.setContactsId(con.getId());
              conList.add(contactsRemark);
            }

            contactsRemarkMapper.insertContactsRemarkByList(conList);
            customerRemarkMapper.insertCustomerRemarkByList(cusList);
        }
//        根据clueId查询该线索和市场活动的关联关系
        List<ClueActivityRelation> carList = clueActivityRelationMapper.selectClueActivityRelationByClueId(clueId);
        if (carList!=null&&carList.size()>0){
                ContactsActivityRelation contactsAR=null;
                List<ContactsActivityRelation> contactsARList=new ArrayList<>();
                for (ClueActivityRelation car:carList){
                    contactsAR=new ContactsActivityRelation();
                    contactsAR.setId(UUIDUtils.getUUID());
                    contactsAR.setContactsId(con.getId());
                    contactsAR.setActivityId(car.getActivityId());
                    contactsARList.add(contactsAR);
                }
                contactsActivityRelationMapper.insertContactsActivityRelationByList(contactsARList);
        }
//        如果需要创建交易，则创建一条交易，并且把线索的所有备注转换到交易备注表中
        if ("true".equals(isCreateTran)){
            Tran tran=new Tran();
            tran.setId(UUIDUtils.getUUID());
            tran.setActivityId((String) map.get("activityId"));
            tran.setMoney((String)map.get("money"));
            tran.setName((String) map.get("name"));
            tran.setStage((String)map.get("stage"));
            tran.setExpectedDate((String) map.get("expectedDate"));
            tran.setOwner(user.getId());
            tran.setContactsId(con.getId());
            tran.setCreateTime(DateUtil.now());
            tran.setCreateBy(user.getId());
            tran.setCustomerId(cus.getId());
            tranMapper.insertTran(tran);

            if (clueRemarkList!=null&&clueRemarkList.size()>0){
                TranRemark tr=null;
                List<TranRemark> trList=new ArrayList<>();
                for (ClueRemark cr :clueRemarkList){
                    tr=new TranRemark();
                    tr.setId(UUIDUtils.getUUID());
                    tr.setTranId(tran.getId());
                    tr.setNoteContent(cr.getNoteContent());
                    tr.setEditTime(cr.getEditTime());
                    tr.setEditBy(cr.getEditBy());
                    tr.setEditFlag(cr.getEditFlag());
                    tr.setCreateTime(cr.getCreateTime());
                    tr.setCreateBy(cr.getCreateBy());
                trList.add(tr);
                }
                tranRemarkMapper.insertTranRemark(trList);
            }
        }

        //删除该线索下所欲哦的备注
        clueRemarkMapper.deleteClueRemarkByClueId(clueId);

        //删除该线索和市场活动的关联关系
        clueActivityRelationMapper.deleteClueActivityRelationByClueId(clueId);

        //删除该条线索
        clueMapper.deleteClueById(clueId);

    }
}
