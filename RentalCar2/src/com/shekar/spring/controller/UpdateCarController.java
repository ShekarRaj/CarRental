package com.shekar.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.shekar.spring.dao.CarDaoImpl;
import com.shekar.spring.models.Car;
import com.shekar.spring.service.CarService;

@Controller
@SessionAttributes({ "mysession" })
public class UpdateCarController {
	@Autowired
	public CarService carService;
	
	@RequestMapping("updatecar")
	public ModelAndView updateCars(Car car, @RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		carService.updateCar(car);
		mv.setViewName("redirect:allcars");
		return mv;
	}

}
