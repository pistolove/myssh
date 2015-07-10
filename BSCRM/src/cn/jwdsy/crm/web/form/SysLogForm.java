package cn.jwdsy.crm.web.form;

import java.io.Serializable;

public class SysLogForm implements Serializable{

	private static final long serialVersionUID = -2411254836871388156L;
	private String logId;
	private String username;
	private String operateTime;
	private String content;
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
