package com.aquaesu.webprj.dao.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlAquaSessionFactory {
	
	static SqlSessionFactory ssf;
	
//아무데서나 쉽게 호출가능하게 하기 위해 static 사용
	//공장을 한번만 만들면 계속 사용가능 하기에 굳이 이 클래스를 만들어 준것이다.
	static{
		String resource = "com/aquaesu/webprj/dao/mybatis/MybatisConfig.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ssf = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public static SqlSessionFactory getSqlSessionFactory(){
		return ssf;
	}
}
