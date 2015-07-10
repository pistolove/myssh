package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class SysUser implements Serializable{
	
	private static final long serialVersionUID = 1342979062917796806L;
	/*
	 * 
		CREATE TABLE `sys_user` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `name` varchar(20) NOT NULL,
		  `cnname` varchar(20) DEFAULT NULL,
		  `password` varchar(20) NOT NULL,
		  `commendMan` varchar(20) DEFAULT NULL,
		  `movetelePhone` varchar(20) DEFAULT NULL,
		  `email` varchar(100) DEFAULT NULL,
		  `address` varchar(200) DEFAULT NULL,
		  `telephone` varchar(20) DEFAULT NULL,
		  `nowAddress` varchar(200) DEFAULT NULL,
		  `nowtelePhone` varchar(20) DEFAULT NULL,
		  `identityCode` varchar(20) DEFAULT NULL,
		  `instancyLinkman` varchar(20) DEFAULT NULL,
		  `instancytelePhone` varchar(20) DEFAULT NULL,
		  `roleId` int(11) NOT NULL,
		  `groupId` int(11) NOT NULL,
		  `sex` varchar(2) DEFAULT NULL,
		  `birthday` date DEFAULT NULL,
		  `duty` varchar(20) DEFAULT NULL,
		  `workDate` date DEFAULT NULL,
		  `highSchool` varchar(100) DEFAULT NULL,
		  `finishSchool` varchar(100) DEFAULT NULL,
		  `finishSchoolDate` date DEFAULT NULL,
		  `remark` text,
		  `creator` varchar(100) DEFAULT NULL,
		  `createTime` date DEFAULT NULL,
		  `updater` varchar(100) DEFAULT NULL,
		  `updateTime` date DEFAULT NULL,
		  PRIMARY KEY (`id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8



	 */
	private Integer userId ; //#编号  
	private String name;// #用户名  notnull
	private String cnname;// #中文名
	private String password;//  #密码  notnull
	private String commendMan;//  #推荐人
	private String movetelePhone;//    #移动电话
	private String email;//   #电子邮件
	private String address;//   #家庭地址
	private String telephone;// #家庭电话
	private String nowAddress;// #现住宅地址
	private String nowtelePhone;//#现住宅电话
	private String identityCode;//   #身份证号码
	private String instancyLinkman;//   #紧急联系人
	private String instancytelePhone;//  #紧急联系电话
	private SysRole sysRole;//    #操作权限组 (外键##################)
	private SysUserGroup sysUserGroup;// #所属部门   (外键##################)
	
	private String sex;//   #性别
	private Date birthday;//  #出生日期
	private String duty;//  #职务
	private Date workDate;// #入职时间
	private String highSchool;//  #最高学历
	private String finishSchool;//   #毕业学校
	private Date finishSchoolDate;//  #毕业时间
	private String remark;// #备注
	
	private String creator;// #创建人
	private Date createTime;//#创建时间
	private String updater;// #修改人
	private Date updateTime;//#修改时间
	
	private Set<Salary> salaries = new HashSet<Salary>();
	private Set<UploadFile> uploadFiles = new HashSet<UploadFile>();
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCnname() {
		return cnname;
	}
	public void setCnname(String cnname) {
		this.cnname = cnname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCommendMan() {
		return commendMan;
	}
	public void setCommendMan(String commendMan) {
		this.commendMan = commendMan;
	}
	public String getMovetelePhone() {
		return movetelePhone;
	}
	public void setMovetelePhone(String movetelePhone) {
		this.movetelePhone = movetelePhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getNowAddress() {
		return nowAddress;
	}
	public void setNowAddress(String nowAddress) {
		this.nowAddress = nowAddress;
	}
	public String getNowtelePhone() {
		return nowtelePhone;
	}
	public void setNowtelePhone(String nowtelePhone) {
		this.nowtelePhone = nowtelePhone;
	}
	public String getIdentityCode() {
		return identityCode;
	}
	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}
	public String getInstancyLinkman() {
		return instancyLinkman;
	}
	public void setInstancyLinkman(String instancyLinkman) {
		this.instancyLinkman = instancyLinkman;
	}
	public String getInstancytelePhone() {
		return instancytelePhone;
	}
	public void setInstancytelePhone(String instancytelePhone) {
		this.instancytelePhone = instancytelePhone;
	}
	public SysRole getSysRole() {
		return sysRole;
	}
	public void setSysRole(SysRole sysRole) {
		this.sysRole = sysRole;
	}
	public SysUserGroup getSysUserGroup() {
		return sysUserGroup;
	}
	public void setSysUserGroup(SysUserGroup sysUserGroup) {
		this.sysUserGroup = sysUserGroup;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public Date getWorkDate() {
		return workDate;
	}
	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
	public String getHighSchool() {
		return highSchool;
	}
	public void setHighSchool(String highSchool) {
		this.highSchool = highSchool;
	}
	public String getFinishSchool() {
		return finishSchool;
	}
	public void setFinishSchool(String finishSchool) {
		this.finishSchool = finishSchool;
	}
	public Date getFinishSchoolDate() {
		return finishSchoolDate;
	}
	public void setFinishSchoolDate(Date finishSchoolDate) {
		this.finishSchoolDate = finishSchoolDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Set<Salary> getSalaries() {
		return salaries;
	}
	public void setSalaries(Set<Salary> salaries) {
		this.salaries = salaries;
	}
	public Set<UploadFile> getUploadFiles() {
		return uploadFiles;
	}
	public void setUploadFiles(Set<UploadFile> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}
	
}
