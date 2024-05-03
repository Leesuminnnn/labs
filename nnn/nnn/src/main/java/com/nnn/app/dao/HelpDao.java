package com.nnn.app.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.HelpVo;

@Repository
public class HelpDao {
	
	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	
	public static final String MAPPER = "help";
	
//	@Autowired
//	public HelpDao(SqlSession sqlSession1) {
//		this.sqlSession = sqlSession1;
//	}
	
	public List<HelpVo> list(Map<String, Object> map){
		
		return sqlSession1.selectList(MAPPER+".list", map);
	}
	public List<HelpVo> search(Map<String, Object> map){
		
		return sqlSession1.selectList(MAPPER+".search", map);
	}
	public int weekCount(Map<String, Object> map) {
	    return sqlSession1.selectOne(MAPPER+".weekCount", map);
	}
//	public List<HelpVo> weekList(Map<String, Object> map) {
//	    return sqlSession.selectList(MAPPER+".week", map);
//	}
	public int monthCount(Map<String, Object> map) {
	    return sqlSession1.selectOne(MAPPER+".monthCount", map);
	}
//	public List<HelpVo> monthList(Map<String, Object> map) {
//	    return sqlSession.selectList(MAPPER+".month", map);
//	}
	public int yearCount(Map<String, Object> map) {
	    return sqlSession1.selectOne(MAPPER+".yearCount", map);
	}
//	public List<HelpVo> yearList(Map<String, Object> map) {
//	    return sqlSession.selectList(MAPPER+".year", map);
//	}
	public Date lastDate(Map<String, Object> map) {
	    return sqlSession1.selectOne(MAPPER+".lastDate", map);
	}
	
	// 글 쓰기 전 유효성 검사
	public int selectHelp(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".selectHelp", map);
	}
	public int selectHelp2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".selectHelp2", map);
	}
	
	public int selectend(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".selectend", map);
	}
	// 글쓰기
	public int addHelp(Map<String, Object> map) {
		return sqlSession1.insert(MAPPER+".addHelp", map);
	}
	public void endHelp(Map<String, Object> map) {
		sqlSession1.update(MAPPER+".endHelp", map);
	}
	public List<HelpVo> recentlist(Map<String, Object> map){
			
		return sqlSession1.selectList(MAPPER+".recentlist", map);
	}
	
	public List<HelpVo> startlist(Map<String, Object> map){
		
		return sqlSession1.selectList(MAPPER+".startlist", map);
	}
	
	public List<HelpVo> endlist(Map<String, Object> map){
		
		return sqlSession1.selectList(MAPPER+".endlist", map);
	}
	
	public static List<HelpVo> selectHelpList(String userId, String userName, Integer duration) {

		return null;
	}

	public List<HelpVo> listInsert(Map<String, Object> map) {
		return sqlSession1.selectList(MAPPER+".listInsert", map);
	}

	public int selectend2(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".selectend2", map);
	}
	public int listselect(Map<String, Object> map) {
		return sqlSession1.selectOne(MAPPER+".listselect", map);
	}
	public List<HelpVo> listAll(HelpVo helpVo) {
		return sqlSession1.selectList(MAPPER+".listAll", helpVo);
	}

	

}
