package cn.jwdsy.crm.web.form;

import java.io.Serializable;

public class CourseForm implements Serializable{
	
	private static final long serialVersionUID = 7125750435069749095L;
	/**
	 * 课程类别
		Java，.Net,PHP,网页平面设计
		课程表系列
		地点-时间，价格，招生对象，培训教材，招生人数, 报名人数，状态(预约报名，火爆开班)
	 */
	
	private String courseId;//ID
	private String className;//课程名称
	private String price;//课程价格
	private String target;//招生对象
	private String textbook;//培训教材
	private String amount;//招生数量
	private String curNumber;//报名人数
	private String status;//班级状态
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getTextbook() {
		return textbook;
	}
	public void setTextbook(String textbook) {
		this.textbook = textbook;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getCurNumber() {
		return curNumber;
	}
	public void setCurNumber(String curNumber) {
		this.curNumber = curNumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
