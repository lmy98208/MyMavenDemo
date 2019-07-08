package com.njnu.bean;

import java.io.Serializable;

public class Corporation implements Serializable {
    private Integer corpId;

    private String corpName;

    private Integer corpScale;

    private String tag;

    private String address;

    private String addressLngLat;

    private String introduction;

    private String fullCropName;

    private String legalPerson;

    private String bussinessScope;

    private static final long serialVersionUID = 1L;

    public Integer getCorpId() {
        return corpId;
    }

    public void setCorpId(Integer corpId) {
        this.corpId = corpId;
    }

    public String getCorpName() {
        return corpName;
    }

    public void setCorpName(String corpName) {
        this.corpName = corpName == null ? null : corpName.trim();
    }

    public Integer getCorpScale() {
        return corpScale;
    }

    public void setCorpScale(Integer corpScale) {
        this.corpScale = corpScale;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getAddressLngLat() {
        return addressLngLat;
    }

    public void setAddressLngLat(String addressLngLat) {
        this.addressLngLat = addressLngLat == null ? null : addressLngLat.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getFullCropName() {
        return fullCropName;
    }

    public void setFullCropName(String fullCropName) {
        this.fullCropName = fullCropName == null ? null : fullCropName.trim();
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson == null ? null : legalPerson.trim();
    }

    public String getBussinessScope() {
        return bussinessScope;
    }

    public void setBussinessScope(String bussinessScope) {
        this.bussinessScope = bussinessScope == null ? null : bussinessScope.trim();
    }
}