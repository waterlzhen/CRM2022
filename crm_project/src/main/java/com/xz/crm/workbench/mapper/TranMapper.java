package com.xz.crm.workbench.mapper;

import com.xz.crm.settings.domain.User;
import com.xz.crm.workbench.domain.FunnelVO;
import com.xz.crm.workbench.domain.Tran;

import java.util.List;

public interface TranMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_tran
     *
     * @mbggenerated Sun Aug 21 14:51:09 CST 2022
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_tran
     *
     * @mbggenerated Sun Aug 21 14:51:09 CST 2022
     */
    int insert(Tran record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_tran
     *
     * @mbggenerated Sun Aug 21 14:51:09 CST 2022
     */
    int insertSelective(Tran record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_tran
     *
     * @mbggenerated Sun Aug 21 14:51:09 CST 2022
     */
    Tran selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_tran
     *
     * @mbggenerated Sun Aug 21 14:51:09 CST 2022
     */
    int updateByPrimaryKeySelective(Tran record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_tran
     *
     * @mbggenerated Sun Aug 21 14:51:09 CST 2022
     */
    int updateByPrimaryKey(Tran record);

    /**
     * 插入一条交易信息
     * @param tran
     * @return
     */
    int insertTran(Tran tran);


    /**
     * 根据id查询交易详细信息
     * @param id
     * @return
     */
    Tran selectTranForDetailById(String id);

    /**
     * 查询交易表中各个阶段的数据量
     * @return
     */
    List<FunnelVO> selectCountTranGroupByStage();
}