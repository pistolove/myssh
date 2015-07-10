package cn.jwdsy.crm.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.SessionFactory;

public interface ICommonDao {
	
	public final static String DAO_NAME = "cn.jwdsy.crm.dao.impl.CommonDaoImpl";
	
	/**
	 * 注入sessionfactory来创建hibernateTemplate
	 * @param sessionFactory
	 */
	public void setSpringSessionFactory(SessionFactory sessionFactory);

	/**
	 * 保存实体
	 * @param entity
	 */
	public void saveEntity(Object entity);

	/**
	 * 修改实体
	 * @param entity
	 */
	public void updateEntity(Object entity);

	/**
	 * 根据多个id删除多个实体
	 * @param clazz
	 * @param ids
	 */
	public void deleteEntityByIds(Class clazz, Serializable... ids);

	/**
	 * 删除集合中存放实体
	 * @param entities
	 */
	public void deleteEntities(Collection entities);

	/**
	 * 根据id查询实体
	 * @param clazz
	 * @param id
	 * @return
	 */
	public Object checkEntityById(Class clazz, Serializable id);
	
	/**
	 * 根据条件查询所有数据
	 * @param clazz
	 * @param whereHql
	 * @param params
	 * @param orderby
	 * @return
	 */
	public List<Object> checkEntiries(Class clazz, String whereHql,
			Object[] params, LinkedHashMap<String, String> orderby);
	/**
	 * 执行一条sql语句
	 * @param sql
	 */
	public void executeSQL(String sql);

	/**
	 * 执行一条sql语句返回集合
	 * @param sql
	 * @return
	 */
	public List checkQuery4List(String sql);

}