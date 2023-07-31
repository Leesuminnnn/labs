package com.nnn.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.TestDao;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.TestVo;

@Service
public class TestService {

	private TestDao testDao;

	@Autowired
	public TestService(TestDao testDao) {
		this.testDao = testDao;
	}

	public List<TestVo> list(TestVo vo) {
		return testDao.list(vo);
	}
	
	public List<TestVo> listsearch(Criteria cri) {
		return testDao.listsearch(cri);
	}
	
	public int insert(TestVo vo) {
		int result = 0;	//글쓰기 실패
		
		result = testDao.insert(vo);
		
		return result;
	}
	
	public int Cnt(Criteria cri) {
		return testDao.Cnt(cri);
	}
}
