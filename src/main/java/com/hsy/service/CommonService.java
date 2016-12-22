package com.hsy.service;

import java.util.HashMap;
import java.util.List;

public interface CommonService {

	List<HashMap<String, Object>> listTableData(String dbname, String tablename) throws Exception;

}
