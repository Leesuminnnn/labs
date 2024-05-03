package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.BoardDao;
import com.nnn.app.vo.BoardVo;

@Service
public class BoardService {

	private BoardDao boardDao;

	@Autowired
	public BoardService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public List<BoardVo> boardlist(Map<String, Object> map) {
		return boardDao.boardlist(map);
	}
	
	public BoardVo View(BoardVo vo) {
		return boardDao.View(vo);
	}

	
}
