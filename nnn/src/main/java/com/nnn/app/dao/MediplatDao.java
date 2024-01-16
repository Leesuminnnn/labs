package com.nnn.app.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;

@Repository
public class MediplatDao {

	//1 : csworktools.cafe24.com, 2 : counselman 3: 서버 이관(csworktools2) hwtools.kr
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	@Resource(name="sqlSession3")
	private SqlSession sqlSession3;
	
	public static final String MAPPER = "medi";

	public List<Mediplat> mediTitleSelect() {
		return sqlSession1.selectList(MAPPER+".mediTitleSelect");
	}

	public List<MediplatMenu> mediMenuSelect() {
		return sqlSession1.selectList(MAPPER+".mediMenuSelect");
	}
	
	
}
