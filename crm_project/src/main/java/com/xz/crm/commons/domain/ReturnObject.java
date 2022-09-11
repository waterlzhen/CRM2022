package com.xz.crm.commons.domain;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-12-上午 10:57
 * @since 2022/8/12 0012-上午 10:57
 */
public class ReturnObject {
    private String code;//处理成功或失败的标记   1---成功，0---失败
    private String message;//提示信息
    private Object retData;//其他数据

    public ReturnObject() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getRetData() {
        return retData;
    }

    public void setRetData(Object retData) {
        this.retData = retData;
    }
}
