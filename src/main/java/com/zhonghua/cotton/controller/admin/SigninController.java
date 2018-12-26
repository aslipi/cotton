package com.zhonghua.cotton.controller.admin;

import com.zhonghua.cotton.common.CommonConstants;
import com.zhonghua.cotton.interceptor.UserContext;
import com.zhonghua.cotton.model.SysUser;
import com.zhonghua.cotton.service.admin.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class SigninController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(HttpServletRequest req, HttpServletResponse res){
        if(UserContext.getUser()!=null) {
            return "redirect:/admin/cotton/list";
        }
        req.setAttribute("target", req.getParameter("target"));
        req.setAttribute("errorMsg", req.getParameter("errorMsg"));
        return "/admin/login";
    }

    @RequestMapping("/signin")
    public String signin(HttpServletRequest req, HttpServletResponse res)throws UnsupportedEncodingException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String target = req.getParameter("target");
        SysUser user =  userService.auth(username, password);
        if (user == null) {
            return "redirect:/login?userId="+username+"&errorMsg=202&target="+URLEncoder.encode(target, "utf-8");
        }else if("1".equals(user.getDelFlag())) {
            return "redirect:/login?userId="+username+"&errorMsg=203&target="+URLEncoder.encode(target, "utf-8");
        }else if("1".equals(user.getLockFlag())) {
            return "redirect:/login?userId="+username+"&errorMsg=204&target="+URLEncoder.encode(target, "utf-8");
        }else {
            HttpSession session = req.getSession(true);
            session.setAttribute(CommonConstants.USER_ATTRIBUTE, user);
            if(target==null||target.equals("")) {
                return "redirect:/admin/cotton/list";
            }else {
                return "redirect:"+target;
            }
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req, HttpServletResponse res)throws UnsupportedEncodingException {
        UserContext.remove();
        return "/admin/login";
    }
}
