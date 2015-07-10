//package cn.jwdsy.crm.test;
//
//import java.io.OutputStream;
//import java.io.PrintStream;
//import java.util.ArrayList;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import cn.jwdsy.crm.core.ServiceProvider;
//import cn.jwdsy.crm.domain.SysUser;
//import cn.jwdsy.crm.service.ISysUserService;
//import cn.jwdsy.crm.util.ExcelFileGenerator;
//import cn.jwdsy.crm.util.ExpordName;
//
//public class TestExport {
//
//	private ISysUserService sysUserService = (ISysUserService) ServiceProvider.getService(ISysUserService.SERVICE_NAME);
//	private HttpServletRequest request ;
//	private HttpServletResponse response;
//	public HttpServletRequest getRequest() {
//		return request;
//	}
//	public void setRequest(HttpServletRequest request) {
//		this.request = request;
//	}
//	public HttpServletResponse getResponse() {
//		return response;
//	}
//	public void setResponse(HttpServletResponse response) {
//		this.response = response;
//	}
//	
//	public String export(){
//		try{
//			ArrayList nameList = ExpordName.userNameList;
//			//封装数据信息，放到arrayList对象中
//			ArrayList dataList =  (ArrayList) sysUserService.checkEntities(new SysUser());
//			//使用输出流去完成导出excel的操作
//			OutputStream out = response.getOutputStream();
//			response.reset();//重新设置
//			response.setContentType("application/vnd.ms-excel");//设置生成的格式
//			ExcelFileGenerator excelFileGenerator = new ExcelFileGenerator(nameList,dataList);
//			excelFileGenerator.expordExcel(out);
//			//做excel导出的时候，必须执行的代码
//			System.setOut(new PrintStream(out));
//			out.flush();
//			if(out!=null){
//				out.close();
//			}
//		}
//		catch (Exception e) {
//			throw new RuntimeException("导出excel错误");
//		}
//		return null;
//	}
//
//}
