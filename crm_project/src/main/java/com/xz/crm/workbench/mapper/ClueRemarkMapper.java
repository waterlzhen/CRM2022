package com.xz.crm.workbench.mapper;

import com.xz.crm.workbench.domain.ClueRemark;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClueRemarkMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_remark
     *
     * @mbggenerated Sat Aug 20 07:35:09 CST 2022
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_remark
     *
     * @mbggenerated Sat Aug 20 07:35:09 CST 2022
     */
    int insert(ClueRemark record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_remark
     *
     * @mbggenerated Sat Aug 20 07:35:09 CST 2022
     */
    int insertSelective(ClueRemark record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_remark
     *
     * @mbggenerated Sat Aug 20 07:35:09 CST 2022
     */
    ClueRemark selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_remark
     *
     * @mbggenerated Sat Aug 20 07:35:09 CST 2022
     */
    int updateByPrimaryKeySelective(ClueRemark record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_remark
     *
     * @mbggenerated Sat Aug 20 07:35:09 CST 2022
     */
    int updateByPrimaryKey(ClueRemark record);

    /**
     * 根据线索id查询线索备注表的备注
     * @param clueId
     * @return
     */
    List<ClueRemark>  selectClueRemarkForDetailByClueId(@Param("clueId") String clueId);

    /**
     * 添加市场活动信息
     * @param clueRemark
     * @return
     */
    int insertClueRemark(ClueRemark clueRemark);

    /**
     * 根据id删除 线索备注
     * @param id
     * @return
     */
    int deleteClueRemarkById(String id);

    /**
     * 更新 线索备注信息
     * @param clueRemark
     * @return
     */
    int updateClueRemark(ClueRemark clueRemark);

    /**
     * 根据clueId查询线索备注表的备注信息
     * @param clueId
     * @return
     */
    List<ClueRemark>  selectClueRemarkByClueId(String clueId);

    /**
     * 根据clueId批量删除
     * @param clueId
     * @return
     */
    int deleteClueRemarkByClueId(String clueId);
}