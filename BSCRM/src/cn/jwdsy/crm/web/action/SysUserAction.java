package cn.jwdsy.crm.web.action;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.SysRole;
import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.domain.SysUserGroup;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.ExcelFileGenerator;
import cn.jwdsy.crm.util.ExportName;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.MD5keyBean;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.util.WebUtils;
import cn.jwdsy.crm.web.form.SysUserForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
public class SysUserAction extends BaseAction implements ModelDriven<SysUserForm>{
	
	private static final long serialVersionUID = -4759786684407474533L;
	
	private SysUserForm model = new SysUserForm();

	public SysUserForm getModel() {
		return model;
	}
	

	public String AddUI(){
		List groupList = sysUserGroupService.checkEntities(new SysUserGroup());
		ActionContext.getContext().put("groupList", groupList);
		List roleList = sysRoleService.checkEntities(new SysRole());
		ActionContext.getContext().put("roleList", roleList);
		String creator = WebUtils.getUserInSession().getName();
		model.setCreator(creator);
		sysLogService.RecordLog("进入用户添加页面!");
		return GlobalParam.ADD_UI;
	}
	
	public String Save(){
		SysUser sysUser = new SysUser();
		BeanUtil.CopyVO2PO(model, sysUser);
		SysUserGroup sysUserGroup = new SysUserGroup();
		sysUserGroup.setGroupId(Integer.parseInt(model.getGroupId()));
		sysUser.setSysUserGroup(sysUserGroup);
		SysRole sysRole = new SysRole();
		sysRole.setRoleId(Integer.parseInt(model.getRoleId()));
		sysUser.setSysRole(sysRole);
		String password = sysUser.getPassword();
		MD5keyBean m = new MD5keyBean();
		password = m.getkeyBeanofStr(password);
		sysUser.setPassword(password);
		sysUserService.saveEntity(sysUser);
		sysLogService.RecordLog("添加[ "+sysUser.getCnname()+" ]新人员!");
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
		SysUser sysUser = new SysUser();
		BeanUtil.CopyVO2PO(model, sysUser);
		if(StringUtils.isNotBlank(model.getGroupId())){
			SysUserGroup sysUserGroup = new SysUserGroup();
			sysUserGroup.setGroupId(Integer.parseInt(model.getGroupId()));
			sysUser.setSysUserGroup(sysUserGroup);
		}
		if(StringUtils.isNotBlank(model.getRoleId())){
			SysRole sysRole = new SysRole();
			sysRole.setRoleId(Integer.parseInt(model.getGroupId()));
			sysUser.setSysRole(sysRole);
		}
		List<SysUser> userList = sysUserService.checkEntities(sysUser);
		request.setAttribute("name", model.getName());
		request.setAttribute("cname", model.getCnname());
		request.setAttribute("groupId", model.getGroupId());
		request.setAttribute("duty", model.getDuty());
		ActionContext.getContext().put("userList", userList);
		List groupList = sysUserGroupService.checkEntities(new SysUserGroup());
		ActionContext.getContext().put("groupList", groupList);
		sysLogService.RecordLog("查询人员!");
		return GlobalParam.LIST_UI;
	}
	
	public String EditUI(){
		List groupList = sysUserGroupService.checkEntities(new SysUserGroup());
		ActionContext.getContext().put("groupList", groupList);
		List roleList = sysRoleService.checkEntities(new SysRole());
		ActionContext.getContext().put("roleList", roleList);
		SysUser sysUser = new SysUser();
		BeanUtil.CopyVO2PO(model, sysUser);
		sysUser = (SysUser) sysUserService.checkEntityById(SysUser.class, sysUser.getUserId());
		BeanUtil.CopyPO2VO(sysUser, model);
		model.setSexs(model.getSex());
		String updater = WebUtils.getUserInSession().getName();
		model.setUpdater(updater);
		if(sysUser.getSysUserGroup()!=null){
			model.setGroupId(sysUser.getSysUserGroup().getGroupId().toString());
		}
		if(sysUser.getSysRole()!=null){
			model.setRoleId(sysUser.getSysRole().getRoleId().toString());
		}
		sysLogService.RecordLog("进入编辑[ "+model.getCnname()+" ]信息的页面!");
		return GlobalParam.EDITUI;
	}
	
	public String Update(){
		SysUser sysUser = new SysUser();
		String sourcePass = request.getParameter("sourcePass");
		if(!sourcePass.equals(model.getPassword())){
			MD5keyBean m = new MD5keyBean();
			String newPass = m.getkeyBeanofStr(model.getPassword());
			sysUser.setPassword(newPass);
		}
		BeanUtil.CopyVO2PO(model, sysUser);
		if(StringUtils.isNotBlank(model.getGroupId())){
			SysUserGroup sysUserGroup = new SysUserGroup();
			sysUserGroup.setGroupId(Integer.parseInt(model.getGroupId()));
			sysUser.setSysUserGroup(sysUserGroup);
		}
		if(StringUtils.isNotBlank(model.getRoleId())){
			SysRole sysRole = new SysRole();
			sysRole.setRoleId(Integer.parseInt(model.getRoleId()));
			sysUser.setSysRole(sysRole);
		}
		sysUserService.updateEntity(sysUser);
		sysLogService.RecordLog("更新[ "+sysUser.getCnname()+" ]的信息!");
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
		sysUserService.deleteEntityByIds(SysUser.class, is);
		sysLogService.RecordLog("删除人员ID为[ "+ids+" ]的"+is.length+"条人员记录!");
		return GlobalParam.LIST_ACTION;
	}

	public String CheckUserName(){
		String name = request.getParameter("name");
		SysUser sysUser = new SysUser();
		sysUser.setName(name);
		List<SysUser> userList = sysUserService.checkEntities(sysUser);
		if(userList.size()!=0){
			try {
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.print(false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public String Export(){
		ServletContext sc = ServletActionContext.getServletContext();
		String ReportPath = sc.getRealPath("Report");
		String excelFileName = "用户信息_" + System.currentTimeMillis() + ".xls";
		String json = "Report/" + excelFileName;
		String excelFilePath = ReportPath + "\\" + excelFileName;
		try{
			ArrayList nameList = ExportName.userNameList;
			List userlist = sysUserService.checkEntities(new SysUser());
			ArrayList dataList = new ArrayList();
			dataList = ExportName.ConvertObj2DataList(userlist);
			FileOutputStream fileout = new FileOutputStream(excelFilePath);
			response.reset();
			response.setContentType("application/vnd.ms-excel");
			ExcelFileGenerator excelFileGenerator = new ExcelFileGenerator(nameList,dataList);
			excelFileGenerator.expordExcel(fileout);
			System.setOut(new PrintStream(fileout));
			fileout.flush();
			if(fileout!=null){
				fileout.close();
			}
		}
		catch (Exception e) {
			throw new RuntimeException("导出excel错误");
		}
		try {
			json = "{'url':'" + json + "'}";
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
