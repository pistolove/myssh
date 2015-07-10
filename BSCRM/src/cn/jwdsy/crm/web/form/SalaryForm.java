package cn.jwdsy.crm.web.form;

import java.io.Serializable;

public class SalaryForm implements Serializable{
	
	private static final long serialVersionUID = -3039980115334730633L;
	
	private String salaryId;
	private String userId;//员工编号
	private String userName;//员工
	private String groupName;//部门名称
	private String grossPay;//工资+
	private String payday;//发放日期
	private String roomSurcharge;//房补-
	private String mealAllowance;//餐补+
	private String providentFund;//公积金-
	private String insurance;//保险金-
	private String overtimeCharges;//加班费+
	private String attendance;//考勤合计-
	private String taxes;//缴税-
	private String summation;//实发工资
	private String remark;//备注
	
	public String getSalaryId() {
		return salaryId;
	}
	public void setSalaryId(String salaryId) {
		this.salaryId = salaryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGrossPay() {
		return grossPay;
	}
	public void setGrossPay(String grossPay) {
		this.grossPay = grossPay;
	}
	public String getPayday() {
		return payday;
	}
	public void setPayday(String payday) {
		this.payday = payday;
	}
	public String getRoomSurcharge() {
		return roomSurcharge;
	}
	public void setRoomSurcharge(String roomSurcharge) {
		this.roomSurcharge = roomSurcharge;
	}
	public String getMealAllowance() {
		return mealAllowance;
	}
	public void setMealAllowance(String mealAllowance) {
		this.mealAllowance = mealAllowance;
	}
	public String getProvidentFund() {
		return providentFund;
	}
	public void setProvidentFund(String providentFund) {
		this.providentFund = providentFund;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getOvertimeCharges() {
		return overtimeCharges;
	}
	public void setOvertimeCharges(String overtimeCharges) {
		this.overtimeCharges = overtimeCharges;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public String getTaxes() {
		return taxes;
	}
	public void setTaxes(String taxes) {
		this.taxes = taxes;
	}
	public String getSummation() {
		return summation;
	}
	public void setSummation(String summation) {
		this.summation = summation;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
