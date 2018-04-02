package com.shekar.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shekar.spring.models.Car;
import com.shekar.spring.models.User;
import com.shekar.spring.service.CarService;

@Controller
@SessionAttributes("ssn")
public class SearchCarController {

	@Autowired
	public CarService carService;

	@Autowired
	Car car;

	@RequestMapping("findcar")
	public Car searchCar() {
		return new Car();
	}

	@RequestMapping("search")
	public String searchCars(@RequestParam("name") String name, Model m) {
		car = carService.searchCar(name);
		if (car != null) {
			return "redirect:view";

		} else {
			return "redirect:find-error";
		}
	}

	@RequestMapping(value = "searchCars", method = RequestMethod.POST)
	public String searchCarsForRent(@RequestParam("start_date") String start_date,
			@RequestParam("end_date") String end_date, @RequestParam("category") String category,
			@SessionAttribute("userSession") List<User> user, ModelMap m) {

		if (category != null && category.equals("All")) {
			category = "";
		}

		List<Car> list = carService.searchCarsForRent(start_date, end_date, category);
		m.addAttribute("ssn", list);
		m.addAttribute("start_date", start_date);
		m.addAttribute("end_date", end_date);
		m.addAttribute("category", category);
		m.addAttribute("from", "search");

		return "allcars";

	}

	@RequestMapping("view")
	public String viewCar(Model m) {
		m.addAttribute("car", car);
		return "viewcar";
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping("find-error")
	public String viewError() {
		return "view-error";
	}
}
