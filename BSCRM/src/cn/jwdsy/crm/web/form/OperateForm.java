package cn.jwdsy.crm.web.form;

import java.io.Serializable;

public class OperateForm implements Serializable {

	private static final long serialVersionUID = -1877413794872773543L;

	private String operateId;
	private String operateName;
	private String operateUrl;

	public String getOperateId() {
		return operateId;
	}

	public void setOperateId(String operateId) {
		this.operateId = operateId;
	}

	public String getOperateName() {
		return operateName;
	}

	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}

	public String getOperateUrl() {
		return operateUrl;
	}

	public void setOperateUrl(String operateUrl) {
		this.operateUrl = operateUrl;
	}

}
