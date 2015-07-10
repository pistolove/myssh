package cn.jwdsy.crm.util;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;

public class BeanUtilsEnhance extends BeanUtils {

	private BeanUtilsEnhance() {
	}

	static {
		//日期类型采用自定义转换
		ConvertUtils.register(new DateConverter(), java.util.Date.class);
	}

	public static void copyProperties(Object target, Object source)
			throws InvocationTargetException, IllegalAccessException {
		// 支持对日期copy
		org.apache.commons.beanutils.BeanUtils.copyProperties(target, source);
	}
	
	

}