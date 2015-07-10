package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.SysUserGroup;

public interface ISysUserGroupService extends ICommonService {
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.SysUserGroupServiceImpl";

	public List checkEntities(SysUserGroup sysUserGroup);

}
