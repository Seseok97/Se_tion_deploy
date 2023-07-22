package com.setion;

import java.sql.Date;

public class dailyDTO {
	private int id;
	private String one;
	private String two;
	private String three;
	private String four;
	private String five;
	private Date date;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getOne() {
		return one;
	}
	public void setOne(String one) {
		this.one = one;
	}
	public String getTwo() {
		return two;
	}
	public void setTwo(String two) {
		this.two = two;
	}
	public String getThree() {
		return three;
	}
	public void setThree(String three) {
		this.three = three;
	}
	public String getFour() {
		return four;
	}
	public void setFour(String four) {
		this.four = four;
	}
	public String getFive() {
		return five;
	}
	public void setFive(String five) {
		this.five = five;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "dailyDTO [id=" + id + ", one=" + one + ", two=" + two + ", three=" + three + ", four=" + four
				+ ", five=" + five + ", date=" + date + "]";
	}
	
	
}// public class end
