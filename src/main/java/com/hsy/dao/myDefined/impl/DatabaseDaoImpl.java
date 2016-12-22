package com.hsy.dao.myDefined.impl;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.hsy.dao.myDefined.DatabaseDao;


@Repository
public class DatabaseDaoImpl implements DatabaseDao{

	
	@Autowired
	private SqlSessionTemplate  sqlSession;
	
	@Override
	public List<String> listSatabases() throws Exception {
		DatabaseMetaData metaData = sqlSession.getConfiguration().getEnvironment().getDataSource().getConnection().getMetaData();
		
		ResultSet catalogs = metaData.getCatalogs();
		ArrayList<String> list = new ArrayList<String>();
		
		while(catalogs.next()){
				String databaseName = catalogs.getString("TABLE_CAT");
				list.add(databaseName);
		}
		return list;
		
	}

	@Override
	public List<String> listTables(String dbname,String tableType) throws Exception {
		DatabaseMetaData metaData = sqlSession.getConfiguration().getEnvironment().getDataSource().getConnection().getMetaData();
		ArrayList<String> list = new ArrayList<String>();
		ResultSet tables = metaData.getTables(dbname, null, null, new String[]{tableType});
		while(tables.next()){
			  String tableName = tables.getString("TABLE_NAME");
			  list.add(tableName);
		}
		return list;
	}

	@Override
	public List<String> listColumnNames(String dbname, String tablename) throws Exception {
		DatabaseMetaData metaData = sqlSession.getConfiguration().getEnvironment().getDataSource().getConnection().getMetaData();
		ResultSet rs = metaData.getColumns(dbname, null, tablename, null);
		ArrayList<String> list = new ArrayList<String>();
		
		
		while(rs.next()){
			String name = rs.getString("COLUMN_NAME");
			list.add(name);
		}
		return list;
	}

	@Override
	public List<HashMap<String, Object>> listTableData(String dbname, String tablename,List<String>  columnNames) throws Exception {
		Connection conn = sqlSession.getConfiguration().getEnvironment().getDataSource().getConnection();
		String querySql="select * from "+dbname+"."+tablename+"  limit 0,20";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(querySql);
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		while(rs.next()){
			  HashMap<String, Object> map = new HashMap<String,Object>();
			  for (String colName : columnNames) {
				   map.put(colName, rs.getObject(colName));
			  }
			  list.add(map);
		}
		return list;
	}

	@Override
	public List<HashMap<String, String>> getIndexesInfo(String dbname, String tablename) throws Exception {
		return null;
	}

	@Override
	public String getTableDDLInfo(String dbname, String tablename) throws Exception {
		return null;
	}
}
