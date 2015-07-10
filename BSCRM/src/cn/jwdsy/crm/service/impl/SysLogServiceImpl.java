package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.jwdsy.crm.domain.SysLog;
import cn.jwdsy.crm.service.ISysLogService;
import cn.jwdsy.crm.util.WebUtils;

@Service(ISysLogService.SERVICE_NAME)
public class SysLogServiceImpl extends CommonServiceImpl implements ISysLogService{

	public void RecordLog(String content) {
		SysLog sysLog = new SysLog();
		String currentUser = WebUtils.getUserInSession().getCnname();
		sysLog.setUsername(currentUser);
		sysLog.setContent(content);
		sysLog.setOperateTime(new Date());
		super.saveEntity(sysLog);
	}

	public List checkEntities(SysLog sysLog) {
		
		if (sysLog != null) {

			String whereHql = "";

			// 查询的实体类
			Class clazz = sysLog.getClass();

			List paramsList = new ArrayList();

			// 组织查询条件
			if (StringUtils.isNotBlank(sysLog.getUsername())) {
				whereHql = whereHql + " and o.username like ? ";
				paramsList.add("%" + sysLog.getUsername().trim() + "%");
			}
			if (StringUtils.isNotBlank(sysLog.getContent())) {
				whereHql = whereHql + " and o.content like ? ";
				paramsList.add("%" + sysLog.getContent().trim() + "%");
			}
			if (sysLog.getOperateTime()!=null) {
				whereHql = whereHql + " and o.operateTime  =  ? ";
				java.sql.Date operateTime = WebUtils.getSQLDate(sysLog.getOperateTime());
				paramsList.add(operateTime);
			}

			// 设置?参数
			Object params[] = paramsList.toArray();

			// 设置排序 order by o.id desc ,o.name asc
			LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
			orderby.put("o.id", "asc");

			// 开始查询

			return super.checkEntities(clazz, whereHql, params, orderby);
		}
		return null;
	}

}
