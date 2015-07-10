package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.Date;

public class SysLog implements Serializable{

	private static final long serialVersionUID = 4140851935962655074L;

	private Integer logId;
	private String username;
	private Date operateTime;
	private String content;
	public Integer getLogId() {
		return logId;
	}
	public void setLogId(Integer logId) {
		this.logId = logId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	
}
