package cn.jwdsy.crm.util;

import java.sql.Date;
import java.util.Calendar;

import org.apache.commons.lang.time.DateFormatUtils;
import org.junit.Test;


public class StringUtil {
	
	public static Integer[] ConvertStrings2Integers(String[] ids) {
		if(ids != null && ids.length > 0){
			Integer[] is = new Integer[ids.length];
			for(int i=0; i<ids.length; i++){
				try {
					is[i] = Integer.parseInt(ids[i]);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				}
			}
			return is;
		}
		return null;
	}
	
	@Test
	public void testConvert(){
		String[] ids = {"1","2","3","5"};
		System.err.println(ids[0].getClass());
		Integer[] is = ConvertStrings2Integers(ids);
		System.err.println(is[0].getClass());
	}
	
	
	@Test
	public void ConvertString2Date(){
		String df = DateFormatUtils.format(new Date(900998908898l), "yyyy-MM-dd HH:mm:ss");
		System.err.println(df);
		System.err.println(System.currentTimeMillis());
		 Calendar rightNow = Calendar.getInstance();
		 System.err.println(rightNow.getTime());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
