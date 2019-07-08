package com.njnu.bean;

import java.io.Serializable;
import java.util.Date;

public class Job implements Serializable {
    private Integer jobId;

    private Integer userId;

    private Integer corpId;

    private String jobAddress;

    private Byte experience;

    private Byte education;

    private Integer salaryTop;

    private Integer salaryLow;

    private String description;

    private String requirement;

    private Date gmtRelease;

    private Date gmtCreate;

    private Date gmtModified;

    private Integer jobKindId;

    private String jobName;

    private static final long serialVersionUID = 1L;

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCorpId() {
        return corpId;
    }

    public void setCorpId(Integer corpId) {
        this.corpId = corpId;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress == null ? null : jobAddress.trim();
    }

    public Byte getExperience() {
        return experience;
    }

    public void setExperience(Byte experience) {
        this.experience = experience;
    }

    public Byte getEducation() {
        return education;
    }

    public void setEducation(Byte education) {
        this.education = education;
    }

    public Integer getSalaryTop() {
        return salaryTop;
    }

    public void setSalaryTop(Integer salaryTop) {
        this.salaryTop = salaryTop;
    }

    public Integer getSalaryLow() {
        return salaryLow;
    }

    public void setSalaryLow(Integer salaryLow) {
        this.salaryLow = salaryLow;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement == null ? null : requirement.trim();
    }

    public Date getGmtRelease() {
        return gmtRelease;
    }

    public void setGmtRelease(Date gmtRelease) {
        this.gmtRelease = gmtRelease;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Integer getJobKindId() {
        return jobKindId;
    }

    public void setJobKindId(Integer jobKindId) {
        this.jobKindId = jobKindId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName == null ? null : jobName.trim();
    }
}