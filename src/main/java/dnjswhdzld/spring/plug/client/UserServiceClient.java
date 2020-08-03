package dnjswhdzld.spring.plug.client;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class UserServiceClient {
	public static void main(String[] args) {
		
		AbstractApplicationContext container = new GenericXmlApplicationContext("applicationContext.xml");
		
		UserService userService = container.getBean("userService", UserService.class);
		
		
		System.out.println("start");
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
		userService.insertUser(vo);
		System.out.println(1);
		container.close();

	}
}
