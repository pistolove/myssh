package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;

import cn.jwdsy.crm.domain.Salary;
import cn.jwdsy.crm.service.ISalaryService;
import cn.jwdsy.crm.util.WebUtils;

@Controller(ISalaryService.SERVICE_NAME)
public class SalaryServiceImpl extends CommonServiceImpl implements
		ISalaryService {

	public List checkEntities(Salary salary) {

		if (salary != null) {

			String whereHql = "";

			// 查询的实体类
			Class clazz = salary.getClass();

			List paramsList = new ArrayList();

			// 组织查询条件
			if (StringUtils.isNotBlank(salary.getUserName())) {
				whereHql = whereHql + " and o.userName like ? ";
				paramsList.add("%" + salary.getUserName().trim() + "%");
			}
			if (StringUtils.isNotBlank(salary.getGroupName())) {
				whereHql = whereHql + " and o.groupName like ? ";
				paramsList.add("%" + salary.getGroupName().trim() + "%");
			}
			if (salary.getPayday() != null) {
				whereHql = whereHql + " and o.payday  =  ? ";
				java.sql.Date payDay = WebUtils.getSQLDate(salary.getPayday());
				paramsList.add(payDay);
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

	public List QueryChart() {
		java.sql.Date payDay = WebUtils.getSQLDate(new Date());
		String curMonth = payDay.toString().substring(0, 7);
		String sql = " SELECT ";
				sql += " COUNT(*) 'number',";
				sql += " CASE ";
				sql += " WHEN s.summation <= 1000  ";
				sql += " THEN '1000￥以下'  ";
				sql += " WHEN s.summation <= 2000  ";
				sql += " THEN '1000￥~2000￥'  ";
				sql += " WHEN s.summation <= 2500  ";
				sql += " THEN '2000￥~2500￥'  ";
				sql += " WHEN s.summation <= 3000  ";
				sql += " THEN '2500￥~3000￥'  ";
				sql += " WHEN s.summation <= 3500  ";
				sql += " THEN '3000￥~3500￥'  ";
				sql += " WHEN s.summation <= 4000  ";
				sql += " THEN '3500￥~4000￥'  ";
				sql += " WHEN s.summation <= 4500  ";
				sql += " THEN '4000￥~4500￥'  ";
				sql += " WHEN s.summation <= 5000  ";
				sql += " THEN '4500￥~5000￥'  ";
				sql += " WHEN s.summation <= 5500  ";
				sql += " THEN '5000￥~5500￥'  ";
				sql += " WHEN s.summation <= 6000  ";
				sql += " THEN '5500￥~6000￥'  ";
				sql += " WHEN s.summation <= 6500  ";
				sql += " THEN '6000￥~6500￥'  ";
				sql += " WHEN s.summation <= 7000  ";
				sql += " THEN '6500￥~7000￥'  ";
				sql += " WHEN s.summation <= 7500  ";
				sql += " THEN '7000￥~7500￥'  ";
				sql += " WHEN s.summation <= 8000  ";
				sql += " THEN '7500￥~8000￥'  ";
				sql += " WHEN s.summation <= 8500  ";
				sql += " THEN '8000￥~8500￥'  ";
				sql += " WHEN s.summation <= 9000  ";
				sql += " THEN '8500￥~9000￥'  ";
				sql += " WHEN s.summation <= 9500  ";
				sql += " THEN '9000￥~9500￥'  ";
				sql += " WHEN s.summation <= 10000  ";
				sql += " THEN '9500￥~10000￥'  ";
				sql += " WHEN s.summation > 10000  ";
				sql += " THEN '10000￥以上'  ";
				sql += " END AS policy  ";
				sql += " FROM ";
				sql += " salary s  ";
				sql += " where s.payday like '%" + curMonth + "%'";
				sql += " GROUP BY policy  ";
		List list = commonDao.checkQuery4List(sql);
		return list;
	}

}
