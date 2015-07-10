package cn.jwdsy.crm.core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServiceProviderCore {
	
	protected ApplicationContext applicationContext = null;
	
	public void load(String filename){
		applicationContext = new ClassPathXmlApplicationContext(filename);
	}

}
