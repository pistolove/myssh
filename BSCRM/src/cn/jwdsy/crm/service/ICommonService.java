package cn.jwdsy.crm.service;

import java.io.Serializable;
import java.util.Collection;


public interface ICommonService {
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.CommonServiceImpl";
	
	public void saveEntity(Object entity);
	
	public void updateEntity(Object entity);
	
	public void deleteEntityByIds(Class clazz, Serializable... ids);

	public void deleteEntities(Collection entities);

	public Object checkEntityById(Class clazz, Serializable id);
	
	public void executeSQL(String sql);


}
