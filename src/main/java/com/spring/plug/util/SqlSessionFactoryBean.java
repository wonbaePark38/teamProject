package com.spring.plug.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/*
 * 마이바티스를 이용하여 dao를 구현하려면 sqlsession 객체가 필요함
 * sqlsession을 얻으려면 sqlsessionfactory가 필요함
 * 이 과정을 구현해논 클래스임
 *  */
public class SqlSessionFactoryBean {
	private static SqlSessionFactory sessionFactory = null;
	static {
		try {
			if(sessionFactory==null) {
				Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
				sessionFactory = new SqlSessionFactoryBuilder().build(reader); //sqlsessionfactory 객체 생성코드
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSession getSqlSessionInstance() {
		return sessionFactory.openSession(true);//opensession은 생성된 sqlsessionfactory 객체에서 sqlsession 객체를 얻어오는 코드 
	}
}
