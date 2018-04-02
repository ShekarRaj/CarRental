 package com.shekar.spring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

import com.shekar.spring.models.Car;

public class CarMapper implements RowMapper<Car> {

	@Override
	public Car mapRow(ResultSet rs, int arg1) throws SQLException {
		Car car = new Car();
		car.setId(rs.getInt("id"));
		car.setName(rs.getString("name"));
		car.setModel(rs.getString("model"));
		car.setMaker(rs.getString("maker"));
		car.setCategory(rs.getString("category"));
		car.setRentPerDay(rs.getInt("rent_per_day"));
		
		return car;
	}
	
	/*@Override
	public List mapRow(ResultSet rs, int arg1) throws SQLException {
		Car car = new Car();
		car.setId(rs.getInt("id"));
		car.setName(rs.getString("name"));
		car.setModel(rs.getString("model"));
		car.setMaker(rs.getString("maker"));
		car.setCategory(rs.getString("category"));
		car.setRentPerDay(rs.getInt("rent_per_day"));
		
		return car;
		
		List carList = new ArrayList();
		
		return carList;
	}*/

}
