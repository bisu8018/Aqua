package com.aquaesu.webprj.dao;

import java.sql.SQLException;
import java.util.List;

import com.aquaesu.webprj.vo.Board;
import com.aquaesu.webprj.vo.Bowl;
import com.aquaesu.webprj.vo.Fish;

public interface FishDao {
	public Fish getFish(String name) throws SQLException;	
	public List<Fish> getFish(int page, String field, String query) throws SQLException;
	public int update(Fish fish) throws SQLException;
	public int delete(Fish fish);
	public int insert(Fish fish);
	public int getFishCount(String field, String query);	
	public List<Fish> getFishs(int page, String field, String query) throws SQLException;
}
