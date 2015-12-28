package com.aquaesu.webprj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fake")
public class MenuController {

	@RequestMapping("Menu")
	public String home()
	{
		
		return "menu/Menu";
	}	

	@RequestMapping("bowl")
	public String bowl()
	{
		return "bowl/bowl";
	}
	@RequestMapping("board")
	public String board()
	{
		return "board/board";
	}
	@RequestMapping("site")
	public String site()
	{
		return "site/site";
	}
	
	@RequestMapping("wiki")
	public String wiki()
	{
		return "wiki/wiki";
	}

	
}
