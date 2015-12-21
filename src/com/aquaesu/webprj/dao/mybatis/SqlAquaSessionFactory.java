package com.aquaesu.webprj.dao.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlAquaSessionFactory {
	
	static SqlSessionFactory ssf;
	
//�ƹ������� ���� ȣ�Ⱑ���ϰ� �ϱ� ���� static ���
	//������ �ѹ��� ����� ��� ��밡�� �ϱ⿡ ���� �� Ŭ������ ����� �ذ��̴�.
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
