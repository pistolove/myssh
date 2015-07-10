package cn.jwdsy.crm.domain;

import java.io.Serializable;

public class Course implements Serializable {
	
	private static final long serialVersionUID = -3185926293118165991L;
	
	private Integer courseId;//ID
	private String className;//课程名称
	private Integer price;//课程价格
	private String target;//招生对象
	private String textbook;//培训教材
	private Integer amount;//招生数量
	private Integer curNumber;//报名人数
	private String status;//班级状态
	
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
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
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getCurNumber() {
		return curNumber;
	}
	public void setCurNumber(Integer curNumber) {
		this.curNumber = curNumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}
