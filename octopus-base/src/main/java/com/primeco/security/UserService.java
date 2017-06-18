package com.primeco.security;

import com.primeco.rbac.model.ManAuthority;
import com.primeco.rbac.model.ManUser;
import com.primeco.rbac.service.ManAuthorityService;
import com.primeco.rbac.service.ManUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.primeco.utils.Encodes.entryptPassword;

/**
 * Created by ethan on 15/06/2017.
 * 用户工具类
 */
@Service
public class UserService {
    @Autowired
    private ManUserService manUserService;
    @Autowired
    private ManAuthorityService manAuthorityService;

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;

    public static final String AUTH_TYPE_MENU = "menu";

    public ManUser getUser() {
        ManUser user = null;
        try {
            Subject subject = SecurityUtils.getSubject();
            UserAuthorizingRealm.Principal principal = (UserAuthorizingRealm.Principal) subject.getPrincipal();
            if (principal != null) {
                user = manUserService.getByKey(principal.getLoginName());
            }
        } catch (UnavailableSecurityManagerException e) {

        } catch (InvalidSessionException e) {

        }
        return user;
    }

    public List<ManAuthority> getMenuList() {
        ManUser user = getUser();
        return manAuthorityService.getResByUserId(user.getUserId(), AUTH_TYPE_MENU);
    }

    public ManUser getUserById(String id) {
        if (id != null) {
            return manUserService.getByKey(id);
        } else {
            return null;
        }
    }

    public UserAuthorizingRealm.Principal getPrincipal() {
        try {
            Subject subject = SecurityUtils.getSubject();
            return (UserAuthorizingRealm.Principal) subject.getPrincipal();
        } catch (UnavailableSecurityManagerException e) {
        } catch (InvalidSessionException e) {
        }
        return null;
    }

    @Transactional(readOnly = false)
    public void updateUserLoginInfo(String id) {
        ManUser user = manUserService.getByKey(id);
//        user.setLoginIp(SecurityUtils.getSubject().getSession().getHost());
        user.setLastLoginTime(new Timestamp(new Date().getTime()));
        manUserService.update(user);
    }

    @Transactional(readOnly = false)
    public void updatePasswordById(String loginName, String newPassword) {
        ManUser user = manUserService.getByKey(loginName);
        user.setPassword(entryptPassword(newPassword));
        manUserService.update(user);
    }

    /**
     * 根据用户ID获取角色Code
     */
    public List<String> getResByUserId(String userId) {
        List<ManAuthority> authorities = manAuthorityService.getResByUserId(userId, AUTH_TYPE_MENU);
        List<String> codes = new ArrayList<>(authorities.size());
        authorities.forEach(authority -> codes.add(authority.getId()));
        return codes;
    }

}
