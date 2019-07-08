package com.njnu.bean;

import java.io.Serializable;
import java.util.Date;

public class Announcement implements Serializable {
    private Integer announcementId;

    private String announcement;

    private Date time;

    private static final long serialVersionUID = 1L;

    public Integer getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(Integer announcementId) {
        this.announcementId = announcementId;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement == null ? null : announcement.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}