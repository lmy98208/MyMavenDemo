package com.njnu.util;

import java.util.List;

public class TableModel<T> {
    public TableModel(List<T> list,Integer c)
    {
        this.data=list;
        this.count=c;
    }

    private Integer code=0;
    private String msg="success";
    private Integer count;
    private List<T> data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
