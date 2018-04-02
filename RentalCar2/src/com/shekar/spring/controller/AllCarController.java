package com.shekar.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shekar.spring.dao.CarDaoImpl;
import com.shekar.spring.models.Car;
import com.shekar.spring.service.CarService;

@Controller
@SessionAttributes("ssn")
public class AllCarController {
	/*@Autowired
	CarDaoImpl dao;*/
	
	@Autowired
	public CarService carService;
	
	@Autowired
	Car car;

	@RequestMapping("allcars")
	public String showAllCars(Model m) {
		List<Car> list = carService.getAllCars();
		m.addAttribute("ssn", list);
		return "redirect:showallcars";
	}

	@RequestMapping("showallcars")
	public String showAll() {
		return "allcars";
	}
}
