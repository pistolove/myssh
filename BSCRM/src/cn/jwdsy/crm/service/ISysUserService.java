package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.SysUser;

public interface ISysUserService extends ICommonService {
	
	public static String SERVICE_NAME = "cn.jwdsy.crm.service.impl.SysUserServiceImpl";

	public List checkEntities(SysUser sysUser);

}
