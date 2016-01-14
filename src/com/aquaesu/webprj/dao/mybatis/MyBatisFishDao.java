package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Bowl;
import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Members;

public class MyBatisFishDao implements FishDao{
	@Autowired
	   SqlSession sqlSession;
	
	
	@Override
	public List<Fish> getFish(int page, String field, String query) throws SQLException {
		
		FishDao dao=sqlSession.getMapper(FishDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Fish> list= dao.getFish(page,field,query);
		return list;
	}

	@Override
	public int update(Fish fish) throws SQLException {		
		FishDao dao=sqlSession.getMapper(FishDao.class);
	      int aft = dao.update(fish);
	      return aft;
	}

	@Override
	public int delete(Fish fish) {
		FishDao dao=sqlSession.getMapper(FishDao.class);
	      int aft = dao.delete(fish);
	      return aft;
	}

	@Override
	public int insert(Fish fish) {
		FishDao dao=sqlSession.getMapper(FishDao.class);
	      int aft = dao.insert(fish);
	      return aft;
	}

	@Override
	public Fish getFish(String name) throws SQLException {
		FishDao dao=sqlSession.getMapper(FishDao.class); 
		Fish fish = dao.getFish(name);
		return fish;
	}

	@Override
	public int getFishCount(String field, String query) {
		FishDao dao=sqlSession.getMapper(FishDao.class);
	      int aft = dao.getFishCount(field,query);
	      return aft;
	}
	@Override
	   public List<Fish> getFishs(int page, String field, String query) throws SQLException {
	      FishDao dao=sqlSession.getMapper(FishDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	         List<Fish> list= dao.getFishs(page,field,query);
	      return list;
	   }
	
}