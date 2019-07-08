package com.njnu.bean;

import java.io.Serializable;

public class JobClassify implements Serializable {
    private Integer jobKindId;

    private String k1;

    private String k2;

    private String k3;

    private static final long serialVersionUID = 1L;

    public Integer getJobKindId() {
        return jobKindId;
    }

    public void setJobKindId(Integer jobKindId) {
        this.jobKindId = jobKindId;
    }

    public String getK1() {
        return k1;
    }

    public void setK1(String k1) {
        this.k1 = k1 == null ? null : k1.trim();
    }

    public String getK2() {
        return k2;
    }

    public void setK2(String k2) {
        this.k2 = k2 == null ? null : k2.trim();
    }

    public String getK3() {
        return k3;
    }

    public void setK3(String k3) {
        this.k3 = k3 == null ? null : k3.trim();
    }
}