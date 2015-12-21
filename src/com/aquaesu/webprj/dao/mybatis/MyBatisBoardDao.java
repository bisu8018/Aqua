package com.aquaesu.webprj.dao.mybatis;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aquaesu.webprj.dao.BoardDao;
import com.aquaesu.webprj.dao.MembersDao;
import com.aquaesu.webprj.vo.Board;
import com.aquaesu.webprj.vo.Members;

public class MyBatisBoardDao implements BoardDao {
	SqlSessionFactory ssf = SqlAquaSessionFactory.getSqlSessionFactory();

	@Override
	public List<Board> getBoard() throws SQLException {
		// TODO Auto-generated method stub
		return getBoard(1, "Bpic", "");
	}

	@Override
	public List<Board> getBoard(int page) throws SQLException {
		// TODO Auto-generated method stub
		return getBoard(page, "Bpic", "");
	}

	@Override
	public List<Board> getBoard(int page, String field, String query) throws SQLException {
		SqlSession session = ssf.openSession(); // ���忡�� ��� ������ ������ ���� ����
		BoardDao dao = session.getMapper(BoardDao.class); // ������ ���� MemberDao��
															// ������ ������
		List<Board> list = dao.getBoard(page, field, query);
		return list;
	}

	@Override
	public int update(Board board) throws SQLException {
		SqlSession session = ssf.openSession(); // ���忡�� ��� ������ ������ ���� ����
		BoardDao dao = session.getMapper(BoardDao.class);
		int aft = dao.update(board);
		session.commit();
		session.close();
		return aft;
	}

	@Override
	public int delete(Board board) {
		SqlSession session = ssf.openSession(); // ���忡�� ��� ������ ������ ���� ����
		BoardDao dao = session.getMapper(BoardDao.class);
		int aft = dao.delete(board);
		session.commit();
		session.close();
		return aft;
	}

	@Override
	public int insert(Board board) {
		SqlSession session = ssf.openSession(); // ���忡�� ��� ������ ������ ���� ����
		BoardDao dao = session.getMapper(BoardDao.class);
		int aft = dao.insert(board);
		session.commit();
		session.close();
		return aft;
	}

	

	@Override
	public Board getBoard(String bpic) throws SQLException {
		SqlSession session = ssf.openSession();
		BoardDao dao = session.getMapper(BoardDao.class);
		Board board = dao.getBoard(bpic);
		return board;
	}

}
