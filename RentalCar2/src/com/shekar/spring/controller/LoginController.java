package com.shekar.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shekar.spring.models.Login;
import com.shekar.spring.models.User;
import com.shekar.spring.service.UserService;

@Controller
@SessionAttributes("userSession")
public class LoginController {

	
	@Autowired
	public UserService userService;
	
	@RequestMapping(value="signin")
	public Login getLoginPage(){
		
		return new Login();
	}
	
	@RequestMapping(value="loginCheck", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest request, HttpServletResponse response, ModelMap m){
		Login login = new Login();
		login.setUsername(request.getParameter("username"));
		login.setPassword(request.getParameter("password"));
		
		List<User> user = userService.loginCheck(login);
		m.addAttribute("userSession",user);
		
		if(user.size() == 1){
			return "car_rent_main";
		}else{
			return "signin_err";
		}
		
	}
	
}
