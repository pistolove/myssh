package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.SysLog;

public interface ISysLogService extends ICommonService{
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.SysLogServiceImpl";

	public void RecordLog(String content);

	public List checkEntities(SysLog sysLog);

}
