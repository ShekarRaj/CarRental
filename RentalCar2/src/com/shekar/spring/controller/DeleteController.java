package com.shekar.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shekar.spring.dao.CarDaoImpl;
import com.shekar.spring.service.CarService;

@Controller
public class DeleteController {
	
	@Autowired
	public CarService carService;
	
    @RequestMapping("deleteuser")
	public String deleteUser(@RequestParam("id")int id)
{
    	carService.deleteCar(id);
    	return "redirect:allcars";
}
}
