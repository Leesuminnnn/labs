package com.nnn.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnn.app.dao.PropertyDao;

@Service
public class PropertyService {

	private PropertyDao propertyDao;
	
	@Autowired
	public PropertyService (PropertyDao propertyDao) {
		this.propertyDao = propertyDao;
	}
	
	
}
