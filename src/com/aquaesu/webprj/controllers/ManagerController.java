package com.aquaesu.webprj.controllers;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aquaesu.webprj.dao.BoardDao;
import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.dao.SiteDao;
import com.aquaesu.webprj.vo.Members;
import com.aquaesu.webprj.vo.Site;

//POJO class
@Controller
@RequestMapping("fake")
public class ManagerController {
	@Autowired
	private MembersDao membersDao;
	private SiteDao siteDao;
	private BoardDao boardDao;
	private FishDao fishDao;

	@RequestMapping("members")
	public String members(PrintWriter out, Model model) throws SQLException {
		List<Members> mList = membersDao.getMembers(1, "EMAIL", "");
		model.addAttribute("list", mList);
		return "manager/members";
	}

	@RequestMapping("site")
	public String site(PrintWriter out, Model model) throws SQLException {
		/*List<Site> sList = siteDao.getSite(1, "Ssubject", "");
		model.addAttribute("list", sList);*/
		return "manager/site";
	}
	
	@RequestMapping("board")
	public String board(PrintWriter out, Model model) throws SQLException {
		/*List<Site> sList = siteDao.getSite(1, "Ssubject", "");
		model.addAttribute("list", sList);*/
		return "manager/board";
	}
	
	@RequestMapping("fish")
	public String fish(PrintWriter out, Model model) throws SQLException {
		/*List<Site> sList = siteDao.getSite(1, "Ssubject", "");
		model.addAttribute("list", sList);*/
		return "manager/fish";
	}

}
