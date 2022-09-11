package com.xz.crm.commons.utils;

import java.util.UUID;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-13-下午 03:45
 * @since 2022/8/13 0013-下午 03:45
 */
public class UUIDUtils {

    public static  String  getUUID(){
      return   UUID.randomUUID().toString().replaceAll("-","");
    }
}
