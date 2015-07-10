package cn.jwdsy.crm.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.jwdsy.crm.core.ServiceProvider;
import cn.jwdsy.crm.dao.ICommonDao;
import cn.jwdsy.crm.domain.SysUserGroup;
import cn.jwdsy.crm.service.ICommonService;

public class TestSpring {
	
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
		System.err.println(applicationContext);
		ICommonDao commonDao = (ICommonDao) applicationContext.getBean("commonDao");
		SysUserGroup sysUserGroup = new SysUserGroup();
		sysUserGroup.setGroupId(123132);
		sysUserGroup.setName("jwdsy name spring");
		sysUserGroup.setPrincipal("jwdsy principal spring");
		sysUserGroup.setIncumbent("jwdsy incumbent spring");
		sysUserGroup.setRemark("jwdsy remark spring");
		commonDao.saveEntity(sysUserGroup);
	}
	
	@Test
	public void testSpringContainer(){
		ICommonDao commonDao = (ICommonDao) ServiceProvider.getService("commonDao");
		
		SysUserGroup sysUserGroup = new SysUserGroup();
		sysUserGroup.setGroupId(123123);
		sysUserGroup.setName("jwdsy name spring container");
		sysUserGroup.setPrincipal("jwdsy principal spring container");
		sysUserGroup.setIncumbent("jwdsy incumbent spring container");
		sysUserGroup.setRemark("jwdsy remark spring container");
		commonDao.saveEntity(sysUserGroup);
		
	}
	
	@Test
	public void testSpringContainer2(){
		ICommonDao commonDao = (ICommonDao) ServiceProvider.getService(ICommonDao.DAO_NAME);
		
		SysUserGroup sysUserGroup = new SysUserGroup();
		sysUserGroup.setGroupId(3124312);
		sysUserGroup.setName("jwdsy name spring container");
		sysUserGroup.setPrincipal("jwdsy principal spring container");
		sysUserGroup.setIncumbent("jwdsy incumbent spring container");
		sysUserGroup.setRemark("jwdsy remark spring container");
		commonDao.saveEntity(sysUserGroup);
		
	}
	
	@Test
	public void testSpringContainerService(){
		ICommonService commonService = (ICommonService) ServiceProvider.getService(ICommonService.SERVICE_NAME);
		
		SysUserGroup sysUserGroup = new SysUserGroup();
		sysUserGroup.setName("jwdsy name spring container service");
		sysUserGroup.setPrincipal("jwdsy principal spring container service");
		sysUserGroup.setIncumbent("jwdsy incumbent spring container service");
		sysUserGroup.setRemark("jwdsy remark spring container service");
		commonService.saveEntity(sysUserGroup);
		
	}
	@Test
	public void testSpringContainerService1(){
		ICommonService commonService = (ICommonService) ServiceProvider.getService(ICommonService.SERVICE_NAME);
		SysUserGroup sysUserGroup = (SysUserGroup) commonService.checkEntityById(SysUserGroup.class, 2);
		System.err.println(sysUserGroup.toString());
		
	}
	


}
