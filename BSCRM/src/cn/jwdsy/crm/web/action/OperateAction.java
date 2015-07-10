package cn.jwdsy.crm.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.Operate;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.OperateForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;


@Scope("prototype")
public class OperateAction extends BaseAction implements ModelDriven<OperateForm>{

	private static final long serialVersionUID = 1091417200449764630L;
	
	private OperateForm model = new OperateForm();
	
	public OperateForm getModel() {
		return model;
	}
	
	
	public String AddUI(){
		sysLogService.RecordLog("进入添加权限页面!");
		return GlobalParam.ADD_UI;
	}
	
	public String Save(){
		Operate operate = new Operate();
		BeanUtil.CopyVO2PO(model, operate);
		operateService.saveEntity(operate);
		sysLogService.RecordLog("添加[ "+model.getOperateName()+" ]权限!");
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
		Operate operate = new Operate();
		BeanUtil.CopyVO2PO(model, operate);
		List<Operate> operateList = operateService.checkEntities(operate);
		request.setAttribute("operateName", model.getOperateName());
		request.setAttribute("operateUrl", model.getOperateUrl());
		ActionContext.getContext().put("operateList", operateList);
		sysLogService.RecordLog("查询权限!");
		return GlobalParam.LIST_UI;
	}
	
	public String EditUI(){
		Operate operate = new Operate();
		BeanUtil.CopyVO2PO(model, operate);
		operate = (Operate) operateService.checkEntityById(Operate.class, operate.getOperateId());
		BeanUtil.CopyPO2VO(operate, model);
		sysLogService.RecordLog("进入编辑[ "+model.getOperateName()+" ]权限页面!");
		return GlobalParam.EDITUI;
	}
	
	public String Update(){
		Operate operate = new Operate();
		BeanUtil.CopyVO2PO(model, operate);
		operateService.updateEntity(operate);
		sysLogService.RecordLog("更新[ "+model.getOperateName()+" ]权限!");
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
		for(Integer operateId : is){
			String sql = "delete from role_operate where operateId = " + operateId;
			operateService.executeSQL(sql);
		}
		operateService.deleteEntityByIds(Operate.class, is);
		sysLogService.RecordLog("删除权限ID为[ "+ids+" ]的"+is.length+"条权限!");
		return GlobalParam.LIST_ACTION;
	}

}
