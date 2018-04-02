package com.shekar.spring.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.shekar.spring.models.User;
import com.shekar.spring.service.CarService;

@Controller
public class CarBookingController {

	@Autowired
	public CarService carService;

	@RequestMapping(value = "bookCar", method = RequestMethod.GET)
	public String bookACar(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute("userSession") List<User> user, ModelMap modelMap) {

		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		int car_id = Integer.parseInt(request.getParameter("id"));
		String category = request.getParameter("category");
		String car_name = request.getParameter("car_name");
		String car_rent_per_day = request.getParameter("car_rent_per_day");

		modelMap.addAttribute("start_date", start_date);
		modelMap.addAttribute("end_date", end_date);
		modelMap.addAttribute("car_id", car_id);
		modelMap.addAttribute("category", category);
		modelMap.addAttribute("car_name", car_name);
		modelMap.addAttribute("car_rent_per_day", car_rent_per_day);
		modelMap.addAttribute("userSession", user);

		int user_id = 0;
		for (User us : user) {
			user_id = us.getUserId();
		}
		int result = carService.bookTheCar(start_date, end_date, category, car_id, user_id);
		System.out.println("result " + result);
		if (result > 0) {
			return "car_booked";
		} else {
			return "car_booking_failed";
		}
	}

}
