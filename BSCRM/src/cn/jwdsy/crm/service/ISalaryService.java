package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.Salary;

public interface ISalaryService extends ICommonService{
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.SalaryServiceImpl";
	
	public List checkEntities(Salary salary);

	public List QueryChart();

}
