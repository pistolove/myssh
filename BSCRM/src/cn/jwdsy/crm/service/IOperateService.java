package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.Operate;

public interface IOperateService extends ICommonService{
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.OperateServiceImpl";

	public List checkEntities(Operate operate);

}
