package com.aquaesu.webprj.controllers;

import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.dao.SiteDao;
import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Members;
import com.aquaesu.webprj.vo.Site;

@Controller
@RequestMapping("fake")
public class MenuController {

	@Autowired
	private FishDao fishDao;

	@Autowired
	private SiteDao siteDao;

	@RequestMapping("Menu")
	public String home() {
		return "menu/Menu";
	}

	@RequestMapping("menuPartial")
	public String menuPartial() {

		return "/menu/menuPartial";
	}

	@RequestMapping(value = "bowl", method = RequestMethod.GET)
	public String bowl(Model model) throws SQLException {
		/*
		 * int page = 1; String field = "NAME"; String query = "";
		 */

		List<Fish> bList = fishDao.getFishs(1, "name", "");

		model.addAttribute("list", bList);
		return "bowl/bowl";
	}

	@RequestMapping(value = "bowl2", method = RequestMethod.GET)
	public void simulate(PrintWriter out, Model model, String lev) throws SQLException {
		
		int level = 1;
		
		if (lev != null && !lev.equals(""))
			level = Integer.parseInt(lev);
		
		
		
		
		List<Fish> fList = fishDao.simulate(level);
		StringBuilder builder = new StringBuilder();
		builder.append("[");
		int size = fList.size();
		for (int i = 0; i < fList.size(); i++) {
			Fish f = fList.get(i);
			builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'}", f.getName(),
					f.getLev(), f.getType(), f.getFpic()));
		}
		
		builder.append("]");

		out.println(builder.toString());
		
	}

	@RequestMapping("board")
	public String board() {
		return "board/board";
	}

	@RequestMapping(value = "site", method = RequestMethod.GET)
	public String site(Model model) throws SQLException {
		List<Site> sList = siteDao.getSite(1, "Ssubject", "");

		model.addAttribute("list", sList);

		return "site/site";
	}

	@RequestMapping("wiki")
	public String wiki() {
		return "wiki/wiki";
	}

}