package com.shekar.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
		
		@RequestMapping("home")
		public String getHomePage() {
			System.out.println("in Home controller");
			return "home";
		}

	}
