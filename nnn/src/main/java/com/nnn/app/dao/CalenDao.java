package com.nnn.app.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.CalendarVo;

@Repository
public class CalenDao {

	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	
	public static final String MAPPER = "calen";
		
	
	public List<CalendarVo> calenList(CalendarVo calendarVo){
		return sqlSession1.selectList(MAPPER+".calenList", calendarVo);
	}
}
