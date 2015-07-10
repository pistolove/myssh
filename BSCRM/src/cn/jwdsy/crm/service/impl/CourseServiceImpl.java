package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.jwdsy.crm.domain.Course;
import cn.jwdsy.crm.service.ICourseService;

@Service(ICourseService.SERVICE_NAME)
public class CourseServiceImpl extends CommonServiceImpl implements ICourseService{

	public List checkEntities(Course course) {
		
		if(course!=null){
			
			String whereHql="";
			
			//查询的实体类
			Class clazz=course.getClass();
			
			List paramsList=new ArrayList();
			
			//组织查询条件
			if(StringUtils.isNotBlank(course.getClassName())){
				whereHql = whereHql + " and o.className like ? ";
				paramsList.add("%"+course.getClassName().trim()+"%");
			}
			if(StringUtils.isNotBlank(course.getTarget())){
				whereHql = whereHql + " and o.target like ?";
				paramsList.add("%"+course.getTarget().trim()+"%");
			}
			if(StringUtils.isNotBlank(course.getStatus())){
				whereHql = whereHql + " and o.status = ? ";
				paramsList.add(course.getStatus().trim());
			}
			
			//设置?参数
			Object params[]=paramsList.toArray();
			
			//设置排序  order by o.id desc ,o.name asc
		    LinkedHashMap<String, String>  orderby=new  LinkedHashMap<String, String>();
		    orderby.put("o.id", "asc");
		    
		    //开始查询
			
			return super.checkEntities(clazz, whereHql, params, orderby);
		}
		return null;
	}

}
