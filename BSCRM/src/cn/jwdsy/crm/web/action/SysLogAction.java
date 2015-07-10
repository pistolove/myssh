package cn.jwdsy.crm.web.action;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.SysLog;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.ExcelFileGenerator;
import cn.jwdsy.crm.util.ExportName;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.SysLogForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
public class SysLogAction extends BaseAction implements ModelDriven<SysLogForm>{

	private static final long serialVersionUID = 620070565861327524L;
	
	private SysLogForm model = new SysLogForm();
	
	public SysLogForm getModel() {
		return model;
	}
	
	public String Check(){
		SysLog sysLog = new SysLog();
		BeanUtil.CopyVO2PO(model, sysLog);
		List<SysLog> sysLogListRes = sysLogService.checkEntities(sysLog);
		List<SysLogForm> logList = new ArrayList<SysLogForm>();
		for(SysLog log : sysLogListRes){
			SysLogForm sysLogForm = new SysLogForm();
			BeanUtil.CopyPO2VO(log, sysLogForm);
			sysLogForm.setOperateTime(sysLogForm.getOperateTime().substring(0, 19));
			logList.add(sysLogForm);
		}
		request.setAttribute("username", model.getUsername());
		request.setAttribute("operateTime", model.getOperateTime());
		request.setAttribute("content", model.getContent());
		ActionContext.getContext().put("logList", logList);
		sysLogService.RecordLog("查询日志!");
		return GlobalParam.LIST_UI;
	}
	
	public String Delete(){
		String[] ids = request.getParameterValues("ids");
		Integer[] is = StringUtil.ConvertStrings2Integers(ids);
		sysLogService.deleteEntityByIds(SysLog.class, is);
		sysLogService.RecordLog("删除日志ID为[ "+ids+" ]的"+is.length+"条日志记录!");
		return GlobalParam.LIST_ACTION;
	}

	public String Export(){
		ServletContext sc = ServletActionContext.getServletContext();
		String ReportPath = sc.getRealPath("Report");
		String excelFileName = "日志信息_" + System.currentTimeMillis() + ".xls";
		String json = "Report/" + excelFileName;
		String excelFilePath = ReportPath + "\\" + excelFileName;
		try{
			ArrayList nameList = ExportName.logNameList;
			List userlist = sysLogService.checkEntities(new SysLog());
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
