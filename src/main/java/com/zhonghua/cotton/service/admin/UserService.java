package com.zhonghua.cotton.service.admin;

import com.zhonghua.cotton.model.SysUser;

public interface UserService {

    SysUser auth(String username, String password);

}
