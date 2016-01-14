package com.aquaesu.webprj.controllers;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.Normalizer.Form;
import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aquaesu.webprj.dao.BoardDao;
import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.dao.SiteDao;
import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Members;
import com.aquaesu.webprj.vo.Site;

import jdk.internal.org.objectweb.asm.tree.analysis.Value;

//POJO class
@Controller
@RequestMapping("fake")
public class ManagerController {
	@Autowired
	private MembersDao membersDao;
	@Autowired
	private SiteDao siteDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private FishDao fishDao;

	@RequestMapping(value = "membersmanager", method = RequestMethod.GET)
	public String members(Model model, String p, String f, String q) throws SQLException {

		int page = 1;
		String field = "EMAIL";
		String query = "";
		
		if (p != null && !p.equals(""))
			page = Integer.parseInt(p);
		
		if(f !=null && !f.equals(""))
			field = f;
		
		if(q !=null && !q.equals(""))
			query = q;

		List<Members> mList = membersDao.getMembers(page, field, query);
		int recordCount = membersDao.getMembersCount(field, query);
		
		model.addAttribute("recordCount", recordCount);
		model.addAttribute("list", mList);
		return "manager/membersmanager";
	}
	
	@RequestMapping(value="membersmanager",method=RequestMethod.POST)
	   public String site(PrintWriter out, Model model,@RequestParam("code")String code, String p, String f, String q) throws SQLException {

		int page = 1;
		String field = "EMAIL";
		String query = "";
		
		if (p != null && !p.equals(""))
			page = Integer.parseInt(p);
		
		if(f !=null && !f.equals(""))
			field = f;
		
		if(q !=null && !q.equals(""))
			query = q;
	      List<Members> mList = membersDao.getMembers(page, field, query);
	      membersDao.delete(mList.get(Integer.parseInt(code)));
	      return "manager/membersmanager";
	   }

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String membersEdit(Members members) throws SQLException {

		membersDao.update(members);

		return "redirect:membersmanager";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String membersInsert(Members members) throws SQLException {

		membersDao.insert(members);

		return "redirect:membersmanager";
	}

	@RequestMapping("membersPartial")
	public String membersPartial(Model model, String p, String f, String q) throws SQLException {
		int page =1;
		String field = "EMAIL";
		String query = "";
		
		if (p != null && !p.equals(""))
			page = Integer.parseInt(p);
		
		if(f !=null && !f.equals(""))
			field = f;
		
		if(q !=null && !q.equals(""))
			query = q;
		
		List<Members> mList = membersDao.getMembers(page, field, query);
		model.addAttribute("list", mList);
		return "/manager/membersPartial";
	}

	@RequestMapping("sitemanager")
	public String site(PrintWriter out, Model model) throws SQLException {
		/*
		 * List<Site> sList = siteDao.getSite(1, "Ssubject", "");
		 * model.addAttribute("list", sList);
		 */
		return "manager/sitemanager";
	}

	@RequestMapping("boardmanager")
	public String board(PrintWriter out, Model model) throws SQLException {
		/*
		 * List<Site> sList = siteDao.getSite(1, "Ssubject", "");
		 * model.addAttribute("list", sList);
		 */
		return "manager/boardmanager";
	}

	
	@RequestMapping(value = "fishmanager", method = RequestMethod.GET)
	public String fish(Model model, String p, String f, String q) throws SQLException {

		int page = 1;
		String field = "NAME";
		String query = "";
		
		if (p != null && !p.equals(""))
			page = Integer.parseInt(p);
		
		if(f !=null && !f.equals(""))
			field = f;
		
		if(q !=null && !q.equals(""))
			query = q;
		

		List<Fish> fList = fishDao.getFish(page, field, query);
		int recordCount = fishDao.getFishCount(field, query);
		
		model.addAttribute("recordCount", recordCount);
		model.addAttribute("list", fList);
		return "manager/fishmanager";
	}

	@RequestMapping(value = "edit2", method = RequestMethod.POST)
	public String fishEdit(Fish fish) throws SQLException {

		fishDao.update(fish);

		return "redirect:fishmanager";
	}
	
	@RequestMapping(value = "insert2", method = RequestMethod.POST)
	public String fishInsert(Fish fish) throws SQLException {

		fishDao.insert(fish);

		return "redirect:fishmanager";
	}
	
}
