package com.shekar.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shekar.spring.dao.CarDao;
import com.shekar.spring.models.Car;

public class CarServiceImpl implements CarService {

	@Autowired
	public CarDao cardao;
	@Override
	public int addCar(Car car) {
		// TODO Auto-generated method stub
		return cardao.addCar(car);
	}

	@Override
	public Car searchCar(String name) {
		// TODO Auto-generated method stub
		return cardao.searchCar(name);
	}

	@Override
	public List<Car> getAllCars() {
		// TODO Auto-generated method stub
		return cardao.getAllCars();
	}

	@Override
	public void deleteCar(int id) {
		// TODO Auto-generated method stub
		cardao.deleteCar(id);
	}

	@Override
	public int updateCar(Car car) {
		// TODO Auto-generated method stub
		return cardao.updateCar(car);
	}

	@Override
	public List<Car> searchCarsForRent(String start_date, String end_date, String category) {
		// TODO Auto-generated method stub
		return cardao.searchCarsForRent(start_date, end_date, category);
	}

	@Override
	public int bookTheCar(String start_date, String end_date, String category, int car_id, int user_id) {
		// TODO Auto-generated method stub
		return cardao.bookTheCar(start_date, end_date, category, car_id, user_id);
	}

}
