package cn.itcast.aop;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
/*
 * 自定义拦截器，需要实现Interceptor接口
 */
@SuppressWarnings("serial")
public class PersonInterceptor implements Interceptor {
	
	public PersonInterceptor(){
		System.err.println("PersonInterceptor 构造方法");
	}
	//生命周期中执行一次
	public void init() {
		System.err.println("PersonInterceptor init");
	}
	/*
	 * 生命周期中执行多次
	 * ActionInvocation:保存struts2中云高兴事的上下文信息，由struts2运行时自动注入
	 */
	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception {
		System.err.println("PersonInterceptor intercept");
		System.err.println("invocation~~~"+invocation);
		System.err.println("getAction~~~"+invocation.getAction());
		System.err.println("getProxy~~~"+invocation.getProxy());
		System.err.println("getMethod~~~"+invocation.getProxy().getMethod());
		System.err.println("getActionName~~~"+invocation.getProxy().getActionName());
		System.err.println("getNamespace~~~"+invocation.getProxy().getNamespace());
		
		//获取session
		Map sessionMap = invocation.getInvocationContext().getSession();
		Object obj = sessionMap.get("user");
		if(obj==null){
			//<result name="error">/aop/error.jsp</result>
			return "error";
		}
		//调用action中的方法
		String returnvalue = invocation.invoke();
		System.err.println(returnvalue);
		
		//<result name="success">/aop/success.jsp</result>
		return returnvalue;
	}
	//生命周期中执行多次	
	public void destroy() {
		System.err.println("PersonInterceptor destroy");
		
	}

}
