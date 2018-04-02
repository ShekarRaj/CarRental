package com.shekar.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shekar.spring.models.User;
import com.shekar.spring.service.CarService;
import com.shekar.spring.service.UserService;

@Controller
public class UserRegistrationController {
	@Autowired
	public CarService carService;

	@Autowired
	public UserService userService;

	@RequestMapping(value = "signup")
	public User addUser() {
		return new User();
	}

	@RequestMapping(value = "doRegister")
	public ModelAndView doRegister(HttpServletRequest request, HttpServletResponse response) {

		User user = new User();

		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setGender(request.getParameter("gender"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setAddress(request.getParameter("address"));
		user.setMobileNo(request.getParameter("mobileNo").trim());

		int result = userService.insertUser(user);
		if (result > 0) {
			return new ModelAndView("registration_success");
		} else {
			return new ModelAndView("userError");
		}
	}

}
