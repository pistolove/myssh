package cn.jwdsy.crm.web.action;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import cn.jwdsy.crm.core.ServiceProvider;
import cn.jwdsy.crm.service.ICourseService;
import cn.jwdsy.crm.service.IOperateService;
import cn.jwdsy.crm.service.ISalaryService;
import cn.jwdsy.crm.service.ISysLogService;
import cn.jwdsy.crm.service.ISysRoleService;
import cn.jwdsy.crm.service.ISysUserGroupService;
import cn.jwdsy.crm.service.ISysUserService;
import cn.jwdsy.crm.service.IUploadFileService;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements 
		ServletRequestAware,ServletResponseAware,ServletContextAware,SessionAware {
	
	private static final long serialVersionUID = 2649932839073585716L;
	public HttpServletRequest request;
	public ServletContext servletContext;
	public HttpServletResponse response;
	public Map<String, Object> session;
	public ICourseService courseService = (ICourseService) ServiceProvider.getService(ICourseService.SERVICE_NAME);
	public IOperateService operateService = (IOperateService) ServiceProvider.getService(IOperateService.SERVICE_NAME);
	public ISalaryService salaryService = (ISalaryService) ServiceProvider.getService(ISalaryService.SERVICE_NAME);
	public ISysLogService sysLogService = (ISysLogService) ServiceProvider.getService(ISysLogService.SERVICE_NAME);
	public ISysRoleService sysRoleService = (ISysRoleService) ServiceProvider.getService(ISysRoleService.SERVICE_NAME);
	public ISysUserService sysUserService = (ISysUserService) ServiceProvider.getService(ISysUserService.SERVICE_NAME);
	public ISysUserGroupService sysUserGroupService = (ISysUserGroupService) ServiceProvider.getService(ISysUserGroupService.SERVICE_NAME);
	public IUploadFileService uploadFileService = (IUploadFileService) ServiceProvider.getService(IUploadFileService.SERVICE_NAME);
	
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletContext(ServletContext context) {
		this.servletContext = context;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
