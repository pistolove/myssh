package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Operate implements Serializable {

	private static final long serialVersionUID = -2089880042032322866L;

	private Integer operateId;
	private String operateName;
	private String operateUrl;
	private Set<SysRole> roles = new HashSet<SysRole>();

	public Integer getOperateId() {
		return operateId;
	}

	public void setOperateId(Integer operateId) {
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

	public Set<SysRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<SysRole> roles) {
		this.roles = roles;
	}

}
