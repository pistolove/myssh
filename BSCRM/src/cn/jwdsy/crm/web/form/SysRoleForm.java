package cn.jwdsy.crm.web.form;

import java.io.Serializable;

public class SysRoleForm implements Serializable {

	private static final long serialVersionUID = 2350133251724498701L;
	private String roleId;
	private String roleName;
	private String remark;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
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

}
