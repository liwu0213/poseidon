package com.muggle.poseidon.core.interceptor;

import com.muggle.poseidon.base.PoseidonException;
import com.muggle.poseidon.service.RedisLock;
import com.muggle.poseidon.service.impl.RedislockImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.muggle.poseidon.core.properties.PoseidonProperties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: hiram_erp
 * @description: 防止表单重复提交锁
 * @author: muggle
 * @create: 2018-12-06 11:02
 **/
@Slf4j
public class RequestLockInterceptor implements HandlerInterceptor {
    RedisLock redisTool;
    private int expireTime;

    public RequestLockInterceptor(int expireTime, RedislockImpl redisTool) {
        this.expireTime = expireTime;
        this.redisTool = redisTool;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token=request.getParameter("access_token");
        String lockKey = request.getRequestURI() + "_" + getIpAddr(request)+"_"+token;
        String requestId = getIpAddr(request);
        /*if("get".equalsIgnoreCase(request.getMethod())){
            return true;
        }*/
        boolean lock = redisTool.lock(lockKey, requestId, expireTime);
        if (!lock) {//
            log.error("拦截表单重复提交");
            throw new PoseidonException("请求太频繁",PoseidonProperties.TOO_NUMBER_REQUEST);
//            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        String requestURI = request.getRequestURI();
        String lockKey = request.getRequestURI() + "_" + getIpAddr(request);
//        redisTool.unlock(lockKey,getIpAddr(request));
    }

    private String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
            if (ip.indexOf(",") != -1) {
                ip = ip.split(",")[0];
            }
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
