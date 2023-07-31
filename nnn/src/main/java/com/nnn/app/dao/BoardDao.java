package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.BoardVo;

@Repository
public class BoardDao {
	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	
	public static final String MAPPER = "board";

//	@Autowired
//	public BoardDao(SqlSession sqlSession1) {
//		this.sqlSession = sqlSession1;
//	}

	public List<BoardVo> boardlist(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".boardlist", map);
	}

	public BoardVo View(BoardVo vo) {
		return sqlSession1.selectOne(MAPPER+".View", vo);
	}

	

	

}
