package com.xz.crm.settings.service;

import com.xz.crm.settings.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-11-下午 05:05
 * @since 2022/8/11 0011-下午 05:05
 */
public interface UserService {

    User queryUserByLoginActAndLoginPwd(@Param("map") Map<String, Object> map);

    List<User> queryAllUsers();
}
