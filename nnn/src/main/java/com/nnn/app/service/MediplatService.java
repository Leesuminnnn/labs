package com.nnn.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.MediplatDao;
import com.nnn.app.vo.Mediplat;
import com.nnn.app.vo.MediplatMenu;

@Service
public class MediplatService {

	private MediplatDao medi;
	
	@Autowired
	public MediplatService (MediplatDao medi) {
		this.medi = medi;
	}

	public List<Mediplat> mediTitleSelect() {
		return medi.mediTitleSelect();
	}

	public List<MediplatMenu> mediMenuSelect() {
		return medi.mediMenuSelect();
	}
	
}
