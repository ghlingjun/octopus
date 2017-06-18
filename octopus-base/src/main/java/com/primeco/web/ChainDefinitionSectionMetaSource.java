package com.primeco.web;

import org.apache.shiro.config.Ini;
import org.springframework.beans.factory.FactoryBean;

/**
 * Created by ethan on 2017/6/15.
 * 重写 ChainDefinitionSectionMetaSource
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {
    private String filterChainDefinitions;
    @Override
    public Ini.Section getObject() throws Exception {
        Ini ini = new Ini();
        //加载默认的url
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
        return section;
    }

    @Override
    public Class<?> getObjectType() {
        return this.getClass();
    }

    @Override
    public boolean isSingleton() {
        return false;
    }

    public String getFilterChainDefinitions() {
        return filterChainDefinitions;
    }

    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }
}
