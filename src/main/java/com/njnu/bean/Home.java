package com.njnu.bean;

import java.io.Serializable;

public class Home implements Serializable {
    private Integer homeId;

    private String announcementIds;

    private String recjobIds;

    private String title;

    private String advertisementIds;

    private static final long serialVersionUID = 1L;

    public Integer getHomeId() {
        return homeId;
    }

    public void setHomeId(Integer homeId) {
        this.homeId = homeId;
    }

    public String getAnnouncementIds() {
        return announcementIds;
    }

    public void setAnnouncementIds(String announcementIds) {
        this.announcementIds = announcementIds == null ? null : announcementIds.trim();
    }

    public String getRecjobIds() {
        return recjobIds;
    }

    public void setRecjobIds(String recjobIds) {
        this.recjobIds = recjobIds == null ? null : recjobIds.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAdvertisementIds() {
        return advertisementIds;
    }

    public void setAdvertisementIds(String advertisementIds) {
        this.advertisementIds = advertisementIds == null ? null : advertisementIds.trim();
    }
}