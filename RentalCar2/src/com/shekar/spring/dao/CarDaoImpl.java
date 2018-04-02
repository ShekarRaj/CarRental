package com.shekar.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.shekar.spring.mapper.CarMapper;
import com.shekar.spring.models.Car;

public class CarDaoImpl implements CarDao {
	@Autowired
	JdbcTemplate jt;

	@Override
	public int addCar(Car car) {
		String sql = "insert into car(name,model,maker,category,rent_per_day) values(?,?,?,?,?)";

		Object[] args = { car.getName(), car.getModel(), car.getMaker(), car.getCategory(), car.getRentPerDay() };
		return jt.update(sql, args);
	}

	@Override
	public Car searchCar(String name) {
		String sql = "select * from car where name=?";
		Object[] arg = { name };
		CarMapper map = new CarMapper();
		return jt.queryForObject(sql, arg, map);
	}

	@Override
	public List<Car> getAllCars() {
		String sql = "select * from car";
		CarMapper map = new CarMapper();

		return jt.query(sql, map);

	}

	@Override
	public void deleteCar(int id) {
		String sql = "delete  from car where id=?";
		Object[] args = { id };
		jt.update(sql, args);

	}

	@Override
	public int updateCar(Car car) {
		String sql = "update car set name=?,model=? and maker=? where id=?";
		Object[] args = { car.getName(), car.getModel(), car.getMaker(), car.getId() };

		return jt.update(sql, args);
	}

	@Override
	public List<Car> searchCarsForRent(String start_date, String end_date, String category) {
		// TODO Auto-generated method stub
		String sql = "";
		CarMapper map = new CarMapper();

		if (!category.equals("")) {
			sql = "select c.* from Car c where c.CATEGORY = ? and c.id not in "
					+ "(select car_id from car_rent_details where from_date = to_date(?,'dd-Month-yyyy')"
					+ "and to_date = to_date(?,'dd-Month-yyyy'))";
			Object[] arg = { category, start_date, end_date };
			return jt.query(sql, arg, map);
		} else {
			sql = "select c.* from Car c where c.id not in "
					+ "(select car_id from car_rent_details where from_date = to_date(?,'dd-Month-yyyy')"
					+ "and to_date = to_date(?,'dd-Month-yyyy'))";
			Object[] arg = { start_date, end_date };
			return jt.query(sql, arg, map);
		}


	}

	@Override
	public int bookTheCar(String start_date, String end_date, String category, int car_id, int user_id) {
		// TODO Auto-generated method stub
		String sql = "insert into car_rent_details (car_id,booked_by,from_date,to_date,booked_date) values("+car_id+","+user_id+",to_date('"+start_date+"','dd-Month-yyyy'),to_date('"+end_date+"','dd-Month-yyyy'),sysdate)";
		System.out.println("in bookTheCar method() of CarDaoImpl");
		return jt.update(sql);
	}

}
