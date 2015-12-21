package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aquaesu.webprj.dao.BowlDao;
import com.aquaesu.webprj.vo.Bowl;

public class MyBatisBowlDao implements BowlDao{
	SqlSessionFactory ssf=SqlAquaSessionFactory.getSqlSessionFactory();

	@Override
	public List<Bowl> getBowl() throws SQLException {
		// TODO Auto-generated method stub
		return getBowl(1,"Type","");
	}

	@Override
	public List<Bowl> getBowl(int page) throws SQLException {
		// TODO Auto-generated method stub
		return getBowl(page,"Type","");
	}

	@Override
	public List<Bowl> getBowl(int page, String field, String query) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      BowlDao dao=session.getMapper(BowlDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Bowl> list= dao.getBowl(page,field,query);
		return list;
	}

	@Override
	public int update(Bowl bowl) throws SQLException {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		BowlDao dao=session.getMapper(BowlDao.class);
	      int aft = dao.update(bowl);
	      session.commit();
	      session.close();
	      return aft;
	}

	@Override
	public int delete(Bowl bowl) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		BowlDao dao=session.getMapper(BowlDao.class);
	      int aft = dao.delete(bowl);
	      session.commit();
	      session.close();
	      return aft;
	}

	@Override
	public int insert(Bowl bowl) {
		SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
		BowlDao dao=session.getMapper(BowlDao.class);
	      int aft = dao.insert(bowl);
	      session.commit();
	      session.close();
	      return aft;
	}

}
