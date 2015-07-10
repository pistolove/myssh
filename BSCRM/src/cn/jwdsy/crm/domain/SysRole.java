package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class SysRole implements Serializable {

	private static final long serialVersionUID = 3629003808340998374L;
	private Integer roleId;
	private String roleName;
	private String remark;
	private Set<SysUser> users = new HashSet<SysUser>();
	private Set<Operate> operates = new HashSet<Operate>();
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Set<SysUser> getUsers() {
		return users;
	}
	public void setUsers(Set<SysUser> users) {
		this.users = users;
	}
	public Set<Operate> getOperates() {
		return operates;
	}
	public void setOperates(Set<Operate> operates) {
		this.operates = operates;
	}

	
}
