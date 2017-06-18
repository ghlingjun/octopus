package com.primeco.base;

import com.primeco.base.BaseCtl;
import com.primeco.exception.BaseRunTimeException;
import com.primeco.security.UserService;
import com.primeco.web.ErrorKey;
import com.primeco.web.Roles;
import com.primeco.rbac.model.ManUser;
import com.primeco.utils.PrimecoStringUtils;
import com.primeco.utils.ThreadUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by ytvip on 2017/3/15.
 * 登录注册Ctrl
 */
@Controller
@RequestMapping(produces = "application/json; charset=utf-8")
public class LoginCtl extends BaseCtl {
    @Autowired
    UserService userService;

    @RequestMapping(value = "login/{flag}", method = RequestMethod.GET)
    public String login(HttpServletRequest request, @PathVariable int flag) {
        request.setAttribute("flag", flag);
        return "login";
    }

    /**
     * 登录认证控制器
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(@RequestParam String username, String password,
                        HttpServletRequest request, HttpServletResponse response, Model model) {
        /*登录认证*/
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        } catch (Exception e) {
            throw new BaseRunTimeException(ErrorKey.UserEO_LoginFailure);
        }

        dealSession(request);
        /*登录成功*/
        log.info(username + "  登录成功");
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        if (savedRequest == null || PrimecoStringUtils.isEmpty(savedRequest.getRequestUrl()))
            return getObject(request.getContextPath().concat("/customer/center"));
        log.debug("savedRequestUrl:" + savedRequest.getRequestUrl());
        return getObject(savedRequest.getRequestUrl());
    }

    @RequestMapping(value = "signIn", method = RequestMethod.POST)
    @ResponseBody
    public Object signIn(String userName, String password, int customerType, String loginName) {
        if (customerType != Roles.Enterprise.ordinal() && customerType != Roles.Personal.ordinal() && customerType !=
                Roles.FundProvider.ordinal())
            throw new BaseRunTimeException(ErrorKey.UserEO_IllegalCustomerType);
        /*TODO：参数校验*/
//        signInService.signIn(loginName, userName, password, Roles.values()[customerType]);
        return getObject();
    }

    /**
     * 登录成功后处理session信息
     *
     * @param request 用户请求
     */
    private void dealSession(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        ManUser user = userService.getUser();
        //处理用户信息
        dealUserInfo(user, session);

    }

    /**
     * 处理用户信息
     *
     * @param user    用户对象
     * @param session session对象
     */
    private void dealUserInfo(ManUser user, HttpSession session) {
        session.setAttribute(ThreadUtil.LocalParamsKey.UserName.toString(), user.getUserId());
        session.setAttribute(ThreadUtil.LocalParamsKey.UserId.toString(), user.getUserId());
        session.setAttribute("name", user.getUsername());
        session.setAttribute(ThreadUtil.LocalParamsKey.MenuList.toString(), userService.getMenuList());
    }

}
