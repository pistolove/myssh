package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.service.ISysUserService;

@Service(ISysUserService.SERVICE_NAME)
public class SysUserServiceImpl extends CommonServiceImpl implements ISysUserService {

	public List checkEntities(SysUser sysUser) {

		if(sysUser!=null){
			
			String whereHql="";
			
			//查询的实体类
			Class clazz=sysUser.getClass();
			
			List paramsList=new ArrayList();
			
			//组织查询条件
			if(StringUtils.isNotBlank(sysUser.getName())){
				whereHql = whereHql + " and o.name like ? ";
				paramsList.add("%"+sysUser.getName().trim()+"%");
			}
			if(StringUtils.isNotBlank(sysUser.getPassword())){
				whereHql = whereHql + " and o.password = ?";
				paramsList.add(sysUser.getPassword().trim());
			}
			if(StringUtils.isNotBlank(sysUser.getCnname())){
				whereHql = whereHql + " and o.cnname like ? ";
				paramsList.add("%"+sysUser.getCnname().trim()+"%");
			}
			if(sysUser.getSysUserGroup()!=null && sysUser.getSysUserGroup().getGroupId()!=null){
				whereHql = whereHql + " and o.sysUserGroup.groupId = ? ";
				paramsList.add(sysUser.getSysUserGroup().getGroupId());
			}
			if(StringUtils.isNotBlank(sysUser.getDuty())){
				whereHql = whereHql + " and o.duty like ? ";
				paramsList.add("%"+sysUser.getDuty().trim()+"%");
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
