package com.aquaesu.webprj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("fake")
public class LoginController {

	@RequestMapping(value="logindetail",method=RequestMethod.GET)
	public String logindetail(){
		System.out.println("ȸ������ �ض�");
		return "joinus/logindetail";
		}


	
	@RequestMapping("password")
	public String password(){
		return "joinus/password";
	}
	
}
