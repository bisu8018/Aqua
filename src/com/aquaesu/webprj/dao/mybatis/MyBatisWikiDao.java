package com.aquaesu.webprj.dao.mybatis;


import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aquaesu.webprj.dao.WikiDao;
import com.aquaesu.webprj.vo.Wiki;

public class MyBatisWikiDao implements WikiDao {
	@Autowired
	   SqlSession sqlSession;
	
	@Override
	public List<Wiki> getWiki(int page, String field, String query) throws SQLException {
		
		WikiDao dao=sqlSession.getMapper(WikiDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Wiki> list= dao.getWiki(page,field,query);
	      System.out.println(list.get(1).getWsubject()+"mybatis");
		return list;
	}

	@Override
	public int update(Wiki wiki) throws SQLException {
		
		WikiDao dao=sqlSession.getMapper(WikiDao.class);
	      int aft = dao.update(wiki);
	      return aft;
	}

	

	@Override
	public int insert(Wiki wiki) {
		WikiDao dao=sqlSession.getMapper(WikiDao.class);
	      int aft = dao.insert(wiki);
	      return aft;
	}

}