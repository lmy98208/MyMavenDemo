package com.njnu.dao;

import com.njnu.bean.Resume;

public interface ResumeMapper {
    int deleteByPrimaryKey(Integer resumeId);

    int insert(Resume record);

    int insertSelective(Resume record);

    Resume selectByPrimaryKey(Integer resumeId);

    int updateByPrimaryKeySelective(Resume record);

    int updateByPrimaryKey(Resume record);
}