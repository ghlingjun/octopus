package com.primeco.utils;

import com.primeco.exception.utils.ExceptionTipsMessage;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Set;

/**
 * Created by ytvip on 2017/3/14.
 * 系统初始化
 */
public class SystemInitBean {
    private final String EXCEPTION_MESSAGE_PROPERTIES_PATH = "/exception/exceptionTipsMessage.properties";

    void init() {
        initExceptionMessageProperty();
    }

    /**
     * 初始化异常信息配置文件
     */
    private void initExceptionMessageProperty() {
        // 初始化异常提示信息到exceptionTipsMessages容器中
        InputStream in = null;
        Properties prop = new Properties();
        in = SystemInitBean.class.getClassLoader().getResourceAsStream(EXCEPTION_MESSAGE_PROPERTIES_PATH);
        try {
            prop.load(in);
        } catch (IOException e) {
            throw new RuntimeException();
        }
        Set<Object> keys = prop.keySet();
        if (keys != null && keys.size() > 0) {
            ExceptionTipsMessage etm = ExceptionTipsMessage.getInstance();
            keys.forEach(key->etm.add(key.toString(),prop.getProperty(key.toString().trim())));
            // 异常信息容器设置为不可修改
            etm.unmodifiable();
        }
    }
}
