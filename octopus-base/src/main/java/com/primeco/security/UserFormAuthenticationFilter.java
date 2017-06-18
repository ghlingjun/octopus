package com.primeco.security;

import com.primeco.common.vo.ResultVO;
import com.primeco.exception.utils.Jacksons;
import com.primeco.rbac.model.ManUser;
import com.primeco.rbac.service.ManUserService;
import com.primeco.utils.IpUtil;
import com.primeco.utils.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 表单验证（包含验证码）过滤类
 *
 * @author Ethan
 * @version 2016-5-19
 */
@Service
public class UserFormAuthenticationFilter extends FormAuthenticationFilter {
    public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";

    @Autowired
    UserService userService;
    @Autowired
    ManUserService manUserService;

    private String captchaParam = DEFAULT_CAPTCHA_PARAM;

    public String getCaptchaParam() {
        return captchaParam;
    }

    protected String getCaptcha(ServletRequest request) {
        return WebUtils.getCleanParam(request, getCaptchaParam());
    }

    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        String username = getUsername(request);
        String password = getPassword(request);
        if (password == null) {
            password = "";
        }
        boolean rememberMe = isRememberMe(request);
        String host = getHost(request);
        return new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host);
    }

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
                                     ServletResponse response) throws Exception {
        HttpSession session = ((HttpServletRequest) request).getSession();
        ManUser user = userService.getUser();
        user.setLastLoginTime(new Timestamp(new Date().getTime()));
        String ip = IpUtil.getIpAddr((HttpServletRequest) request);
//        user.setLoginIp(ip);
        manUserService.update(user);
        session.setAttribute("userName", user.getUserId());
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setCharacterEncoding("UTF-8");
        PrintWriter out = httpServletResponse.getWriter();
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        Map<String,String> map = new HashMap<>();
        map.put("res","authed");
        map.put("message","登录成功");
        if(savedRequest == null || StringUtils.isEmpty(savedRequest.getRequestUrl())){
            out.println(Jacksons.json().fromObjectToJson(new ResultVO(map)));
        }else {
            map.put("url",savedRequest.getRequestUrl());
            out.println(Jacksons.json().fromObjectToJson(new ResultVO(map)));
        }
        out.flush();
        out.close();
        return false;
    }

    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request, ServletResponse response) {
        try {
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            String message = e.getClass().getSimpleName();
            if ("IncorrectCredentialsException".equals(message)) {
                writer.println("{\"success\":false,\"message\":\"密码错误\"}");
            } else if ("UnknownAccountException".equals(message)) {
                writer.println("{\"success\":false,\"message\":\"账号不存在\"}");
            } else if ("LockedAccountException".equals(message)) {
                writer.println("{\"success\":false,\"message\":\"账号被锁定\"}");
            } else {
                writer.println("{\"success\":false,\"message\":\"未知错误\"}");
            }

            writer.flush();
            writer.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return false;
    }

}