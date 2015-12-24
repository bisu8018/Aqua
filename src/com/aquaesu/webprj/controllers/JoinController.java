package com.aquaesu.webprj.controllers;


import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aquaesu.webprj.dao.BoardDao;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Members;

@Controller
@RequestMapping("fake")
public class JoinController {
	@Autowired
	private MembersDao MembersDao;
	
	@Autowired
	private BoardDao BoardDao;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		System.out.println("����");
		return "joinus/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Members member){
		System.out.println("�α��� �Ϸ�");
		MembersDao.insert(member);
		//BoardDao.insert(member.getEmail());
		return "joinus/login";
	}


}
