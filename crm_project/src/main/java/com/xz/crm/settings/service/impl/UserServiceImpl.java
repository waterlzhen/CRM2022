package com.xz.crm.settings.service.impl;

import com.xz.crm.settings.domain.User;
import com.xz.crm.settings.mapper.UserMapper;
import com.xz.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description
 * @auther zhen
 * @create 2022-08-11-下午 05:06
 * @since 2022/8/11 0011-下午 05:06
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
     private UserMapper userMapper;
    @Override
    public User queryUserByLoginActAndLoginPwd(Map<String, Object> map) {
        return userMapper.selectUserByLoginActAndLoginPwd(map);
    }

    @Override
    public List<User> queryAllUsers() {
        return userMapper.selectAllUsers();
    }


}
