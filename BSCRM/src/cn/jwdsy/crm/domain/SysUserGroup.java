package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class SysUserGroup implements Serializable{
	
	private static final long serialVersionUID = 2089667361374352378L;
	/*
	 * #部门信息表
		CREATE TABLE `sys_user_group` (
		  `id` INTEGER(11) NOT NULL AUTO_INCREMENT,               #编号
		  `remark` TEXT,                                          #备注
		  `name` VARCHAR(100) DEFAULT NULL,                       #部门名称
		  `principal` VARCHAR(50)  DEFAULT NULL,                  #部门负责人
		  `incumbent` VARCHAR(200)  DEFAULT NULL,                 #部门职能
		  PRIMARY KEY (`id`)
		)
	 */
	private Integer groupId;
	private String remark;
	private String name;
	private String principal;
	private String incumbent;
	private Set<SysUser> users = new HashSet<SysUser>();
	
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public String getIncumbent() {
		return incumbent;
	}
	public void setIncumbent(String incumbent) {
		this.incumbent = incumbent;
	}
	public Set<SysUser> getUsers() {
		return users;
	}
	public void setUsers(Set<SysUser> users) {
		this.users = users;
	}
	
	
	
	

}
