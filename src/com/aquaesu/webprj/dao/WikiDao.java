package com.aquaesu.webprj.dao;

import java.sql.SQLException;
import java.util.List;

import com.aquaesu.webprj.vo.Wiki;

public interface WikiDao {
	public List<Wiki> getWiki() throws SQLException;
	public List<Wiki> getWiki(int page) throws SQLException;
	public List<Wiki> getWiki(int page, String field, String query) throws SQLException;
	public int update(Wiki wiki) throws SQLException;
	public int delete(Wiki wiki);
	public int insert(Wiki wiki);
	
}
