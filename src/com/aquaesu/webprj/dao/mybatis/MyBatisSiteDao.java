package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.aquaesu.webprj.dao.SiteDao;
import com.aquaesu.webprj.vo.Site;

public class MyBatisSiteDao implements SiteDao{
	SqlSessionFactory ssf=SqlAquaSessionFactory.getSqlSessionFactory();

	
	@Override
	public List<Site> getSite(int page, String field, String query) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      SiteDao dao=session.getMapper(SiteDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Site> list= dao.getSite(page,field,query);
		return list;
	}

	@Override
	public int update(Site site) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		SiteDao dao=session.getMapper(SiteDao.class);
	      int aft = dao.update(site);
	      session.commit();
	      session.close();
	      return aft;
	}

	@Override
	public int delete(Site site) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		SiteDao dao=session.getMapper(SiteDao.class);
	      int aft = dao.delete(site);
	      session.commit();
	      session.close();
	      return aft;
	}

	@Override
	public int insert(Site site) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		SiteDao dao=session.getMapper(SiteDao.class);
	      int aft = dao.insert(site);
	      session.commit();
	      session.close();
	      return aft;
	}


	

}
