package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.TestDao;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.GoogleuserVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.WhetherVo;

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

	public int login(TestusersVo vo) throws Exception {
		return testDao.login(vo);
	}
	
	public TestusersVo info2(TestusersVo vo) throws Exception {
		return testDao.info2(vo);
	}

	public TestusersVo info(Integer idx) {
		return testDao.info(idx);
	}

	public int pwdinsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = testDao.pwdinsert(map);
		
		return flag;
	}

	public List<TestusersVo> evaluationtarget(Map<String, Object> map) {
		return testDao.evaluationtarget(map);
	}

	public List<TestusersVo> BTlist(Map<String, Object> map) {
		return testDao.BTlist(map);
	}

	public List<TestusersVo> BFlist(Map<String, Object> map) {
		return testDao.BFlist(map);
	}

	public List<EvaluationVo> evlist(Map<String, Object> map) {
		return testDao.evList(map);
	}

	public int frominsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = testDao.frominsert(map);
		
		return flag;
	}

	public int whether(Map<String, Object> map2) {
		int flag = 0;
		
		flag = testDao.whether(map2);
		
		return flag;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return testDao.noticeSelect(map);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = testDao.loginlog(map);
		return flag;
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
		return testDao.whetherSelect(map);
	}

	public int guserinsert(GoogleuserVo user) {
		int flag = 0;
		flag = testDao.guserinsert(user);		
		return flag;
	}
}
