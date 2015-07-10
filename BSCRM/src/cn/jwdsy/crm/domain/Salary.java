package cn.jwdsy.crm.domain;

import java.io.Serializable;
import java.util.Date;

public class Salary implements Serializable{
	
	private static final long serialVersionUID = -3039980115334730633L;
	
	private Integer salaryId;
	private SysUser user;//员工-
	private String userName;//员工姓名
	private String groupName;//部门名称-
	private Date payday;//发放日期-
	private Float roomSurcharge;//房补
	private Float mealAllowance;//餐补
	private Float grossPay;//工资-
	private Float providentFund;//公积金
	private Float insurance;//保险金
	private Float overtimeCharges;//加班费-
	private Float attendance;//考勤合计-
	private Float taxes;//缴税
	private Float summation;//实发工资-
	private String remark;//备注
	public Integer getSalaryId() {
		return salaryId;
	}
	public void setSalaryId(Integer salaryId) {
		this.salaryId = salaryId;
	}
	public SysUser getUser() {
		return user;
	}
	public void setUser(SysUser user) {
		this.user = user;
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
	public Date getPayday() {
		return payday;
	}
	public void setPayday(Date payday) {
		this.payday = payday;
	}
	public Float getRoomSurcharge() {
		return roomSurcharge;
	}
	public void setRoomSurcharge(Float roomSurcharge) {
		this.roomSurcharge = roomSurcharge;
	}
	public Float getMealAllowance() {
		return mealAllowance;
	}
	public void setMealAllowance(Float mealAllowance) {
		this.mealAllowance = mealAllowance;
	}
	public Float getGrossPay() {
		return grossPay;
	}
	public void setGrossPay(Float grossPay) {
		this.grossPay = grossPay;
	}
	public Float getProvidentFund() {
		return providentFund;
	}
	public void setProvidentFund(Float providentFund) {
		this.providentFund = providentFund;
	}
	public Float getInsurance() {
		return insurance;
	}
	public void setInsurance(Float insurance) {
		this.insurance = insurance;
	}
	public Float getOvertimeCharges() {
		return overtimeCharges;
	}
	public void setOvertimeCharges(Float overtimeCharges) {
		this.overtimeCharges = overtimeCharges;
	}
	public Float getAttendance() {
		return attendance;
	}
	public void setAttendance(Float attendance) {
		this.attendance = attendance;
	}
	public Float getTaxes() {
		return taxes;
	}
	public void setTaxes(Float taxes) {
		this.taxes = taxes;
	}
	public Float getSummation() {
		return summation;
	}
	public void setSummation(Float summation) {
		this.summation = summation;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	
}
