package com.nnn.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nnn.app.vo.CustomerVo;
import com.nnn.app.vo.MemberVo;

@Repository
public class MemberDao {

	//1 : hwtools, 2 : counselman
	@Resource(name="sqlSession2")
	private SqlSession sqlSession2;
	@Resource(name="sqlSession1")
	private SqlSession sqlSession1;

	public static final String MAPPER = "member";

//	@Autowired
//	public MemberDao(SqlSession sqlSession1) {
//		this.sqlSession = sqlSession1;
//	}

	// 회원 정보
	public MemberVo detail(int midx) {
		return sqlSession1.selectOne(MAPPER+".detail", midx);
	}
	// 회원정보 수정
	public void detailAction(MemberVo memberVo) {
		sqlSession1.update(MAPPER+".detailAction", memberVo);
	}
	public MemberVo detail2(String m_name) {
		return sqlSession1.selectOne(MAPPER+".detail2", m_name);
	}
	// 로그인 예시
	public MemberVo login(MemberVo memberVo) {
		return sqlSession1.selectOne(MAPPER+".login", memberVo);
	}
	// 시연용
	public CustomerVo login2(CustomerVo vo) {
		return sqlSession1.selectOne(MAPPER+".login2", vo);
	}

	public List<MemberVo> Memberlist(MemberVo memberVo) {
		return sqlSession1.selectList(MAPPER+".mlist", memberVo);
	}
	// 시연용
	public List<CustomerVo> Memberlist2(CustomerVo vo) {
		return sqlSession1.selectList(MAPPER+".mlist2", vo);
	}
	public void approve(Integer midx) {
		sqlSession1.update(MAPPER+".approve", midx);
	}

	public void getKakaoInfo(MemberVo vo) {
		sqlSession1.insert(MAPPER+".KakaoInfo",vo);
		
	}
	public MemberVo getMemberByEmail(String email) {
		return sqlSession1.selectOne(MAPPER+".getMemberByEmail", email);
		
	}

	public void updatePoint(Map<String, Object> map) {
		sqlSession1.update(MAPPER+".updatePoint", map);		
	}
	public int memberSelect(Integer midx) {
		return sqlSession1.selectOne(MAPPER+".selectmember", midx);
	}

	
	
	
	// 시연용
	public void getKakaoInfo2(CustomerVo vo) {
		sqlSession1.insert(MAPPER+".KakaoInfo2",vo);
	}
	public CustomerVo getMemberByEmail2(String email) {
		return sqlSession1.selectOne(MAPPER+".getMemberByEmail2", email);
		
	}
	// 회원 정보
	public CustomerVo detail3(String m_name) {
		return sqlSession1.selectOne(MAPPER+".detail3", m_name);
	}
	public CustomerVo detail4(int midx) {
		return sqlSession1.selectOne(MAPPER+".detail4", midx);
	
	}
	// 회원정보 수정
	public void detailAction2(CustomerVo vo) {
		sqlSession1.update(MAPPER+".detailAction2", vo);
	}
	
	

	

}
