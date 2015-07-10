package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.jwdsy.crm.domain.SysUserGroup;
import cn.jwdsy.crm.service.ISysUserGroupService;

@Service(ISysUserGroupService.SERVICE_NAME)
public class SysUserGroupServiceImpl extends CommonServiceImpl implements ISysUserGroupService {

	public List checkEntities(SysUserGroup sysUserGroup) {
		
		if(sysUserGroup!=null){
			
			String whereHql="";
			
			//查询的实体类
			Class clazz=sysUserGroup.getClass();
			
			List paramsList=new ArrayList();
			
			//组织查询条件
			if(StringUtils.isNotBlank(sysUserGroup.getName())){
				whereHql = whereHql + " and o.name like ? ";
				paramsList.add("%"+sysUserGroup.getName().trim()+"%");
			}
			if(StringUtils.isNotBlank(sysUserGroup.getPrincipal())){
				whereHql = whereHql + " and o.principal like ? ";
				paramsList.add("%"+sysUserGroup.getPrincipal().trim()+"%");
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
