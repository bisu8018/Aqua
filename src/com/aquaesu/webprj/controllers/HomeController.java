package com.aquaesu.webprj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fake")
public class HomeController {
	
	@RequestMapping("home")
	public String home()
	{
		
		return "home/Home";
	}


}
