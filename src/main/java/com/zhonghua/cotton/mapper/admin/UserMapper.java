package com.zhonghua.cotton.mapper.admin;

import com.zhonghua.cotton.model.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {

    public List<SysUser> authUser(SysUser user);
}
