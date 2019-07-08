package com.njnu.dao;

import com.njnu.bean.Announcement;

public interface AnnouncementMapper {
    int deleteByPrimaryKey(Integer announcementId);

    int insert(Announcement record);

    int insertSelective(Announcement record);

    Announcement selectByPrimaryKey(Integer announcementId);

    int updateByPrimaryKeySelective(Announcement record);

    int updateByPrimaryKey(Announcement record);
}