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
import com.aquaesu.webprj.dao.WikiDao;
import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Members;
import com.aquaesu.webprj.vo.Site;
import com.aquaesu.webprj.vo.Wiki;
import com.google.gson.Gson;

@Controller
@RequestMapping("fake")
public class MenuController {

	@Autowired
	private FishDao fishDao;

	@Autowired
	private SiteDao siteDao;
	
	@Autowired
	private WikiDao wikiDao;

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
		

		List<Fish> bList = fishDao.getFishs(1, "name", "");

		model.addAttribute("list", bList);
		return "bowl/bowl";
	}

	@RequestMapping(value = "bowl2", method = RequestMethod.GET)
	public void simulate(PrintWriter out, Model model, String lev, String type) throws SQLException {

		int level = 1;

		if (lev != null && !lev.equals(""))
			level = Integer.parseInt(lev);
		StringBuilder builder = new StringBuilder();
		
			
		builder.append("[");
				

		List<Fish> fList = fishDao.simulate(level, "열대어");
		builder.append("[");
		for (int i = 0; i < fList.size(); i++) {
			Fish f = fList.get(i);

			if (i == fList.size() - 1)
				builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'}", f.getName(),
						f.getLev(), f.getType(), f.getFpic()));
			else
				builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'},", f.getName(),
						f.getLev(), f.getType(), f.getFpic()));
		}
		builder.append("],");

		
		List<Fish> fList2 = fishDao.simulate(level, "해수어");
		builder.append("[");
		for (int i = 0; i < fList2.size(); i++) {
			Fish f = fList2.get(i);

			if (i == fList2.size() - 1)
				builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'}", f.getName(),
						f.getLev(), f.getType(), f.getFpic()));
			else
				builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'},", f.getName(),
						f.getLev(), f.getType(), f.getFpic()));
		}

		builder.append("],");
		
		
		
		List<Fish> fList3 = fishDao.simulate(level, "냉수어");
		builder.append("[");
		for (int i = 0; i < fList3.size(); i++) {
			Fish f = fList3.get(i);

			if (i == fList3.size() - 1)
				builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'}", f.getName(),
						f.getLev(), f.getType(), f.getFpic()));
			else
				builder.append(String.format("{'name':'%s' , 'lev':'%d' , 'type':'%s' , 'fpic':'%s'},", f.getName(),
						f.getLev(), f.getType(), f.getFpic()));
		}

		builder.append("]");
		
		
		
		
		
		builder.append("]");
		
		out.println(builder.toString());

		
		
	}

	@RequestMapping("board")
	public String board() {
		return "board/board";
	}

	@RequestMapping(value = "site", method = RequestMethod.GET)
	public String site(Model model, String p, String f, String q) throws SQLException {
		
		int page = 1;
		String field = "ssubject";
		String query = "";
		
		if (p != null && !p.equals(""))
			page = Integer.parseInt(p);
		
		if(f !=null && !f.equals(""))
			field = f;
		
		if(q !=null && !q.equals(""))
			query = q;
		
		List<Site> sList = siteDao.getSite(page, field, query);

		model.addAttribute("list", sList);

		return "site/site";
	}

	@RequestMapping("wiki")
	public String wiki() {
		return "wiki/wiki";
	}
	
	@RequestMapping(value = "wikiJSON", method = RequestMethod.GET)
	public void wiki(String p, PrintWriter out) throws SQLException {
		 int page = 1;

	      if (p != null && !p.equals(""))

	         page = Integer.parseInt(p);

	 

	      List<Wiki> list = wikiDao.getWiki(1, "wsubject", "");
	      Gson gson = new Gson();
	      out.println(gson.toJson(list));
	}

}