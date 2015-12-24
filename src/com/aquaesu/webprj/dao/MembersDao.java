package com.aquaesu.webprj.dao;

import java.sql.SQLException;
import java.util.List;

import com.aquaesu.webprj.vo.Members;

public interface MembersDao {
	public Members getMembers(String email) throws SQLException;
	public List<Members> getMembers() throws SQLException;
	public List<Members> getMembers(int page) throws SQLException;
	public List<Members> getMembers(int page, String field, String query) throws SQLException;
	public int update(Members members) throws SQLException;
	public int delete(Members members);
	public int insert(Members members);
		
	

}


