package com.aquaesu.webprj.controllers;
/*package com.aquaesu.webprj.controllers;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Members;

@Controller
@RequestMapping("fake")
public class JoinController {
	@Autowired
	private MembersDao membersDao;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "joinus/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@Param("email") String email, String bpwd,Model model, HttpSession session) throws SQLException {
		
		
		Members m = membersDao.getMember(email);
		String error = null;
		
		if(m ==null)
			error = "�߸��� ���̵� Ȥ�� �н����带 �Է��ϼ̽��ϴ�.";
		else if(m.getBpwd().equals(bpwd))
			error="�߸��� ���̵� Ȥ�� �н����带 �Է��ϼ̽��ϴ�.";
		
		if(error != null)
		{
			model.addAttribute("error",error);
			return "joinus/login";
		}
		
		session.setAttribute("email", error);
		return "redirect:manager/members";
	}
}
*/