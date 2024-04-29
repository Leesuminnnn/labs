package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.CanvasDao;
import com.nnn.app.vo.Criteria;
import com.nnn.app.vo.PDFRequest;
import com.nnn.app.vo.WrittenVo;

@Service
public class CanvasService {

	private CanvasDao canvasDao;

	@Autowired
	public CanvasService(CanvasDao canvasDao) throws Exception {
		this.canvasDao = canvasDao;
	}

	public List<WrittenVo> list(Criteria cri) throws Exception {
		return canvasDao.list(cri);
	}
//	public List<WrittenVo> list(WrittenVo writtenVo) throws Exception {
//		return canvasDao.list(writtenVo);
//	}
	public List<WrittenVo> listsearch(Criteria cri) throws Exception {
		return canvasDao.listsearch(cri);
	}
	
	public List<WrittenVo> listsearch2(Criteria cri) throws Exception{
		return canvasDao.listsearch2(cri);
	}
	
	public WrittenVo selectone(int cs_idx)  throws Exception{
		return canvasDao.selectone(cs_idx);
	}
	
	public int insert(WrittenVo vo) throws Exception {
		int result = 0;	//글쓰기 실패
		
		result = canvasDao.insert(vo);
		
		return result;
	}


	public List<Map<String, Object>> list2(Criteria cri) throws Exception{
		return canvasDao.list2(cri);
	}
	
	public int Cnt(Criteria cri) {
		return canvasDao.Cnt(cri);
	}
	
	public void update(PDFRequest vo) {
		canvasDao.update(vo);
	}

	public void modify(PDFRequest vo) {
		canvasDao.modify(vo);
	}

	public void modify1(WrittenVo vo) {
		canvasDao.modify1(vo);
		
	}

	public void update1(WrittenVo vo) {
		canvasDao.update1(vo);
		
	}
}
