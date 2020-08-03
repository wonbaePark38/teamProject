package dnjswhdzld.spring.plug.client.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dnjswhdzld.spring.plug.client.UserVO;

@Repository
public class UserDAOmb {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertUser(UserVO vo) {
		System.out.println("insert 시작");
		sqlSessionTemplate.insert("UserDAO.insertUser", vo);
		System.out.println("insert 끝");
	}

	public UserVO getUser(UserVO vo) {
		return (UserVO) sqlSessionTemplate.selectList("UserDAO.getUser", vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("리스트");
		return sqlSessionTemplate.selectList("UserDAO.getUserList", vo);
	}
}
