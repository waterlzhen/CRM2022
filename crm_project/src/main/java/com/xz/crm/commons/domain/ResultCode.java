package com.xz.crm.commons.domain;

/**
 * @Description
 * @auther zhen
 * @create 2022-09-15-上午 08:20
 * @since 2022/9/15 0015-上午 08:20
 */
public enum ResultCode {
    /*成功状态码*/
    SUCCESS(1,"成功"),
//    失败状态码
    FAIL(0,"系统忙请稍后重试。。。");

    private Integer code;
    private String message;

    ResultCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }

}
