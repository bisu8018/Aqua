package com.aquaesu.webprj.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fake")
public class wikiController {
	//wikidetail
	@RequestMapping("wikidetail")
	public String wikidetail()
	{
		return "wiki/wikidetail";
	}

}
