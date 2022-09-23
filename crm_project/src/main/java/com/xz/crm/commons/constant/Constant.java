package com.xz.crm.commons.constant;

import com.xz.crm.commons.domain.ResultCode;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-12-上午 10:56
 * @since 2022/8/12 0012-上午 10:56
 */
public class Constant {
//保存ReturnObject类中code的值
    public  static final String RETURN_OBJECT_CODE_SUCCESS="1";//成功
    public  static final String RETURN_OBJECT_CODE_FAIL="0";//失败

//    保存当前用户的key
    public static final  String SESSION_USER="sessionUser";

//    备注修改过的标记

    public static  final String REMARK_EDIT_FLAG_NO_MODIFIED="0";
    public static  final String REMARK_EDIT_FLAG_MODIFIED="1";

    public static void main(String[] args) {
        System.out.println(ResultCode.FAIL);
    }
}
