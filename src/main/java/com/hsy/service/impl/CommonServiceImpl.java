package com.hsy.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsy.dao.mybatis.CommonMapper;
import com.hsy.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService{

	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<HashMap<String, Object>> listTableData(String dbname, String tablename) throws Exception {
		HashMap<String, Object> params = new HashMap<String,Object>();
		params.put("dbname", dbname);
		params.put("tablename", tablename);
		return commonMapper.listTableData(params);
	}

}
