package cn.jwdsy.crm.util;

import java.util.Date;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.lang.time.DateUtils;

public class DateConverter implements Converter {

	public DateConverter() {
	}

	public Object convert(Class type, Object value) {
		
		if (value == null) {
			return null;
		}

		if ("".equals(value)) {
			return null;
		}
		
		if (value instanceof Date) {
			return value;
		}

		try {
			return DateUtils.parseDate(value.toString(), new String[]{
				"yyyy-MM-dd", "yyyy-MM-dd HH:mm", "yyyy-MM-dd HH:mm:ss"
			});
//			return DateUtils.parseDateStrictly(value.toString(), new String[] {
//					"yyyy-MM-dd", "yyyy-MM-dd HH:mm", "yyyy-MM-dd HH:mm:ss" });
		} catch (Exception e) {
			throw new ConversionException(e);
		}
	}

	public static void main(String[] args) {

	}

}
