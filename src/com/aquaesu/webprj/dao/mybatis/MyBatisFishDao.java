package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.aquaesu.webprj.dao.FishDao;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Bowl;
import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Members;

public class MyBatisFishDao implements FishDao{
	SqlSessionFactory ssf=SqlAquaSessionFactory.getSqlSessionFactory();
	@Override
	public List<Fish> getFish() throws SQLException {
		// TODO Auto-generated method stub
		return getFish(1, "Name", "");
	}

	@Override
	public List<Fish> getFish(int page) throws SQLException {
		// TODO Auto-generated method stub
		return getFish(page, "Name", "");
	}

	@Override
	public List<Fish> getFish(int page, String field, String query) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		FishDao dao=session.getMapper(FishDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Fish> list= dao.getFish(page,field,query);
		return list;
	}

	@Override
	public int update(Fish fish) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		FishDao dao=session.getMapper(FishDao.class);
	      int aft = dao.update(fish);
	      session.close();
	      return aft;
	}

	@Override
	public int delete(Fish fish) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		FishDao dao=session.getMapper(FishDao.class);
	      int aft = dao.delete(fish);
	      session.close();
	      return aft;
	}

	@Override
	public int insert(Fish fish) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		FishDao dao=session.getMapper(FishDao.class);
	      int aft = dao.insert(fish);
	      session.close();
	      return aft;
	}

	@Override
	public Fish getFish(String name) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		FishDao dao=session.getMapper(FishDao.class); //세션을 통해 MemberDao의 정보를 전해줌
		Fish fish = dao.getFish(name);
		return fish;
	}
	
}