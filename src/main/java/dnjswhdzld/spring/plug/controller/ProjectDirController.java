package dnjswhdzld.spring.plug.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectDirController {

	@RequestMapping(value = "mainPage.jsp", method = RequestMethod.GET)
	public ModelAndView project() {
		System.out.println("project");
		
		return null;
	}
	
}