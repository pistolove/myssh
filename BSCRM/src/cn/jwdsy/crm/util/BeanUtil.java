package cn.jwdsy.crm.util;

import java.lang.reflect.InvocationTargetException;

public class BeanUtil {
	
	
	//copyProperties(Object dest, Object orig)
	public static void CopyVO2PO(Object vo,Object po){
		try {
			BeanUtilsEnhance.copyProperties(po, vo);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	//copyProperties(Object dest, Object orig)
	public static void CopyPO2VO(Object po, Object vo){
		try {
			BeanUtilsEnhance.copyProperties(vo, po);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	

}
