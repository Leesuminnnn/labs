package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.PracticeDao;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.EvaluationVo;
import com.nnn.app.vo.GoogleuserVo;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.SubVo;
import com.nnn.app.vo.TestVo;
import com.nnn.app.vo.TestusersVo;
import com.nnn.app.vo.UserVo;
import com.nnn.app.vo.UseroptionVo;
import com.nnn.app.vo.WhetherVo;

@Service
public class PracticeService {

	private PracticeDao practiceDao;

	@Autowired
	public PracticeService(PracticeDao practiceDao) {
		this.practiceDao = practiceDao;
	}

	public List<TestVo> list(TestVo vo) {
		return practiceDao.list(vo);
	}
	
	public List<TestVo> listsearch(Criteria cri) {
		return practiceDao.listsearch(cri);
	}
	
	public int insert(TestVo vo) {
		int result = 0;	//글쓰기 실패
		
		result = practiceDao.insert(vo);
		
		return result;
	}
	
	public int Cnt(Criteria cri) {
		return practiceDao.Cnt(cri);
	}

	public int login(TestusersVo vo) throws Exception {
		return practiceDao.login(vo);
	}
	
	public TestusersVo info2(TestusersVo vo) throws Exception {
		return practiceDao.info2(vo);
	}

	public TestusersVo info(Integer idx) {
		return practiceDao.info(idx);
	}

	public int pwdinsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = practiceDao.pwdinsert(map);
		
		return flag;
	}

	public List<TestusersVo> evaluationtarget(Map<String, Object> map) {
		return practiceDao.evaluationtarget(map);
	}

	public List<TestusersVo> BTlist(Map<String, Object> map) {
		return practiceDao.BTlist(map);
	}

	public List<TestusersVo> BFlist(Map<String, Object> map) {
		return practiceDao.BFlist(map);
	}

	public List<EvaluationVo> evlist(Map<String, Object> map) {
		return practiceDao.evList(map);
	}

	public int frominsert(Map<String, Object> map) {
		int flag = 0;
		
		flag = practiceDao.frominsert(map);
		
		return flag;
	}

	public int whether(Map<String, Object> map2) {
		int flag = 0;
		
		flag = practiceDao.whether(map2);
		
		return flag;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return practiceDao.noticeSelect(map);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = practiceDao.loginlog(map);
		return flag;
	}

	public List<WhetherVo> whetherSelect(Map<String, Object> map) {
		return practiceDao.whetherSelect(map);
	}

	public int guserinsert(GoogleuserVo user) {
		int flag = 0;
		flag = practiceDao.guserinsert(user);		
		return flag;
	}

	public List<SubVo> subop(Map<String, Object> map) {
		return practiceDao.subop(map);
	}

	public List<UserVo> userall(Map<String, Object> map) {
		return practiceDao.userall(map);
	}

	public List<UseroptionVo> userop(Map<String, Object> map) {
		return practiceDao.userop(map);
	}

}
