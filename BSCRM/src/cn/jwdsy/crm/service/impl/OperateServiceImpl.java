package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.jwdsy.crm.domain.Operate;
import cn.jwdsy.crm.service.IOperateService;

@Service(IOperateService.SERVICE_NAME)
public class OperateServiceImpl extends CommonServiceImpl implements IOperateService{

	public List checkEntities(Operate operate) {
		
		if(operate!=null){
			
			String whereHql="";
			
			//查询的实体类
			Class clazz=operate.getClass();
			
			List paramsList=new ArrayList();
			
			//组织查询条件
			if(StringUtils.isNotBlank(operate.getOperateName())){
				whereHql = whereHql + " and o.operateName like ? ";
				paramsList.add("%"+operate.getOperateName().trim()+"%");
			}
			if(StringUtils.isNotBlank(operate.getOperateUrl())){
				whereHql = whereHql + " and o.operateUrl like ? ";
				paramsList.add("%"+operate.getOperateUrl().trim()+"%");
			}
			
			//设置?参数
			Object params[]=paramsList.toArray();
			
			//设置排序  order by o.id desc ,o.name asc
		    LinkedHashMap<String, String>  orderby=new  LinkedHashMap<String, String>();
		    orderby.put("o.operateId", "asc");
		    
		    //开始查询
			
			return super.checkEntities(clazz, whereHql, params, orderby);
		}
		return null;
	}

}
