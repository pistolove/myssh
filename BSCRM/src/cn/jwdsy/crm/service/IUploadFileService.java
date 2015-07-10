package cn.jwdsy.crm.service;

import java.util.List;

import cn.jwdsy.crm.domain.UploadFile;


public interface IUploadFileService extends ICommonService {
	
	public static final String SERVICE_NAME = "cn.jwdsy.crm.service.impl.UploadFileServiceImpl";

	public List checkEntities(UploadFile uploadFile);
}
