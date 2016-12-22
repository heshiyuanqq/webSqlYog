package com.hsy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsy.dao.myDefined.DatabaseDao;
import com.hsy.dao.mybatis.CommonMapper;
import com.hsy.service.DatabaseService;


@Service
public class DatabaseServiceImpl implements DatabaseService{
	
	
	
	@Autowired
	private CommonMapper commonMapper;
	
	
	@Autowired
	private  DatabaseDao databaseDao;
	
	
	@Override
	public List<String> listDatabases() throws Exception {
			return databaseDao.listSatabases();
	}


	@Override
	public List<String> listTables(String dbname,String tableType) throws Exception {
		return databaseDao.listTables(dbname,tableType);
	}


	@Override
	public List<String> listTableFieldNames(String dbname, String tablename) throws Exception{
		return databaseDao.listColumnNames(dbname,tablename);
	}


	@Override
	public List<HashMap<String, Object>> listTableData(String dbname, String tablename,List<String>  columnNames) throws Exception {
		return databaseDao.listTableData(dbname,tablename,columnNames);
	}


	@Override
	public HashMap<String, Object> openTableInfo(String dbname, String tablename) throws Exception {
				//字段信息
				/**
				 * 
					Field 					Type			Comment
					idbigint(20) 			NOT NULL			主键
					usernamevarchar(50) 	NULL		用户名(账号)
					passwordvarchar(100) 	NULL		密码
				 */
				
			    HashMap<String, Object> tableInfoMap = new HashMap<String,Object>();
				
				HashMap<String, Object> params = new HashMap<String,Object>();
				params.put("dbname", dbname); 
				params.put("tablename", tablename); 
				
				
				
				List<HashMap<String, String>> rows_columnsInfo=commonMapper.getColumnsInfo(params);
				
				ArrayList<HashMap<String, String>> columnsInfoList = new ArrayList<HashMap<String, String>>();
				
				
				for (HashMap<String, String> row_columnsInfo: rows_columnsInfo) {
						  HashMap<String, String> shortColumnsInfoMap = new HashMap<String,String>();
						  shortColumnsInfoMap.put("Field", row_columnsInfo.get("COLUMN_NAME"));
						  shortColumnsInfoMap.put("Type", row_columnsInfo.get("DATA_TYPE"));
						  shortColumnsInfoMap.put("Comment", row_columnsInfo.get("COLUMN_COMMENT"));
						  
						  columnsInfoList.add(shortColumnsInfoMap);
				}
				
				
				
				
				//索引信息
				
				ArrayList<HashMap<String, String>> shortIndexesInfoList = new ArrayList<HashMap<String, String>>();
				List<HashMap<String, Object>>  indexesInfoList=commonMapper.getIndexesInfo(params);
				for (HashMap<String, Object> indexesInfoMap : indexesInfoList) {
					    HashMap<String, String> shortIndexesInfoMap = new HashMap<String,String>();
					    shortIndexesInfoMap.put("Indexes", indexesInfoMap.get("Key_name")+"");
					    shortIndexesInfoMap.put("Columns", indexesInfoMap.get("Column_name")+"");
					    Long   non_unique = (Long) indexesInfoMap.get("Non_unique");
					    if(non_unique==0){
					    	shortIndexesInfoMap.put("Index_Type","Unique");
					    }else{
					    	shortIndexesInfoMap.put("Index_Type","");
					    }
					    shortIndexesInfoMap.put("Index_Type",indexesInfoMap.get("Non_unique")+"");
					    
					    shortIndexesInfoList.add(shortIndexesInfoMap);
				}
				
				//DDL信息
				HashMap<String, String>  createTableDDLInfo=commonMapper.getTableDDLInfo(params);//databaseDao.getTableDDLInfo(dbname,tablename);
				
				
				tableInfoMap.put("Columns", columnsInfoList);
				tableInfoMap.put("Indexes", shortIndexesInfoList);
				tableInfoMap.put("DDLInfo", createTableDDLInfo.get("Create Table"));
		
				return tableInfoMap;
	}

}
