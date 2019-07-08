package com.njnu.dao;

import com.njnu.bean.Job;
import com.njnu.util.JobInfo;

import java.util.List;

public interface JobMapper {

    List<Job> selectAll();

    List<JobInfo> selectAllInfo();

    int deleteByPrimaryKey(Integer jobId);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(Integer jobId);

    Job findByName(String name);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
}