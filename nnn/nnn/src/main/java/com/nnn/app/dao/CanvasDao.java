package com.nnn.app.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.PDFRequest;
import com.nnn.app.vo.WrittenVo;

@Repository
public class CanvasDao {

	//1 : csworktools.cafe24.com, 2 : counselman 3: 서버 이관(csworktools2) hwtools.kr 4: root (CentOS)
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;
	@Resource(name="sqlSession4")
	private SqlSession sqlSession4;
	
	public static final String MAPPER = "canvas";
	
//	public List<WrittenVo> list(WrittenVo writtenVo) {
//		return sqlSession1.selectList(MAPPER+".cslist", writtenVo);
//	}
	public List<WrittenVo> list(Criteria cri) {
//		return sqlSession1.selectList(MAPPER+".cslist", cri);
		return sqlSession4.selectList(MAPPER+".cslist", cri);
	}
	public List<WrittenVo> listsearch(Criteria cri) {
//		return sqlSession1.selectList(MAPPER+".cslistsearch", cri);
		return sqlSession4.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public List<WrittenVo> listsearch2(Criteria cri) {
//		return sqlSession1.selectList(MAPPER+".cslist", cri);
		return sqlSession4.selectList(MAPPER+".cslist", cri);
	}
	
//	public WrittenVo selectone(WrittenVo vo) {
//		return sqlSession1.selectOne(MAPPER+".selectone",vo);
//	}
	
	public WrittenVo selectone(int cs_idx) {
//		return sqlSession1.selectOne(MAPPER+".selectone",cs_idx);
		return sqlSession4.selectOne(MAPPER+".selectone",cs_idx);
	}
	
	public int insert(WrittenVo vo) {
//		return sqlSession1.insert(MAPPER+".insert", vo);
		return sqlSession4.insert(MAPPER+".insert", vo);
	}

	public List<Map<String, Object>> list2(Criteria cri) throws Exception{
//		return sqlSession1.selectList(MAPPER+".cslistsearch", cri);
		return sqlSession4.selectList(MAPPER+".cslistsearch", cri);
	}
	
	public int Cnt(Criteria cri) {
//		return sqlSession1.selectOne(MAPPER+".Cnt",cri);
		return sqlSession4.selectOne(MAPPER+".Cnt",cri);
	}
	
	public void update(PDFRequest vo) {
//		sqlSession1.update(MAPPER+".update",vo);
		sqlSession4.update(MAPPER+".update",vo);
	}

	public void modify(PDFRequest vo) {
//		sqlSession1.update(MAPPER+".modify",vo);	
		sqlSession4.update(MAPPER+".modify",vo);		
	}
}
