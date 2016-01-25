package com.aquaesu.webprj.dao;

import java.sql.SQLException;
import java.util.List;

import com.aquaesu.webprj.vo.Fish;
import com.aquaesu.webprj.vo.Site;

public interface SiteDao {
	public List<Site> getSite(int page, String field, String query) throws SQLException;
	public int update(Site site) throws SQLException;
	public int delete(Site site);
	public int insert(Site site);
}
