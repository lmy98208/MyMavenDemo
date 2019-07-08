package com.njnu.dao;

import com.njnu.bean.Corporation;

import java.util.List;

public interface CorporationMapper {
    int deleteByPrimaryKey(Integer corpId);

    int insert(Corporation record);

    int insertSelective(Corporation record);

    Corporation selectByPrimaryKey(Integer corpId);

    int updateByPrimaryKeySelective(Corporation record);

    int updateByPrimaryKey(Corporation record);

    List<Corporation> selectAll();

    List<String> selectLocation();
}