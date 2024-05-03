package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UsersVo;

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

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".noticeselect", map);
//		return sqlSession3.selectList(MAPPER+".noticeselect", map);
//		return sqlSession4.selectList(MAPPER+".noticeselect", map);
	}

	public UsersVo info2(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".info2", vo);
		return sqlSession3.selectOne(MAPPER+".info2", vo);
//		return sqlSession4.selectOne(MAPPER+".info2", vo);
	}

	public int login(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".login", vo);
		return sqlSession3.selectOne(MAPPER+".login", vo);
//		return sqlSession4.selectOne(MAPPER+".login", vo);
	}

	public int dbcheck(UsersVo vo) {
//		return sqlSession1.selectOne(MAPPER+".dbcheck", vo);
		return sqlSession3.selectOne(MAPPER+".dbcheck", vo);
//		return sqlSession4.selectOne(MAPPER+".dbcheck", vo);
	}

	public UsersVo info(int idx) {
//		return sqlSession1.selectOne(MAPPER+".info", idx);
		return sqlSession3.selectOne(MAPPER+".info", idx);
//		return sqlSession4.selectOne(MAPPER+".info", idx);
	}

	public int loginlog(Map<String, Object> map) {
//		return sqlSession1.insert(MAPPER+".loginlog", map);
		return sqlSession3.insert(MAPPER+".loginlog", map);
//		return sqlSession4.insert(MAPPER+".loginlog", map);
	}
	public List<Mediplat> mediTitleSelect() {
		return sqlSession1.selectList(MAPPER+".mediTitleSelect");
	}

	public List<MediplatMenu> mediMenuSelect() {
		return sqlSession1.selectList(MAPPER+".mediMenuSelect");
	}
	
	
}
