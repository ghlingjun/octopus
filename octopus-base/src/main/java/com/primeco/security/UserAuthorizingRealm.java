package com.primeco.security;

import com.primeco.utils.Encodes;
import com.primeco.rbac.model.ManUser;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 系统安全认证实现类
 * Created by ethan on 09/12/2016.
 */
@Service
public class UserAuthorizingRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;

    /**
     * 认证回调函数, 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        ManUser user = userService.getUserById(token.getUsername());
        if (user != null) {
            byte[] salt = Encodes.decodeHex(user.getPassword().substring(0, 16));
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(new Principal(user),
                    user.getPassword().substring(16), ByteSource.Util.bytes(salt), getName());
            return info;
        } else {
            return null;
        }
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Principal principal = (Principal) getAvailablePrincipal(principals);
        ManUser user = userService.getUserById(principal.getLoginName());
        if (user == null) {
            return null;
        } else {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            info.addRoles(userService.getResByUserId(user.getUserId()));
            // 更新登录IP和时间
            userService.updateUserLoginInfo(user.getUserId());
            return info;
        }
    }

    /**
     * 设定密码校验的Hash算法与迭代次数
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(UserService.HASH_ALGORITHM);
        matcher.setHashIterations(UserService.HASH_INTERATIONS);
        setCredentialsMatcher(matcher);
    }

    /**
     * 授权用户信息
     */
    public static class Principal implements Serializable {

        private static final long serialVersionUID = 1L;

        private String loginName;
        private String userName;
        private Map<String, Object> cacheMap;
        private boolean mobileLogin; // 是否手机登录

        public Principal(ManUser user) {
            this.loginName = user.getUserId();
            this.userName = user.getUsername();
            this.mobileLogin = false;
        }

        public String getLoginName() {
            return loginName;
        }

        public String getUserName() {
            return userName;
        }

        public boolean isMobileLogin() {
            return mobileLogin;
        }

        public Map<String, Object> getCacheMap() {
            if (cacheMap == null) {
                cacheMap = new HashMap<>();
            }
            return cacheMap;
        }

    }
}
