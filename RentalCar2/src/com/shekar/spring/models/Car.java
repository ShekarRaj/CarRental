package com.shekar.spring.models;

import java.io.Serializable;

public class Car implements Serializable{
	private int id;
	private String name;
	private String maker;
	private String model;
	private String category;
	private int rentPerDay;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRentPerDay() {
		return rentPerDay;
	}

	public void setRentPerDay(int rentPerDay) {
		this.rentPerDay = rentPerDay;
	}

}
