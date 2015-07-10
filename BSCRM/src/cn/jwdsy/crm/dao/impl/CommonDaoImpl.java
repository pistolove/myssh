package cn.jwdsy.crm.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.jwdsy.crm.dao.ICommonDao;


@Scope("prototype")
@Repository(ICommonDao.DAO_NAME)
public class CommonDaoImpl extends HibernateDaoSupport implements ICommonDao {
	
	/* (non-Javadoc)
	 * @see cn.jwdsy.crm.dao.impl.ICommonDao#setSpringSessionFactory(org.hibernate.SessionFactory)
	 */
	@Resource(name="sessionFactory")
	public void setSpringSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	/* (non-Javadoc)
	 * @see cn.jwdsy.crm.dao.impl.CommonDao#saveEntiry(java.lang.Object)
	 */
	public void saveEntity(Object entity){
		this.getHibernateTemplate().save(entity);
	}
	
	/* (non-Javadoc)
	 * @see cn.jwdsy.crm.dao.impl.CommonDao#updateEntity(java.lang.Object)
	 */
	public void updateEntity(Object entity){
		this.getHibernateTemplate().merge(entity);
	}
	
	/* (non-Javadoc)
	 * @see cn.jwdsy.crm.dao.impl.CommonDao#deleteEntityByIds(java.lang.Class, java.io.Serializable)
	 */
	public void deleteEntityByIds(Class clazz,Serializable ... ids){
		if(ids != null && ids.length > 0){
			for(int i=0;i<ids.length;i++){
				Object obj = this.getHibernateTemplate().get(clazz, ids[i]);
				if(obj != null){
					this.getHibernateTemplate().delete(obj);
				}else{
					throw new RuntimeException("id为["+ids[i]+"]所对应的实体不存在!");
				}
			}
		}
	}
	
	/* (non-Javadoc)
	 * @see cn.jwdsy.crm.dao.impl.CommonDao#deleteEntities(java.util.Collection)
	 */
	public void deleteEntities(Collection entities){
		this.getHibernateTemplate().deleteAll(entities);
	}
	
	/* (non-Javadoc)
	 * @see cn.jwdsy.crm.dao.impl.CommonDao#checkEntityById(java.lang.Class, java.io.Serializable)
	 */
	public Object checkEntityById(Class clazz,Serializable id){
		Object obj = this.getHibernateTemplate().get(clazz, id);
//		if(obj == null){
//			throw new RuntimeException("id为["+id+"]所对应的实体不存在!");
//		}
		return obj;
	}

	public List<Object> checkEntiries(Class clazz, String whereHql,
			final Object[] params, LinkedHashMap<String, String> orderby) {
		String className = clazz.getSimpleName() ;
//		String hql = " select o from " + className + " o " ;
		String hql = " from " + className + " o " ;
		
		//设置条件
		if(StringUtils.isNotBlank(whereHql)){
			hql = hql + " where 1 = 1 " + whereHql ;
		}
		
		//设置排序
		String orderByStr = createOrderBy(orderby);
		
		hql = hql + orderByStr ;
		
		final String fhql = hql;
		
		List list = (List) this.getHibernateTemplate().execute(new HibernateCallback(){

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(fhql).setCacheable(true);
				setQueryParams(query, params);
				return query.list();
			}
			/**
			 * 设置参数
			 * @param query
			 * @param params
			 */
			private void setQueryParams(Query query, Object[] params) {
				
				/**HQL带in关键字查询
				 * String hql="FROM A WHERE A.ID IN (:list)";  
					Query query = getSession().createQuery(hql);  
					query.setParameterList("list", a);  
				 */
				if(query != null){
					if(params != null && params.length > 0){
						for(int i=0 ;i < params.length ; i++){
							if(params[i] instanceof Collection<?>){  
			                    query.setParameterList("List", (Collection<?>)params[i]);
			                }else if(params[i] instanceof Object[]){  
			                    query.setParameterList("List", (Object[])params[i]);
			                }else{  
			                    query.setParameter(i, params[i]);  
			                }
						}
					}
				}
				
			}
			
		});
		
		return list;
	}
	
	/**
	 * 组织排序 order by 
	 * @param orderby
	 * @return
	 */
	private String createOrderBy(LinkedHashMap<String, String> orderby) {
		StringBuffer orderBuff = new StringBuffer("");
		if(orderby != null && !orderby.isEmpty()){
			orderBuff.append(" order by ");
			for(Map.Entry<String, String> map : orderby.entrySet()){
				orderBuff.append(map.getKey() + " " + map.getValue() + " , ");
			}
			orderBuff.deleteCharAt(orderBuff.indexOf(","));
		}
		return orderBuff.toString();
	}

	public void executeSQL(String sql) {
		Session session = null;
		Transaction tx = null;
		try {
			session = this.getHibernateTemplate().getSessionFactory().openSession();
			tx = session.beginTransaction();
			SQLQuery query = session.createSQLQuery(sql);
			query.executeUpdate();
			tx.commit();
		} catch (HibernateException e) {
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}
	}


	public List checkQuery4List(String sql) {
		 Session session = this.getSession();  
		 List list = session.createSQLQuery(sql).list();  
		return list;
	}
	
	


}
