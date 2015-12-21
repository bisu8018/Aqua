package com.aquaesu.webprj.dao.mybatis;


import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aquaesu.webprj.dao.WikiDao;
import com.aquaesu.webprj.vo.Wiki;

public class MyBatisWikiDao implements WikiDao {
	SqlSessionFactory ssf=SqlAquaSessionFactory.getSqlSessionFactory();
	@Override
	public List<Wiki> getWiki() throws SQLException {
		// TODO Auto-generated method stub
		return getWiki(1, "DATE1", "");
	}

	@Override
	public List<Wiki> getWiki(int page) throws SQLException {
		// TODO Auto-generated method stub
		return getWiki(page, "DATE1", "");
	}

	@Override
	public List<Wiki> getWiki(int page, String field, String query) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		WikiDao dao=session.getMapper(WikiDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Wiki> list= dao.getWiki(page,field,query);
		return list;
	}

	@Override
	public int update(Wiki wiki) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		WikiDao dao=session.getMapper(WikiDao.class);
	      int aft = dao.update(wiki);
	      session.close();
	      return aft;
		
	}

	@Override
	public int delete(Wiki wiki) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		WikiDao dao=session.getMapper(WikiDao.class);
	      int aft = dao.delete(wiki);
	      session.close();
	      return aft;
	}

	@Override
	public int insert(Wiki wiki) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		WikiDao dao=session.getMapper(WikiDao.class);
	      int aft = dao.insert(wiki);
	      session.close();
	      return aft;
	}

}