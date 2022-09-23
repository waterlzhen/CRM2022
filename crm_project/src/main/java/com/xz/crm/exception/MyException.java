package com.xz.crm.exception;

/**
 * @Description
 * @auther zhen
 * @create 2022-09-15-下午 02:27
 * @since 2022/9/15 0015-下午 02:27
 */
public class MyException extends RuntimeException {
    private Integer code;

    public Integer getCode() {
        return code;
    }

    public MyException(String message, Integer code) {
        super(message);
        this.code = code;
    }

    public MyException(String message, Throwable cause, Integer code) {
        super(message, cause);
        this.code = code;
    }




}
