package cn.jwdsy.crm.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.Salary;
import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.SalaryForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
public class SalaryAction extends BaseAction implements ModelDriven<SalaryForm>{

	private static final long serialVersionUID = 2586462094823595048L;
	
	private SalaryForm model = new SalaryForm();
	
	public SalaryForm getModel() {
		return model;
	}
	
	public String AddUI(){
		sysLogService.RecordLog("进入添加工资页面!");
		return GlobalParam.ADD_UI;
	}
	
	public String CheckUser(){
		String userId = request.getParameter("userId");
		SysUser user = (SysUser) sysUserService.checkEntityById(SysUser.class, Integer.parseInt(userId));
		String json = "["; 
		if(user != null){
			json += "{'userName':'" + user.getCnname()+ "'},";
			if(user.getSysUserGroup()!=null){
				json += "{'groupName':'" + user.getSysUserGroup().getName()+ "'},";
			}
			if (json.length() > 0) {
				json = json.substring(0, json.length() - 1);
			}
		}
		json += "]";
		System.err.println(json);
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String Save(){
		Salary salary = new Salary();
		BeanUtil.CopyVO2PO(model, salary);
		SysUser sysUser = new SysUser();
		sysUser.setUserId(Integer.parseInt(model.getUserId()));
		salary.setUser(sysUser);
		salaryService.saveEntity(salary);
		sysLogService.RecordLog("添加[ "+model.getUserName()+" ]工资!");
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String Check(){
		Salary salary = new Salary();
		BeanUtil.CopyVO2PO(model, salary);
		List<Salary> salaryListRes = salaryService.checkEntities(salary);
		List<SalaryForm> salaryList = new ArrayList<SalaryForm>();
		for(Salary sal : salaryListRes){
			SalaryForm salaryForm = new SalaryForm();
			BeanUtil.CopyPO2VO(sal, salaryForm);
			salaryForm.setPayday(salaryForm.getPayday().substring(0, 10));
			salaryList.add(salaryForm);
		}
		request.setAttribute("userName", model.getUserName());
		request.setAttribute("groupName", model.getGroupName());
		request.setAttribute("payday", model.getPayday());
		ActionContext.getContext().put("salaryList", salaryList);
		sysLogService.RecordLog("查询工资!");
		return GlobalParam.LIST_UI;
	}
	
	public String EditUI(){
		Salary salary = new Salary();
		BeanUtil.CopyVO2PO(model, salary);
		salary = (Salary) salaryService.checkEntityById(Salary.class, salary.getSalaryId());
		BeanUtil.CopyPO2VO(salary, model);
		if(salary.getUser()!=null){
			model.setUserId(salary.getUser().getUserId().toString());
		}
		sysLogService.RecordLog("进入编辑[ "+salary.getUserName()+" ]工资页面!");
		return GlobalParam.EDITUI;
	}
	
	public String Update(){
		Salary salary = new Salary();
		BeanUtil.CopyVO2PO(model, salary);
		SysUser sysUser = new SysUser();
		sysUser.setUserId(Integer.parseInt(model.getUserId()));
		salary.setUser(sysUser);
		salaryService.updateEntity(salary);
		sysLogService.RecordLog("更新[ "+model.getUserName()+" ]工资!");
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String Delete(){
		String[] ids = request.getParameterValues("ids");
		Integer[] is = StringUtil.ConvertStrings2Integers(ids);
		salaryService.deleteEntityByIds(Salary.class, is);
		sysLogService.RecordLog("删除工资条ID为[ "+ids+" ]的"+is.length+"条工资记录!");
		return GlobalParam.LIST_ACTION;
	}
	
	
	public String Chart(){
		List policyList = salaryService.QueryChart();
		List pageList = new ArrayList();
		for(int i=0;i<policyList.size();i++){
			Object[] obj = (Object[]) policyList.get(i);
			obj[0] = obj[0].toString();
			obj[1] = obj[1].toString();
			pageList.add(obj);
		}
		request.setAttribute("policyList", pageList);
		return GlobalParam.CHART_UI;
	}
	

}
