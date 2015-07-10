package cn.jwdsy.crm.web.form;

import java.io.Serializable;
import java.util.Date;


public class SysUserForm implements Serializable{
	
	private static final long serialVersionUID = 8493619965728881663L;
	
	private String userId ; //#编号  
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
	private String roleId;//    #操作权限组 (外键##################)
	private String groupId;// #所属部门   (外键##################)
	
	private String sex;//   #性别
	private String sexs;//   #性别
	public String getSexs() {
		return sexs;
	}
	public void setSexs(String sexs) {
		this.sexs = sexs;
	}
	private String birthday;//  #出生日期
	private String duty;//  #职务
	private String workDate;// #入职时间
	private String highSchool;//  #最高学历
	private String finishSchool;//   #毕业学校
	private Date finishSchoolDate;//  #毕业时间
	private String remark;// #备注
	
	private String creator;// #创建人
	private String createTime;//#创建时间
	private String updater;// #修改人
	private String updateTime;//#修改时间
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
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
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
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
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	

}
