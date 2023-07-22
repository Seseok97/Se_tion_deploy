package com.setion;

import java.sql.Date;

public class CoffeeDTO {
	private Date date;
	private String bean_country;
	private String bean_info;
	private String bean_process;
	private String bean_process_detail;
	private String grind_method;
	private String grind_click;
	private String brew_method;
	private String brew_info;
	private String tasting_result;
	private String tasting_info;
	private int id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getBean_country() {
		return bean_country;
	}
	public void setBean_country(String bean_country) {
		this.bean_country = bean_country;
	}
	public String getBean_info() {
		return bean_info;
	}
	public void setBean_info(String bean_info) {
		this.bean_info = bean_info;
	}
	public String getBean_process() {
		return bean_process;
	}
	public void setBean_process(String bean_process) {
		this.bean_process = bean_process;
	}
	public String getBean_process_detail() {
		return bean_process_detail;
	}
	public void setBean_process_detail(String bean_process_detail) {
		this.bean_process_detail = bean_process_detail;
	}
	public String getGrind_method() {
		return grind_method;
	}
	public void setGrind_method(String grind_method) {
		this.grind_method = grind_method;
	}
	public String getGrind_click() {
		return grind_click;
	}
	public void setGrind_click(String grind_click) {
		this.grind_click = grind_click;
	}
	public String getBrew_method() {
		return brew_method;
	}
	public void setBrew_method(String brew_method) {
		this.brew_method = brew_method;
	}
	public String getBrew_info() {
		return brew_info;
	}
	public void setBrew_info(String brew_info) {
		this.brew_info = brew_info;
	}
	public String getTasting_result() {
		return tasting_result;
	}
	public void setTasting_result(String tasting_result) {
		this.tasting_result = tasting_result;
	}
	public String getTasting_info() {
		return tasting_info;
	}
	public void setTasting_info(String tasting_info) {
		this.tasting_info = tasting_info;
	}
	
	
	@Override
	public String toString() {
		return "CoffeeDTO [date=" + date + ", bean_country=" + bean_country + ", bean_info=" + bean_info
				+ ", bean_process=" + bean_process + ", bean_process_detail=" + bean_process_detail + ", grind_method="
				+ grind_method + ", grind_click=" + grind_click + ", brew_method=" + brew_method + ", brew_info="
				+ brew_info + ", tasting_result=" + tasting_result + ", tasting_info=" + tasting_info + ", id=" + id
				+ "]";
	}


}// public class end
