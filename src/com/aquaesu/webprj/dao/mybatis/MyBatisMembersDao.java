package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Members;

public class MyBatisMembersDao implements MembersDao{
	//SqlSessionFactory ssf=SqlAquaSessionFactory.getSqlSessionFactory();
	@Autowired
	   SqlSession sqlSession;
	
	
	@Override
	public List<Members> getMembers() throws SQLException {
		// TODO Auto-generated method stub
		return getMembers(1,"EMAIL","");
	}

	@Override
	public List<Members> getMembers(int page) throws SQLException {
		// TODO Auto-generated method stub
		return getMembers(page,"EMAIL","");
	}

	@Override
	public List<Members> getMembers(int page, String field, String query) throws SQLException {
		
		//SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      MembersDao dao=sqlSession.getMapper(MembersDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      List<Members> list= dao.getMembers(page,field,query);
		return list;
	}

	@Override
	public int update(Members members) throws SQLException {		
		//SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int aft = dao.update(members);
	     // session.commit();
	     // session.close();
	      return aft;
	}

	@Override
	public int delete(Members members) {
		//SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int aft = dao.delete(members);
	      //session.commit();
	      //session.close();
	      return aft;
	}

	@Override
	public int insert(Members members) {
		//SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int af = 0;
	      try{
	      af=dao.insert(members);
	      }catch(Exception e){
	         System.out.println("ERROR");
	         //session.rollback();
	      }
	      //session.commit();
	     // session.close();
	      return af;
	}

	@Override
	public Members getMembers(String email) throws SQLException {
		// TODO Auto-generated method stub
		//SqlSession session=ssf.openSession(); //공장에서 얻어 가지고 오려고 세션 생성
	      MembersDao dao=sqlSession.getMapper(MembersDao.class); //세션을 통해 MemberDao의 정보를 전해줌
	      Members members = dao.getMembers(email);
		return members;
	}
	
}
