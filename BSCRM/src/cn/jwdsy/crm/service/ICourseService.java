package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.Course;

public interface ICourseService extends ICommonService {
	
	public static String SERVICE_NAME = "cn.jwdsy.crm.service.impl.CourseServiceImpl";

	public List checkEntities(Course course);

}
