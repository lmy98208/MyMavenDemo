package com.njnu.bean;

import java.io.Serializable;
import java.util.Date;

public class Resume implements Serializable {
    private Integer resumeId;

    private Integer userId;

    private String graduateInstitution;

    private String educationBackground;

    private String major;

    private String experience;

    private String skill;

    private String honor;

    private String intentionJob;

    private Integer intentionToPay;

    private String intentionCity;

    private Date intentionHiredate;

    private String resumeState;

    private static final long serialVersionUID = 1L;

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGraduateInstitution() {
        return graduateInstitution;
    }

    public void setGraduateInstitution(String graduateInstitution) {
        this.graduateInstitution = graduateInstitution == null ? null : graduateInstitution.trim();
    }

    public String getEducationBackground() {
        return educationBackground;
    }

    public void setEducationBackground(String educationBackground) {
        this.educationBackground = educationBackground == null ? null : educationBackground.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill == null ? null : skill.trim();
    }

    public String getHonor() {
        return honor;
    }

    public void setHonor(String honor) {
        this.honor = honor == null ? null : honor.trim();
    }

    public String getIntentionJob() {
        return intentionJob;
    }

    public void setIntentionJob(String intentionJob) {
        this.intentionJob = intentionJob == null ? null : intentionJob.trim();
    }

    public Integer getIntentionToPay() {
        return intentionToPay;
    }

    public void setIntentionToPay(Integer intentionToPay) {
        this.intentionToPay = intentionToPay;
    }

    public String getIntentionCity() {
        return intentionCity;
    }

    public void setIntentionCity(String intentionCity) {
        this.intentionCity = intentionCity == null ? null : intentionCity.trim();
    }

    public Date getIntentionHiredate() {
        return intentionHiredate;
    }

    public void setIntentionHiredate(Date intentionHiredate) {
        this.intentionHiredate = intentionHiredate;
    }

    public String getResumeState() {
        return resumeState;
    }

    public void setResumeState(String resumeState) {
        this.resumeState = resumeState == null ? null : resumeState.trim();
    }
}