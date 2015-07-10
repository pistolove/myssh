package cn.jwdsy.crm.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.domain.SysUserGroup;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.SysUserGroupForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
public class SysUserGroupAction extends BaseAction implements ModelDriven<SysUserGroupForm>{
	
	private static final long serialVersionUID = 3534837128088289581L;
	
	private SysUserGroupForm model = new SysUserGroupForm();
	
	public SysUserGroupForm getModel() {
		return model;
	}
	
	
	public String AddUI(){
		sysLogService.RecordLog("进入添加部门的页面!");
		return GlobalParam.ADD_UI;
	}
	
	public String Save(){
		SysUserGroup sysUserGroup = new SysUserGroup();
		BeanUtil.CopyVO2PO(model, sysUserGroup);
		sysUserGroupService.saveEntity(sysUserGroup);
		sysLogService.RecordLog("保存[ "+sysUserGroup.getName()+" ]的部门信息!");
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
		SysUserGroup sysUserGroup = new SysUserGroup();
		BeanUtil.CopyVO2PO(model, sysUserGroup);
		List<SysUserGroup> groupList = sysUserGroupService.checkEntities(sysUserGroup);
		request.setAttribute("name", model.getName());
		request.setAttribute("principal", model.getPrincipal());
		ActionContext.getContext().put("groupList", groupList);
		sysLogService.RecordLog("查询部门信息!");
		return GlobalParam.LIST_UI;
	}
	
	public String EditUI(){
		SysUserGroup sysUserGroup = new SysUserGroup();
		BeanUtil.CopyVO2PO(model, sysUserGroup);
		sysUserGroup = (SysUserGroup) sysUserGroupService.checkEntityById(SysUserGroup.class, sysUserGroup.getGroupId());
		BeanUtil.CopyPO2VO(sysUserGroup, model);
		sysLogService.RecordLog("进入编辑[ "+model.getName()+" ]的部门信息页面!");
		return GlobalParam.EDITUI;
	}
	
	public String Update(){
		SysUserGroup sysUserGroup = new SysUserGroup();
		BeanUtil.CopyVO2PO(model, sysUserGroup);
		sysUserGroupService.updateEntity(sysUserGroup);
		sysLogService.RecordLog("更新[ "+sysUserGroup.getName()+" ]的部门信息!");
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
		sysUserGroupService.deleteEntityByIds(SysUserGroup.class, is);
		sysLogService.RecordLog("删除部门ID为[ "+ids+" ]的"+is.length+"条部门记录!");
		return GlobalParam.LIST_ACTION;
	}
	
	@SuppressWarnings("unchecked")
	public String CheckGroupUser(){
		SysUser sysUser = new SysUser();
		List<SysUser> userList = sysUserService.checkEntities(sysUser);
		List<SysUser> rightList = new ArrayList<SysUser>();
		List<SysUser> leftList = new ArrayList<SysUser>();
		for(SysUser user : userList){
			if(user.getSysUserGroup()!=null){
				if((model.getGroupId()).equals((user.getSysUserGroup().getGroupId().toString()))){
					rightList.add(user);
				}else{
					leftList.add(user);
				}
			}else{
				leftList.add(user);
			}
		}
		ActionContext.getContext().put("groupId", model.getGroupId());
		ActionContext.getContext().put("leftList", leftList);
		ActionContext.getContext().put("rightList", rightList);
		sysLogService.RecordLog("进入编辑部门ID为[ "+model.getGroupId()+" ]的部门人员页面!");
		return GlobalParam.LIST_USER;
	}
	
	public String SaveGroupUser(){
		String users = request.getParameter("users");
		String unusers = request.getParameter("unusers");
		String groupId = request.getParameter("groupId");
		SysUserGroup sysUserGroup = new SysUserGroup();
		sysUserGroup.setGroupId(Integer.parseInt(groupId));
		String[] userIds = users.split(",");
		Integer[] is = StringUtil.ConvertStrings2Integers(userIds);
		for(Integer userId : is){
			SysUser sysUser = new SysUser();
			sysUser.setUserId(userId);
			sysUser = (SysUser) sysUserService.checkEntityById(SysUser.class, sysUser.getUserId());
			sysUser.setSysUserGroup(sysUserGroup);
			sysUserService.updateEntity(sysUser);
		}
		if(StringUtils.isNotBlank(unusers)){
			String[] unuserIds = unusers.split(",");
			Integer[] unis = StringUtil.ConvertStrings2Integers(unuserIds);
			for(Integer userId : unis){
				SysUser sysUser = new SysUser();
				sysUser.setUserId(userId);
				sysUser = (SysUser) sysUserService.checkEntityById(SysUser.class, sysUser.getUserId());
				if(sysUser.getSysUserGroup()!=null){
					if(groupId.equals(sysUser.getSysUserGroup().getGroupId().toString())){
						sysUser.setSysUserGroup(null);
						sysUserService.updateEntity(sysUser);
					}
				}
			}
		}
		sysLogService.RecordLog("保存部门ID为[ "+model.getGroupId()+" ]的部门人员!");
		return GlobalParam.LIST_ACTION;
	}
	




}
