package cn.jwdsy.crm.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;

import cn.jwdsy.crm.domain.SysUser;


public class WebUtils {
	
    public static void addCookie(HttpServletResponse response, String name, String value) {  
    	try {
			name = URLEncoder.encode(name, "UTF-8");
			value = URLEncoder.encode(value, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("URL编码异常");
		}
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/BSCRM");
        cookie.setMaxAge(24 * 60 * 60 * 7);
        response.addCookie(cookie);
    }
    
    public static void addUserToCookie(HttpServletRequest request,HttpServletResponse response, SysUser user) { 
    	WebUtils.addCookie(response, "username", user.getName());
		WebUtils.addCookie(response, "password", user.getPassword());

    }
    
    public static void removeUserCookie(HttpServletResponse response){
    	/**
    	 * setMaxAge方法设置cookie经过多长秒后被删除。如果参数是0，就说明立即删除。如果是负数就表明当浏览器关闭时自动删除。
		 * 如果没有设定cookie的age可以用getMaxAge方法来查看cookie的默认存活时间。
    	 */
    	Cookie username = new Cookie("username", null); 
    	username.setMaxAge(0);
    	response.addCookie(username); 
    	Cookie password = new Cookie("password", null); 
    	password.setMaxAge(0);
    	response.addCookie(password); 
    }
    
    /**
     * 获取cookie的值
     * @param request
     * @param name cookie的名称
     * @return
     */
    public static String getCookieByName(HttpServletRequest request, String name) {
    	Map<String, Cookie> cookieMap = WebUtils.readCookieMap(request);
    	try {
			URLDecoder.decode(name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("URL解码异常");
		}
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            String value = cookie.getValue();
            try {
            	value=URLDecoder.decode(value, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException("URL解码异常");
			}
            return value;
        }else{
            return null;
        }
    }
    
    protected static Map<String, Cookie> readCookieMap(HttpServletRequest request) {
        Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
        Cookie[] cookies = request.getCookies();
        if (null != cookies) {
            for (int i = 0; i < cookies.length; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
            }
        }
        return cookieMap;
    }
    
    
    public static java.sql.Date getSQLDate(Date date){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String todayAsString = df.format(date);
        return java.sql.Date.valueOf(todayAsString); 
    }
    
    public static SysUser getUserInSession(){
    	SysUser user = (SysUser) ActionContext.getContext().getSession().get("user");
    	return user;
    }
    
}
