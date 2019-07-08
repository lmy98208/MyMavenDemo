package com.njnu.bean;

import java.io.Serializable;

public class Advertisement implements Serializable {
    private Integer advertisementId;

    private String advertisement;

    private static final long serialVersionUID = 1L;

    public Integer getAdvertisementId() {
        return advertisementId;
    }

    public void setAdvertisementId(Integer advertisementId) {
        this.advertisementId = advertisementId;
    }

    public String getAdvertisement() {
        return advertisement;
    }

    public void setAdvertisement(String advertisement) {
        this.advertisement = advertisement == null ? null : advertisement.trim();
    }
}