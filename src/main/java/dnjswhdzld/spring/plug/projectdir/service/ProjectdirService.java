package dnjswhdzld.spring.plug.projectdir.service;

import java.util.List;

import dnjswhdzld.spring.plug.projectdir.ProjectdirVO;

public interface ProjectdirService {
	void insertProjectdirInsert(ProjectdirVO vo);
	List<ProjectdirVO> getProjectdirList(ProjectdirVO vo);
	
}
