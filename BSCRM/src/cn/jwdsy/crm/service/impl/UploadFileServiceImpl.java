package cn.jwdsy.crm.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import cn.jwdsy.crm.domain.UploadFile;
import cn.jwdsy.crm.service.IUploadFileService;
import cn.jwdsy.crm.util.WebUtils;

@Service(IUploadFileService.SERVICE_NAME)
public class UploadFileServiceImpl extends CommonServiceImpl implements IUploadFileService{

	public List checkEntities(UploadFile uploadFile) {
		
		if(uploadFile!=null){
			
			String whereHql="";
			
			//查询的实体类
			Class clazz=uploadFile.getClass();
			
			List paramsList=new ArrayList();
			
			//组织查询条件
			if(StringUtils.isNotBlank(uploadFile.getFileName())){
				whereHql = whereHql + " and o.fileName like ? ";
				paramsList.add("%"+uploadFile.getFileName().trim()+"%");
			}
			if(uploadFile.getUploadPerson()!=null){
				whereHql = whereHql + " and o.uploadPerson = ?";
				paramsList.add(uploadFile.getUploadPerson());
			}
			if (uploadFile.getUploadTime()!=null) {
				whereHql = whereHql + " and o.uploadTime  =  ? ";
				java.sql.Date uploadTime = WebUtils.getSQLDate(uploadFile.getUploadTime());
				paramsList.add(uploadTime);
			}
			/**HQL带in关键字查询
			 * String hql="FROM A WHERE A.ID IN (:alist)";  
				Query query = getSession().createQuery(hql);  
				query.setParameterList("alist", a);  
			 */
			if(StringUtils.isNotBlank(uploadFile.getSuffix())){
				whereHql = whereHql + " and o.suffix in (:List) ";
				List<String> suffixs = new ArrayList<String>();
				suffixs.add("jpg");
				suffixs.add("jpeg");
				suffixs.add("gif");
				suffixs.add("bmp");
				suffixs.add("png");
				suffixs.add("JPG");
				suffixs.add("JPEG");
				suffixs.add("GIF");
				suffixs.add("BMP");
				suffixs.add("PNG");
				paramsList.add(suffixs);
			}
			
			//设置?参数
			Object params[]=paramsList.toArray();
			
			//设置排序  order by o.id desc ,o.name asc
		    LinkedHashMap<String, String>  orderby=new  LinkedHashMap<String, String>();
		    orderby.put("o.id", "asc");
		    
		    //开始查询
			
			return super.checkEntities(clazz, whereHql, params, orderby);
		}
		return null;
	}

}
