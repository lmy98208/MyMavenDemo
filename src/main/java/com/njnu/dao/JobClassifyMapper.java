package com.njnu.dao;

import com.njnu.bean.JobClassify;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JobClassifyMapper {
    int deleteByPrimaryKey(Integer jobKindId);

    int insert(JobClassify record);

    int insertSelective(JobClassify record);

    JobClassify selectByPrimaryKey(Integer jobKindId);

    int updateByPrimaryKeySelective(JobClassify record);

    int updateByPrimaryKey(JobClassify record);

    List<JobClassify>selectAll();

    List<JobClassify>selectByK1K2(@Param("k1") String k1, @Param("k2") String k2)throws Exception;
}