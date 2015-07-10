package cn.jwdsy.crm.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.Operate;
import cn.jwdsy.crm.domain.SysRole;
import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.MD5keyBean;
import cn.jwdsy.crm.util.WebUtils;

import com.opensymphony.xwork2.ActionContext;

@Scope("prototype")
public class LoginAction extends BaseAction{
	
	private static final long serialVersionUID = -3650650812936595210L;
	
	public String LoginOut(){
		sysLogService.RecordLog("退出登录!");
		ActionContext.getContext().getSession().clear();
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String Login(){
		String YZM = (String) session.get("CHECK_NUMBER_KEY");
		String captcha = request.getParameter("captcha");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		String cookiePassword = WebUtils.getCookieByName(request,"password");
		if(StringUtils.isNotBlank(password)){
			if(!password.equals(cookiePassword)){
				MD5keyBean md5 = new MD5keyBean();
				password = md5.getkeyBeanofStr(password);
			}
		}
		if(!YZM.equals(captcha)){
			try {
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.print("ERRYZM");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		SysUser sysUser = new SysUser();
		sysUser.setName(username);
		sysUser.setPassword(password);
		List<SysUser> userList = sysUserService.checkEntities(sysUser);
		if(userList.size()!=0){
			sysUser = userList.get(0);
			SysRole sysRole = sysUser.getSysRole();
			Set<Operate> operates = sysRole.getOperates();
			List<String> operUrls = new ArrayList<String>();
			for(Operate oper : operates){
				String operUrl = oper.getOperateUrl();
				operUrls.add(operUrl);
			}
			ActionContext.getContext().getSession().put("operUrls", operUrls);
		}
		List<Operate> operateList = operateService.checkEntities(new Operate());
		List<String> allOperUrls = new ArrayList<String>();
		if(operateList!=null){
			for(Operate oper : operateList){
				allOperUrls.add(oper.getOperateUrl());
			}
		}
		ActionContext.getContext().getSession().put("allOperUrls", allOperUrls);
		if(userList.size()==0){
			try {
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.print("WRONGUSER");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			ActionContext.getContext().getSession().put("user", sysUser);
			sysLogService.RecordLog("成功登录!");
			if("true".endsWith(remember)){
				WebUtils.addUserToCookie(request, response, sysUser);
			}else{
				WebUtils.removeUserCookie(response);
			}
		}
		return null;
	}

	public String ChangeImg(){
		return GlobalParam.CHANGEIMG;
	}
	
	public String MenuMain(){
		return GlobalParam.MENUMAIN;
	}
	
	public String MenuTop(){
		String username = WebUtils.getUserInSession().getCnname();
		ActionContext.getContext().put("username", username);
		return GlobalParam.MENUTOP;
	}
	
	public String MenuDown(){
		return GlobalParam.MENUDOWN;
	}
	
}
