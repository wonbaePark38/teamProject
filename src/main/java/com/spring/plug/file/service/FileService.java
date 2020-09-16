package com.spring.plug.file.service;

import java.util.List;

import com.spring.plug.file.vo.FileVO;

public interface FileService {
	List<FileVO> getProjectList(int loginUser);
	FileVO getFilePath(int articleId);
	FileVO getRealPath(int articleId);
}
