package com.hsy.service;

import java.util.HashMap;
import java.util.List;

public interface DatabaseService {
	
	public  List<String> listDatabases() throws Exception;

	public List<String> listTables(String dbname,String tableType) throws Exception;

	public List<String> listTableFieldNames(String dbname, String tablename) throws Exception;

	public List<HashMap<String, Object>> listTableData(String dbname, String tablename,List<String>  columnNames) throws Exception;

	public HashMap<String, Object> openTableInfo(String dbname, String tablename) throws Exception;
 
}
