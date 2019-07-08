package com.njnu.util;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

// 可以展示的job信息
public class JobInfo {
    private Integer jobId;

    private String jobAddress;

    private Byte experience;

    private Byte education;

    private Integer salaryTop;

    private Integer salaryLow;

    private String description;

    private String requirement;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date gmtRelease;

    private String jobKind1;

    private String jobKind2;

    private String jobKind3;

    private String jobName;

    private String infoCorpName;


    public String getInfoUserName() {
        return infoUserName;
    }

    public void setInfoUserName(String infoUserName) {
        this.infoUserName = infoUserName;
    }

    private String infoUserName;

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getJobAddress() {
        return jobAddress;
    }

    public void setJobAddress(String jobAddress) {
        this.jobAddress = jobAddress;
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
        this.description = description;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public Date getGmtRelease() {
        return gmtRelease;
    }

    public void setGmtRelease(Date gmtRelease) {
        this.gmtRelease = gmtRelease;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getInfoCorpName() {
        return infoCorpName;
    }

    public void setInfoCorpName(String infoCorpName) {
        this.infoCorpName = infoCorpName;
    }



    public String getJobKind1() {
        return jobKind1;
    }

    public void setJobKind1(String jobKind1) {
        this.jobKind1 = jobKind1;
    }

    public String getJobKind2() {
        return jobKind2;
    }

    public void setJobKind2(String jobKind2) {
        this.jobKind2 = jobKind2;
    }

    public String getJobKind3() {
        return jobKind3;
    }

    public void setJobKind3(String jobKind3) {
        this.jobKind3 = jobKind3;
    }

    @Override
    public String toString() {
        return "JobInfo{" +
                "jobId=" + jobId +
                ", jobAddress='" + jobAddress + '\'' +
                ", experience=" + experience +
                ", education=" + education +
                ", salaryTop=" + salaryTop +
                ", salaryLow=" + salaryLow +
                ", description='" + description + '\'' +
                ", requirement='" + requirement + '\'' +
                ", gmtRelease=" + gmtRelease +
                ", jobKind1='" + jobKind1 + '\'' +
                ", jobKind2='" + jobKind2 + '\'' +
                ", jobKind3='" + jobKind3 + '\'' +
                ", jobName='" + jobName + '\'' +
                ", infoCorpName='" + infoCorpName + '\'' +
                ", infoUserName='" + infoUserName + '\'' +
                '}';
    }
}
