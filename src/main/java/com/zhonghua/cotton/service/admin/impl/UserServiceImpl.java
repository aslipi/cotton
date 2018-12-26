package com.zhonghua.cotton.service.admin.impl;

import com.zhonghua.cotton.mapper.admin.UserMapper;
import com.zhonghua.cotton.model.SysUser;
import com.zhonghua.cotton.service.admin.UserService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public SysUser auth(String username, String password) {
        SysUser user = new SysUser();
        user.setUsername(username);
        user.setPassword(new SimpleHash("SHA-1",username, password).toString());
        List<SysUser> list = userMapper.authUser(user);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

}
