package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;

import cn.jwdsy.crm.domain.SysRole;
import cn.jwdsy.crm.service.ISysRoleService;

@Controller(ISysRoleService.SERVICE_NAME)
public class SysRoleServiceImpl extends CommonServiceImpl implements ISysRoleService{

	public List checkEntities(SysRole sysRole) {
		
		if(sysRole!=null){
			
			String whereHql="";
			
			//查询的实体类
			Class clazz=sysRole.getClass();
			
			List paramsList=new ArrayList();
			
			//组织查询条件
			if(StringUtils.isNotBlank(sysRole.getRoleName())){
				whereHql = whereHql + " and o.roleName like ? ";
				paramsList.add("%"+sysRole.getRoleName().trim()+"%");
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
