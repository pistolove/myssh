package cn.jwdsy.crm.core;

import org.apache.commons.lang.xwork.StringUtils;

public class ServiceProvider {
	
	private static ServiceProviderCore sc = null;
	
	static {
		sc = new ServiceProviderCore();
		sc.load("spring/applicationContext.xml");
	}

	public static Object getService(String beanName){
		if(StringUtils.isBlank(beanName)){
			throw new RuntimeException("您要查找的服务名称不能为空!");
		}
		//判断查找的服务名是否在Spring容器中存在，true存在，false不存在
		if(!sc.applicationContext.containsBean(beanName)){
			throw new RuntimeException("您要查找的服务["+beanName+"]不在spring容器中!");
		}
		Object bean = sc.applicationContext.getBean(beanName);
		if(bean == null){
			throw new RuntimeException("你所查找服务["+beanName+"]的实体不存在!");
		}
		return bean;
	}
}
