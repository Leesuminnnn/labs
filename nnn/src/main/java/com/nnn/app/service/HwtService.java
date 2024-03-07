package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.HwtDao;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.NoticeVo;
import com.nnn.app.vo.UsersVo;
import com.nnn.app.vo.WrittenVo;

@Service
public class HwtService {

	private HwtDao hwtDao;

	@Autowired
	public HwtService(HwtDao hwtDao) throws Exception {
		this.hwtDao = hwtDao;
	}

	public List<NoticeVo> noticeSelect(Map<String, Object> map) {
		return hwtDao.noticeSelect(map);
	}

	public UsersVo info2(UsersVo vo) {
		return hwtDao.info2(vo);
	}

	public int login(UsersVo vo) {
		return hwtDao.login(vo);
	}

	public int dbcheck(UsersVo vo) {
		int flag = 0;
		flag = hwtDao.dbcheck(vo);
		return flag;
	}

	public UsersVo info(Integer idx) {
		return hwtDao.info(idx);
	}

	public int loginlog(Map<String, Object> map) {
		int flag = 0;
		flag = hwtDao.loginlog(map);
		return flag;
	}
	public List<WrittenVo> list(Criteria cri) throws Exception {
		return hwtDao.list(cri);
	}
//	public List<WrittenVo> list(WrittenVo writtenVo) throws Exception {
//		return canvasDao.list(writtenVo);
//	}
	public List<WrittenVo> listsearch(Criteria cri) throws Exception {
		return hwtDao.listsearch(cri);
	}
	
	public List<WrittenVo> listsearch2(Criteria cri) throws Exception{
		return hwtDao.listsearch2(cri);
	}
	
	public WrittenVo selectone(int cs_idx)  throws Exception{
		return hwtDao.selectone(cs_idx);
	}
	
	public int insert(WrittenVo vo) throws Exception {
		int result = 0;	//글쓰기 실패
		
		result = hwtDao.insert(vo);
		
		return result;
	}


	public List<Map<String, Object>> list2(Criteria cri) throws Exception{
		return hwtDao.list2(cri);
	}
	
	public int Cnt(Criteria cri) {
		return hwtDao.Cnt(cri);
	}
	
	public void update(WrittenVo vo) {
		hwtDao.update(vo);
	}

	public void modify(WrittenVo vo) {
		hwtDao.modify(vo);
	}
}
