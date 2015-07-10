package cn.jwdsy.crm.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.context.annotation.Scope;

import cn.jwdsy.crm.domain.Course;
import cn.jwdsy.crm.util.BeanUtil;
import cn.jwdsy.crm.util.GlobalParam;
import cn.jwdsy.crm.util.StringUtil;
import cn.jwdsy.crm.web.form.CourseForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
public class CourseAction extends BaseAction implements ModelDriven<CourseForm>{

	private static final long serialVersionUID = 7542957154807342860L;
	
	private CourseForm model = new CourseForm();
	
	public CourseForm getModel() {
		return model;
	}
	
	public String AddUI(){
		sysLogService.RecordLog("进入课程添加页面!");
		return GlobalParam.ADD_UI;
	}
	
	public String Save(){
		Course course = new Course();
		BeanUtil.CopyVO2PO(model, course);
		courseService.saveEntity(course);
		sysLogService.RecordLog("保存[ "+model.getClassName()+" ]课程!");
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
		Course course = new Course();
		BeanUtil.CopyVO2PO(model, course);
		List<Course> courseList = courseService.checkEntities(course);
		request.setAttribute("className", model.getClassName());
		request.setAttribute("price", model.getPrice());
		request.setAttribute("status", model.getStatus());
		ActionContext.getContext().put("courseList", courseList);
		sysLogService.RecordLog("查询课程!");
		return GlobalParam.LIST_UI;
	}
	
	public String EditUI(){
		Course course = new Course();
		BeanUtil.CopyVO2PO(model, course);
		course = (Course) courseService.checkEntityById(Course.class, course.getCourseId());
		BeanUtil.CopyPO2VO(course, model);
		sysLogService.RecordLog("进入编辑[ "+model.getClassName()+" ]课程页面!");
		return GlobalParam.EDITUI;
	}
	
	public String Update(){
		Course course = new Course();
		BeanUtil.CopyVO2PO(model, course);
		courseService.updateEntity(course);
		sysLogService.RecordLog("更新[ "+model.getClassName()+" ]课程!");
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
		courseService.deleteEntityByIds(Course.class, is);
		sysLogService.RecordLog("删除课程ID为[ "+ids+" ]的"+is.length+"条课程记录!");
		return GlobalParam.LIST_ACTION;
	}



}
