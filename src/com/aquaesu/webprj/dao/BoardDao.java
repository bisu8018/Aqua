package com.aquaesu.webprj.dao;

import java.sql.SQLException;
import java.util.List;

import com.aquaesu.webprj.vo.Board;

public interface BoardDao {
	public Board getBoard(String bpic) throws SQLException;
	public List<Board> getBoard() throws SQLException;
	public List<Board> getBoard(int page) throws SQLException;
	public List<Board> getBoard(int page, String field, String query) throws SQLException;
	public int update(Board board) throws SQLException;
	public int delete(Board board);
	public int insert(Board board);

}
