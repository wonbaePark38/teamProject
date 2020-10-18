<<<<<<< HEAD
package com.spring.plug.admin.manager.service;

import java.util.List;

import com.spring.plug.admin.manager.vo.ManagerVO;

public interface ManagerService {
	ManagerVO getUser();
	ManagerVO getProject();
	ManagerVO getArticle();
	List<ManagerVO> getUserList(ManagerVO vo);
	List<ManagerVO> getTimeLog(ManagerVO vo);
	List<ManagerVO> getConnLog(ManagerVO vo);
	ManagerVO getArticleToday(ManagerVO vo);
	ManagerVO getProjectToday(ManagerVO vo);
	List<ManagerVO> getProjectRank();
	List<ManagerVO> getProjectDay(ManagerVO vo);
	List<ManagerVO> getArticleDay(ManagerVO vo);
	List<ManagerVO> getProjectYear(ManagerVO vo);
	List<ManagerVO> getArticleYear(ManagerVO vo);
	ManagerVO getShareWork();
}
=======
package com.spring.plug.admin.manager.service;

import java.util.List;

import com.spring.plug.admin.manager.vo.ManagerVO;

public interface ManagerService {
	ManagerVO getUser();
	ManagerVO getProject();
	ManagerVO getArticle();
	List<ManagerVO> getUserList(ManagerVO vo);
	List<ManagerVO> getTimeLog(ManagerVO vo);
	List<ManagerVO> getConnLog(ManagerVO vo);
	ManagerVO getArticleToday(ManagerVO vo);
	ManagerVO getProjectToday(ManagerVO vo);
	List<ManagerVO> getProjectRank();
	List<ManagerVO> getProjectDay(ManagerVO vo);
	List<ManagerVO> getArticleDay(ManagerVO vo);
	List<ManagerVO> getProjectYear(ManagerVO vo);
	List<ManagerVO> getArticleYear(ManagerVO vo);
	ManagerVO getShareWork();
}
>>>>>>> 2485aa6b5ca5b2210f0a2d564b19fea2b1ba724f
