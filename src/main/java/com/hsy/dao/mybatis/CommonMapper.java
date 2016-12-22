package com.hsy.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import com.hsy.utils.IbatisMapper;

@IbatisMapper
public interface CommonMapper {

	List<HashMap<String, Object>> listTableData(HashMap<String, Object>  params) throws Exception;

	List<HashMap<String, String>> getColumnsInfo(HashMap<String, Object> params) throws Exception;

	List<HashMap<String, Object>> getIndexesInfo(HashMap<String, Object> params) throws Exception;

	HashMap<String, String> getTableDDLInfo(HashMap<String, Object> params) throws Exception;
	

}
