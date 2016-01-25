package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.dao.SiteDao;
import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Site;

public class MyBatisSiteDao implements SiteDao{
	@Autowired
	   SqlSession sqlSession;
	
	@Override
	public List<Site> getSite(int page, String field, String query) throws SQLException {
		
	      SiteDao dao=sqlSession.getMapper(SiteDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Site> list= dao.getSite(page,field,query);
		return list;
	}

	@Override
	public int update(Site site) throws SQLException {
		
		SiteDao dao=sqlSession.getMapper(SiteDao.class);
	      int aft = dao.update(site);
	      return aft;
	}

	@Override
	public int delete(Site site) {
		
		SiteDao dao=sqlSession.getMapper(SiteDao.class);
	      int aft = dao.delete(site);
	      return aft;
	}

	@Override
	public int insert(Site site) {
		
		SiteDao dao=sqlSession.getMapper(SiteDao.class);
	      int aft = dao.insert(site);
	      return aft;
	}

	


	

}
