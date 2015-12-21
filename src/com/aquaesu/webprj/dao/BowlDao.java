package com.aquaesu.webprj.dao;

import java.sql.SQLException;
import java.util.List;

import com.aquaesu.webprj.vo.Bowl;

public interface BowlDao {
	public List<Bowl> getBowl() throws SQLException;
	public List<Bowl> getBowl(int page) throws SQLException;
	public List<Bowl> getBowl(int page, String field, String query) throws SQLException;
	public int update(Bowl bowl) throws SQLException;
	public int delete(Bowl bowl);
	public int insert(Bowl bowl);

}
