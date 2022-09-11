package com.xz.crm.workbench.mapper;

import com.xz.crm.workbench.domain.ClueActivityRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClueActivityRelationMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_activity_relation
     *
     * @mbggenerated Sat Aug 20 12:25:57 CST 2022
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_activity_relation
     *
     * @mbggenerated Sat Aug 20 12:25:57 CST 2022
     */
    int insert(ClueActivityRelation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_activity_relation
     *
     * @mbggenerated Sat Aug 20 12:25:57 CST 2022
     */
    int insertSelective(ClueActivityRelation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_activity_relation
     *
     * @mbggenerated Sat Aug 20 12:25:57 CST 2022
     */
    ClueActivityRelation selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_activity_relation
     *
     * @mbggenerated Sat Aug 20 12:25:57 CST 2022
     */
    int updateByPrimaryKeySelective(ClueActivityRelation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_clue_activity_relation
     *
     * @mbggenerated Sat Aug 20 12:25:57 CST 2022
     */
    int updateByPrimaryKey(ClueActivityRelation record);

    /**
     * 批量插入关联记录
     * @param relationList
     * @return
     */
    int insertClueActivityRelationByList(@Param("relationList") List<ClueActivityRelation> relationList);

    /**
     * 根据 线索id 和市场的活动id 删除关联表信息
     * @param relation
     * @return
     */
    int deleteClueActivityRelationByClueIdActivityId(ClueActivityRelation relation );

    /**
     *      根据clueId 查询相关联的市场活动的id
     * @param clueId
     * @return
     */
    List<ClueActivityRelation> selectClueActivityRelationByClueId(String  clueId);

    /**
     * 根据clueId 批量删除和市场活动相关联的记录
     * @param clueId
     * @return
     */
    int deleteClueActivityRelationByClueId(String clueId);
}