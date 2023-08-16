package com.nnn.app.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.CalendarVo;

@Repository
public class CalenDao {

	@Resource(name = "sqlSession1")
	private SqlSession sqlSession;


	//1 : hwtools, 2 : counselman
//	@Resource(name="sqlSession2")
//	private SqlSession sqlSession2;
//	@Resource(name="sqlSession1")
//	private SqlSession sqlSession1;
//	
	
	
	public static final String MAPPER = "calen";
		
	
	public List<CalendarVo> calenList(){
		return sqlSession.selectList(MAPPER+".calenList");
	}


	public int caleninput(Map<String, Object> map) {
		return sqlSession.insert(MAPPER+".input", map);
	}


	public int calenselect(Map<String, Object> map) {
		return sqlSession.selectOne(MAPPER+".calenselect", map);
	}
}
