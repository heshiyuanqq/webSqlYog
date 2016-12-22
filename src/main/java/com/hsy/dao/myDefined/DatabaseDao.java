package com.hsy.dao.myDefined;

import java.util.HashMap;
import java.util.List;


public interface DatabaseDao {

	
	public List<String> listSatabases() throws Exception;

	public List<String> listTables(String dbname,String tableType) throws Exception;

	public List<String> listColumnNames(String dbname, String tablename) throws Exception;

	public List<HashMap<String, Object>> listTableData(String dbname, String tablename,List<String>  columnNames) throws Exception;


	public List<HashMap<String, String>> getIndexesInfo(String dbname, String tablename) throws Exception;

	public String getTableDDLInfo(String dbname, String tablename) throws Exception;
}
