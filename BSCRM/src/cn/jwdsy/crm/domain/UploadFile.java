package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.Date;

public class UploadFile implements Serializable {
	
	private static final long serialVersionUID = -50468840492515339L;
	
	private Integer fileId;
	private Long fileSize;
	private String fileName;
	private String filePath;
	private SysUser uploadPerson;
	private Date uploadTime;
	private String suffix;
	
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public SysUser getUploadPerson() {
		return uploadPerson;
	}
	public void setUploadPerson(SysUser uploadPerson) {
		this.uploadPerson = uploadPerson;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getSuffix() {
		return suffix;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	
	
}
