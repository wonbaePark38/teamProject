package dnjswhdzld.spring.plug.projectdir.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dnjswhdzld.spring.plug.projectdir.ProjectdirVO;
import dnjswhdzld.spring.plug.projectdir.impl.ProjectdirDAO;
import dnjswhdzld.spring.plug.projectdir.service.ProjectdirService;
@Service
public class ProjectdirServiceImpl implements ProjectdirService {
	@Autowired
	private ProjectdirDAO projectdirDAO;
	
	@Override
	public void insertProjectdirInsert(ProjectdirVO vo) {
		projectdirDAO.insertProjectDir(vo);
	}

	@Override
	public List<ProjectdirVO> getProjectdirList(ProjectdirVO vo) {
		return null;
	}

}
