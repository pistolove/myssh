package cn.jwdsy.crm.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.Operate;
import cn.jwdsy.crm.domain.SysRole;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.SysRoleForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
public class SysRoleAction extends BaseAction implements ModelDriven<SysRoleForm>{

	private static final long serialVersionUID = 3554547161813954149L;
	
	private SysRoleForm model = new SysRoleForm();
	
	public SysRoleForm getModel() {
		return model;
	}
	
	public String AddUI(){
		sysLogService.RecordLog("进入添加角色页面!");
		return GlobalParam.ADD_UI;
	}
	
	public String Save(){
		SysRole sysRole = new SysRole();
		BeanUtil.CopyVO2PO(model, sysRole);
		sysRoleService.saveEntity(sysRole);
		sysLogService.RecordLog("保存[ "+model.getRoleName()+" ]角色!");
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
		SysRole sysRole = new SysRole();
		BeanUtil.CopyVO2PO(model, sysRole);
		List<SysRole> roleList = sysRoleService.checkEntities(sysRole);
		request.setAttribute("roleName", model.getRoleName());
		ActionContext.getContext().put("roleList", roleList);
		sysLogService.RecordLog("查询角色!");
		return GlobalParam.LIST_UI;
	}
	
	public String EditUI(){
		SysRole sysRole = new SysRole();
		BeanUtil.CopyVO2PO(model, sysRole);
		sysRole = (SysRole) sysRoleService.checkEntityById(SysRole.class, sysRole.getRoleId());
		BeanUtil.CopyPO2VO(sysRole, model);
		sysLogService.RecordLog("进入编辑[ "+model.getRoleName()+" ]角色页面!");
		return GlobalParam.EDITUI;
	}
	
	public String Update(){
		SysRole sysRole = new SysRole();
		BeanUtil.CopyVO2PO(model, sysRole);
		sysRoleService.updateEntity(sysRole);
		sysLogService.RecordLog("更新[ "+model.getRoleName()+" ]角色!");
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public  String Delete(){
		String[] ids = request.getParameterValues("ids");
		Integer[] is = StringUtil.ConvertStrings2Integers(ids);
		sysRoleService.deleteEntityByIds(SysRole.class, is);
		sysLogService.RecordLog("删除角色ID为[ "+ids+" ]的"+is.length+"条角色记录!");
		return GlobalParam.LIST_ACTION;
	}
	
	public String CheckRoleOperates(){
		Operate operate = new Operate();
		List<Operate> operateList = operateService.checkEntities(operate);
		List<Operate> rightList = new ArrayList<Operate>();
		List<Operate> leftList = new ArrayList<Operate>();
		for(Operate oper : operateList){
			if(oper.getRoles()!=null){
				Set<SysRole> roles = oper.getRoles();
				for(SysRole role : roles){
					if(model.getRoleId().equals(role.getRoleId().toString())){
						rightList.add(oper);
					}
				}
			}
		}
		for(Operate oper : rightList){
			operateList.remove(oper);
		}
		leftList = operateList;
		ActionContext.getContext().put("roleId", model.getRoleId());
		ActionContext.getContext().put("leftList", leftList);
		ActionContext.getContext().put("rightList", rightList);
		sysLogService.RecordLog("编辑角色ID为[ "+model.getRoleId()+" ]的角色权限!");
		return GlobalParam.LIST_OPERATE;
	}
	
	public String SaveroleOperates(){
		String operates = request.getParameter("operates");
		String unoperates = request.getParameter("unoperates");
		String roleId = request.getParameter("roleId");
		SysRole sysRole = new SysRole();
		sysRole.setRoleId(Integer.parseInt(roleId));
		String[] operateIds = operates.split(",");
		Integer[] is = StringUtil.ConvertStrings2Integers(operateIds);
		Set<Operate> opers = new HashSet<Operate>();
		for(Integer operateId : is){
			Operate oper = new Operate();
			oper.setOperateId(operateId);
			oper = (Operate) operateService.checkEntityById(Operate.class, oper.getOperateId());
			opers.add(oper);
		}
		sysRole = (SysRole) sysRoleService.checkEntityById(SysRole.class, sysRole.getRoleId());
		sysRole.setOperates(opers);
		sysRoleService.updateEntity(sysRole);
		sysLogService.RecordLog("保存[ "+sysRole.getRoleName()+" ]的角色权限!");
		return GlobalParam.LIST_ACTION;
	}

}
