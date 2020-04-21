package com.muggle.poseidon.config;

import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(filterName = "druidWebStatFilter", urlPatterns = "/*",
        initParams = {
                @WebInitParam(name = "exclusions",
                        value = "*.js,*.gif,*.jpg,*.bmp,*.png,*.css,*.ico,/druid/*") })
@ConditionalOnProperty(prefix = "poseidon.mybatis",name = "support",havingValue = "normal" )
public class DruidStatFilter extends WebStatFilter {

}