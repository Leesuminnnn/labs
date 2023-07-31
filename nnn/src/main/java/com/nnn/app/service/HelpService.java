package com.nnn.app.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.HelpDao;
import com.nnn.app.vo.HelpVo;

@Service
public class HelpService {

	private HelpDao helpDao;
	
	@Autowired
	public HelpService(HelpDao helpDao) {
		this.helpDao = helpDao;
	}
	
	//리스트 보기
	public List<HelpVo> list(Map<String, Object> map){
		return helpDao.list(map);
	}
	public List<HelpVo> search(Map<String, Object> map){
		return helpDao.search(map);
	}
	public int weekCount(Map<String, Object> map) {
	    return helpDao.weekCount(map);
	}

	public int monthCount(Map<String, Object> map) {
	    return helpDao.monthCount(map);
	}

	public int yearCount(Map<String, Object> map) {
	    return helpDao.yearCount(map);
	}

	public Date lastDate(Map<String, Object> map) {
	    return helpDao.lastDate(map);
	}
	// 글쓰기 전 유효성 검사
	public int selectHelp(Map<String, Object> map) {
		int result = 0;	//글쓰기 실패
		
		result = helpDao.selectHelp(map);
		
		return result;
	}
	public int selectHelp2(Map<String, Object> map) {
		int result = 0;	//글쓰기 실패
		
		result = helpDao.selectHelp2(map);
		
		return result;
	}
	public int selectend(Map<String, Object> map) {
		int result = 0;
		
		result = helpDao.selectend(map);
		
		return result;
	}
	//글쓰기
	public int addHelp(Map<String, Object> map) {
		int result = 0;	//글쓰기 실패
		
		result = helpDao.addHelp(map);
		System.out.println("result : "+result);
		return result;
	}
	public void endHelp(Map<String, Object> map) {
		helpDao.endHelp(map);
		}
	// 최근 2개의 리스트
	public List<HelpVo> recentlist(Map<String, Object> map){
		return helpDao.recentlist(map);
	}

	public List<HelpVo> startlist(Map<String, Object> map){
		return helpDao.startlist(map);
	}
	
	public List<HelpVo> endlist(Map<String, Object> map){
		return helpDao.endlist(map);
	}
	
	public List<HelpVo> listInsert(Map<String, Object> map) {
		return helpDao.listInsert(map);
	}

	public int selectend2(Map<String, Object> map) {
		int result = 0;	//글쓰기 실패
		
		result = helpDao.selectend2(map);
		return result;
	}

	// 
	public int listselect(Map<String, Object> map) {
		int result = 0;
		result = helpDao.listselect(map);
		return result;
	}
	
	public List<HelpVo> listAll(HelpVo helpVo){
		return helpDao.listAll(helpVo);
	}
	
}
