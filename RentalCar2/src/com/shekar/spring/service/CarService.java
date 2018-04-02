package com.shekar.spring.service;

import java.util.List;

import com.shekar.spring.models.Car;

public interface CarService {
	public abstract int addCar(Car car);

	public abstract Car searchCar(String name);

	public abstract List<Car> getAllCars();

	public abstract void deleteCar(int id);

	public abstract int updateCar(Car car);
	
	public abstract List<Car> searchCarsForRent(String start_date, String end_date, String category);
	
	public abstract int bookTheCar(String start_date, String end_date, String category, int car_id, int user_id);
}
