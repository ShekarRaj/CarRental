package com.shekar.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shekar.spring.models.Car;
import com.shekar.spring.myvalidators.AddCarValidation;
import com.shekar.spring.service.CarService;

@Controller
@ComponentScan({ "myvalidators" })
public class AddCarController {
	/*@Autowired
	CarDaoImpl dao;*/
	
	@Autowired
	public CarService carService;

	@RequestMapping("addcar")
	public Car addCar() {
		//System.out.println("in addCar()");
		return new Car();
	}

	@Autowired
	private AddCarValidation val;

	@InitBinder
	public void addMyValidator(WebDataBinder wdb) {

		wdb.setValidator(val);
	}

	@RequestMapping("add")
	public String addCarToDB(@Validated Car car, BindingResult br, Model m) {
		
		if (br.hasErrors()) {
			return "addcar";
		}
		int i = carService.addCar(car);
		if (i > 0) {
			return "car_added";
		} else {
			return "redirect:addcar-error";
		}
	}

	@ExceptionHandler(Exception.class)
	@RequestMapping("addcar-error")
	public String addCarError() {
		return "addcar-err";
	}

}
