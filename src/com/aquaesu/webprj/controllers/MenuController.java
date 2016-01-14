package com.aquaesu.webprj.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.vo.Fish;



@Controller
@RequestMapping("fake")
public class MenuController {
   
   @Autowired
   private FishDao fishDao;
   
   @RequestMapping("Menu")
   public String home()
   {
      return "menu/Menu";
   }   
   
   @RequestMapping("menuPartial")   
      public String menuPartial() {
         
         return "/menu/menuPartial";
      }
   

   @RequestMapping(value="bowl", method = RequestMethod.GET)
   public String bowl(Model model) throws SQLException
   {
      /*int page = 1;
      String field = "NAME";
      String query = "";*/
      

      List<Fish> bList = fishDao.getFish(1, "name", "");
      
      model.addAttribute("list", bList);   
      
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