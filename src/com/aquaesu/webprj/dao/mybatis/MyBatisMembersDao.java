package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Members;

public class MyBatisMembersDao implements MembersDao{
	@Autowired
	   SqlSession sqlSession;
	
	
	@Override
	public List<Members> getMembers(int page, String field, String query) throws SQLException {
	      MembersDao dao=sqlSession.getMapper(MembersDao.class); 
	      List<Members> list= dao.getMembers(page,field,query);
		return list;
	}

	@Override
	public int update(Members members) throws SQLException {		
	      MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int aft = dao.update(members);
	      return aft;
	}

	@Override
	public int delete(Members members) {
	      MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int aft = dao.delete(members);
	      return aft;
	}

	@Override
	public int insert(Members members) {
	      MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int af = 0;
	      try{
	      af=dao.insert(members);
	      }catch(Exception e){
	         System.out.println("ERROR");
	      }
	      return af;
	}

	@Override
	public Members getMembers(String email) throws SQLException {
	      MembersDao dao=sqlSession.getMapper(MembersDao.class); 
	      Members members = dao.getMembers(email);
		return members;
	}

	@Override
	public int getMembersCount(String field, String query) {
		MembersDao dao=sqlSession.getMapper(MembersDao.class);
	      int aft = dao.getMembersCount(field,query);
	      return aft;
	}
	
}
