package cn.jwdsy.crm.aop;

import java.util.ArrayList;
import java.util.List;

import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.web.action.LoginAction;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthInterceptor implements Interceptor {

	private static final long serialVersionUID = 4359055076922703454L;
	
	List<String> unIntercrptPath = new ArrayList<String>();

	public void init() {
		unIntercrptPath.add("loginAction_ChangeImg.do");
		unIntercrptPath.add("loginAction_LoginOut.do");
		unIntercrptPath.add("salaryAction_CheckUser.do");
		unIntercrptPath.add("sysUserAction_CheckUserName.do");
		unIntercrptPath.add("uploadFileAction_ImageView.do");
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		
		String operUrl = invocation.getInvocationContext().getName()+".do";
		
		if(unIntercrptPath.contains(operUrl)){
			return invocation.invoke();
		}
		
//		Object action = invocation.getAction();
		
		if("loginAction_Login.do".equals(operUrl)){
			return invocation.invoke();
		}
		
		SysUser sysUser = (SysUser) invocation.getInvocationContext().getSession().get("user");
		List<String> operUrls =  (List<String>) invocation.getInvocationContext().getSession().get("operUrls");
		List<String> allOperUrls =  (List<String>) invocation.getInvocationContext().getSession().get("allOperUrls");
		
		if(sysUser == null){
			return "LoginIn" ;//还未登陆，请先登录
		}else if("loginAction_MenuMain.do".equals(operUrl)||"loginAction_MenuTop.do".equals(operUrl)||"loginAction_MenuDown.do".equals(operUrl)){
			return invocation.invoke();
		}else if(!allOperUrls.contains(operUrl)){
			return "404Error" ;//404Error
		}else if(!operUrls.contains(operUrl)){
			return "Limited" ;//无权限，若需访问，请联系管理员
		}else{
			return invocation.invoke();
		}
	}

	public void destroy() {
	}
	
}
