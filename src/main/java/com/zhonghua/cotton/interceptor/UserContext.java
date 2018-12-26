package com.zhonghua.cotton.interceptor;

import com.zhonghua.cotton.model.SysUser;

public class UserContext {
	private static final ThreadLocal<SysUser> USER_HODLER = new ThreadLocal<>();
    
	public static void setUser(SysUser user){
		USER_HODLER.set(user);
	}
	
	public static void remove(){
		USER_HODLER.remove();
	}
	
	public static SysUser getUser(){
		return USER_HODLER.get();
	}
}
