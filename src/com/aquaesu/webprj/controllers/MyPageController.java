package com.aquaesu.webprj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fake")
public class MyPageController {
	
		@RequestMapping("mypage")
		public String home()
		{
			
			return "mypage/mypage";
		}	
		
}
