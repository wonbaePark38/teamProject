package dnjswhdzld.spring.plug.client;

import java.util.List;

import dnjswhdzld.spring.plug.client.impl.UserDAO;

public class UserServiceClient {
	public static void main(String[] args) {
		try {
			
		System.out.println("start");
		UserDAO userDAO = new UserDAO();
		UserVO vo = new UserVO();
		System.out.println("DAO, VO 객체생성");
		vo.setOfficename("dnjswhdzld");
		vo.setUsername("장원종");
		vo.setGroupname("java");
		vo.setDepartment("tester");
		vo.setEmail("97dnjswhd@daum.net");
		vo.setPhone("010-2043-9968");
		vo.setDevice("com");
		vo.setUserstate("정상");
		vo.setUsermanager("관리자");
		userDAO.insertUser(vo);
		System.out.println(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
