package cn.jwdsy.crm.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.jwdsy.crm.dao.ICommonDao;
import cn.jwdsy.crm.service.ICommonService;


@Service(ICommonService.SERVICE_NAME)
public class CommonServiceImpl implements ICommonService{
	
	@Resource(name=ICommonDao.DAO_NAME)
	protected ICommonDao commonDao;

	public void saveEntity(Object entity) {
		commonDao.saveEntity(entity);
	}

	public void updateEntity(Object entity) {
		commonDao.updateEntity(entity);
	}

	public Object checkEntityById(Class clazz, Serializable id) {
		return commonDao.checkEntityById(clazz, id);
	}

	public void deleteEntities(Collection entities) {
		commonDao.deleteEntities(entities);
	}

	public void deleteEntityByIds(Class clazz, Serializable... ids) {
		commonDao.deleteEntityByIds(clazz, ids);
	}

	public List<Object> checkEntities(Class clazz, String whereHql,
			Object[] params, LinkedHashMap<String, String> orderby) {
		return commonDao.checkEntiries(clazz, whereHql, params, orderby);
	}

	public void executeSQL(String sql) {
		commonDao.executeSQL(sql);
	}

}
