package com.nnn.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.PointDao;
import com.nnn.app.vo.Pointdetail;
import com.nnn.app.vo.PointplusVo;

@Service
public class PointService {

	private PointDao pointDao;

	@Autowired
	public PointService(PointDao pointDao) {
		this.pointDao = pointDao;
	}

	
	public int pointdetail(Map<String, Object> map) {
		int result = 0;	//글쓰기 실패
		
		result = pointDao.pointdetail(map);
		System.out.println("result : "+result);
		return result;
	}

	public List<Pointdetail> pointlist(Map<String, Object> map) {
		return pointDao.pointlist(map);
	}
	
	public int pointresult (Map<String, Object> map) {
		int result = 0;
		
		result = pointDao.pointresult(map);
		return result;
	}

	
}
