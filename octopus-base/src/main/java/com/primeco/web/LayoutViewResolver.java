package com.primeco.web;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.servlet.view.AbstractUrlBasedView;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.Date;
import java.util.Map;

/**
 * Created by ethan on 2017/6/15.
 * 视图解析器
 */
public class LayoutViewResolver extends InternalResourceViewResolver implements InitializingBean {

    private String defaultLayout;
    private Map<String, String> layoutMapping;

    @Override
    protected AbstractUrlBasedView buildView(String viewName) throws Exception {
        AbstractUrlBasedView view = super.buildView(viewName);
        String layout = defaultLayout;
        for (Map.Entry<String, String> entry : layoutMapping.entrySet()) {
            if (viewName.startsWith(entry.getKey())) {
                if ("none".equals(entry.getValue())) {
                    return view;
                }
                layout = entry.getValue();
                break;
            }
        }
        view.setUrl(getPrefix() + layout + getSuffix().concat("?etc") + new Date().getTime());
        view.addStaticAttribute("mainPage", getPrefix() + viewName + getSuffix());
        return view;
    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    public String getDefaultLayout() {
        return defaultLayout;
    }

    public void setDefaultLayout(String defaultLayout) {
        this.defaultLayout = defaultLayout;
    }

    public Map<String, String> getLayoutMapping() {
        return layoutMapping;
    }

    public void setLayoutMapping(Map<String, String> layoutMapping) {
        this.layoutMapping = layoutMapping;
    }

}
