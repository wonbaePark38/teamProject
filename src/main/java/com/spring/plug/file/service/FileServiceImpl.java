package com.spring.plug.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.plug.file.dao.FileDAO;
import com.spring.plug.file.vo.FileVO;
@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileDAO fileDAO;

	@Override
	public List<FileVO> getProjectList(int loginUser) {
		return fileDAO.getProjectList(loginUser);
	}

	@Override
	public FileVO getFilePath(int articleId) {
		return fileDAO.getFilePath(articleId);
	}

	@Override
	public FileVO getRealPath(int articleId) {
		return fileDAO.getRealPath(articleId);
	}

}
