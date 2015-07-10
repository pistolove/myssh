package cn.itcast.aop;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport {
	
	public String save(){
		System.err.println("调用UserAction中save方法");
		return "success";
	}

}
