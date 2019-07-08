package com.njnu.util;

public class ResultBean {
    public enum CODE{
        SUCCESS,FAIL,EXCEPTION
    }
    public ResultBean()
    {}

    public ResultBean(CODE code)
    {
        switch (code)
        {
            case SUCCESS:
                this.msg="操作成功";
                this.code=10000;
                break;
            case FAIL:
                this.msg="操作失败";
                this.code=10001;
                break;
            case EXCEPTION:
                this.msg="操作异常";
                this.code=10002;
                break;
        }

    }


    private  Integer code;
    private String msg;
    private Object object;

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

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}
