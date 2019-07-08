package com.njnu.dao;

import com.njnu.bean.Advertisement;

public interface AdvertisementMapper {
    int deleteByPrimaryKey(Integer advertisementId);

    int insert(Advertisement record);

    int insertSelective(Advertisement record);

    Advertisement selectByPrimaryKey(Integer advertisementId);

    int updateByPrimaryKeySelective(Advertisement record);

    int updateByPrimaryKey(Advertisement record);
}