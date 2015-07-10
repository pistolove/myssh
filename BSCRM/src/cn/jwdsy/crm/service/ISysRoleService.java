package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.SysRole;

public interface ISysRoleService extends ICommonService{
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.SysRoleServiceImpl";

	public List checkEntities(SysRole sysRole);

}
