package cn.jwdsy.crm.test;


import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import cn.jwdsy.crm.domain.Salary;
import cn.jwdsy.crm.domain.SysUser;
import cn.jwdsy.crm.domain.SysUserGroup;

public class TestHibernate {

	public static void main(String[] args) {
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		System.err.println(session);
		
//		Transaction tx = session.beginTransaction();
		
//		SysUserGroup sysUserGroup = new SysUserGroup();
//		sysUserGroup.setGroupId(10001);
//		sysUserGroup.setName("jwdsy name");
//		sysUserGroup.setPrincipal("jwdsy principal");
//		sysUserGroup.setIncumbent("jwdsy incumbent");
//		sysUserGroup.setRemark("jwdsy remark");
//		session.save(sysUserGroup);
//		
//		Salary salary = new Salary();
//		salary.setGroup(sysUserGroup);
//		session.save(salary);
//		tx.commit();
		session.close();

	}
	
	@Test
	public void testInsert(){
		Configuration config = new Configuration();
		config.configure("hibernate/hibernate.cfg.xml");
		
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		
		Transaction tx = session.beginTransaction();
		
		SysUser sysUser = new SysUser();
		sysUser.setBirthday(new Date());
		System.err.println(new Date());
		session.save(sysUser);
		
		tx.commit();
		session.close();

	}

}
