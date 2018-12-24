package com.zhonghua.cotton.interceptor;

import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AuthActionInterceptor implements HandlerInterceptor {
	
	@Autowired  
    private Environment env;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		System.out.println(uri+"--------------");
		return true;
		/*if (uri == null) {
			String url = request.getRequestURL().toString();
			if(request.getQueryString()!=null) {
				url += "?"+request.getQueryString();
			}
			String target = URLEncoder.encode(url,"utf-8");
			if ("GET".equalsIgnoreCase(request.getMethod())) {
				response.sendRedirect("/login?target="+target);
				//String RedirectUrl = URLEncoder.encode("http://aslipi.s3.natapp.cc/user/signin?&target="+target,"utf-8");
				//String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+env.getProperty("wx.erp.corpid")+"&redirect_uri="+RedirectUrl+"&response_type=code&scope=snsapi_base&state=cs#wechat_redirect";
				//response.sendRedirect(url);
				return false;//修复bug,未登录要返回false
			}else {
				response.sendRedirect("/login");
				return false;//修复bug,未登录要返回false
			}
		}*/
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
