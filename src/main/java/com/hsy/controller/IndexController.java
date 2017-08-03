package com.hsy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.activemq.filter.function.regexMatchFunction;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsy.service.CommonService;
import com.hsy.service.DatabaseService;
import com.hsy.utils.CommonConstant;


/**hahahahahahahahah
 *111111111111111111111111111111111111111
 * 首先查询出所有的数据库，用dtree显示在页面左侧
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private DatabaseService databaseService;
	
	
	
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	//index.jsp页面中会发送ajax请求该方法列出所有数据库名称
	
	/**
	 * 由于我是做web  数据库客户端，所以最理想的是用树形菜单展示，需要Id,而我又不想建立额外的表，又想让id唯一，所以我只能自己拼接Id，所以是uuid避免重复
	 * 
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/listDatabases")
	@ResponseBody
	public List<HashMap<String,Object>> listDatabases(String id,ModelMap model){
		ArrayList<HashMap<String, Object>> subNodesToShow =null;
		//首先根据id判断是什么类型，如果是“数据库”，就列出表视图，存储过程函数触发器事件,如果是表就列出所有的表
		if(id==null){//列出所有数据库名称
				List<String> dbNames = null;
				try {
						dbNames = databaseService.listDatabases();
						subNodesToShow = new ArrayList<HashMap<String,Object>>();
						for (String name : dbNames) {
							  HashMap<String, Object> map = new HashMap<String,Object>();
							  map.put("id", "dbname"+CommonConstant.SEPARATOR+name+CommonConstant.SEPARATOR+UUID.randomUUID().toString());//类型表示_名称_UUID
							  map.put("text", name);
							  map.put("state", "closed");
							  subNodesToShow.add(map);
						}
				} catch (Exception e) {
						e.printStackTrace();
						subNodesToShow=null;
				}
		}else{
				 String[] split = id.split("\\"+CommonConstant.SEPARATOR);
				 String type=split[0];
				 if(type.equals("dbname")){//当前点击的是具体数据库名称，所以要列出表，视图，存储过程文字...
					    String dbname=split[1];
					 	subNodesToShow = new ArrayList<HashMap<String,Object>>();	
					 	
					 	//表
					 	HashMap<String, Object> map_biao = new HashMap<String,Object>();
					 	map_biao.put("id", "wenzi"+CommonConstant.SEPARATOR+"biao("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());//应该在()里面写上当前数据库的名称，否则以后点击该节点时就不知道该列出哪个数据库下面的tables了
					 	map_biao.put("text", "表");
					 	map_biao.put("state", "closed");
					 	subNodesToShow.add(map_biao);
					 	
					 	
					 	//视图
					 	HashMap<String, Object> map_shitu = new HashMap<String,Object>();
					 	map_shitu.put("id", "wenzi"+CommonConstant.SEPARATOR+"shitu("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());
					 	map_shitu.put("text", "视图");
					 	map_shitu.put("state", "closed");
					 	subNodesToShow.add(map_shitu);
					 	
					 	//存储过程
					 	HashMap<String, Object> map_procudure = new HashMap<String,Object>();
					 	map_procudure.put("id", "wenzi"+CommonConstant.SEPARATOR+"procedure("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());
					 	map_procudure.put("text", "存储过程");
					 	map_procudure.put("state", "closed");
					 	subNodesToShow.add(map_procudure);
					 	
					 	
					 	//函数
					 	HashMap<String, Object> map_funciton = new HashMap<String,Object>();
					 	map_funciton.put("id", "wenzi"+CommonConstant.SEPARATOR+"function("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());
					 	map_funciton.put("text", "函数");
					 	map_funciton.put("state", "closed");
					 	subNodesToShow.add(map_funciton);
					 	
					 	
					 	//触发器
					 	HashMap<String, Object> map_trigger = new HashMap<String,Object>();
					 	map_trigger.put("id", "wenzi"+CommonConstant.SEPARATOR+"trigger("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());
					 	map_trigger.put("text", "触发器");
					 	map_trigger.put("state", "closed");
					 	subNodesToShow.add(map_trigger);					 	
					 	
					 	//事件
					 	HashMap<String, Object> map_event = new HashMap<String,Object>();
					 	map_event.put("id", "wenzi"+CommonConstant.SEPARATOR+"event("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());
					 	map_event.put("text", "事件");
					 	map_event.put("state", "closed");
					 	subNodesToShow.add(map_event);
					 	
				 }else if(type.equals("wenzi")){//表示当前点击的是“表”，“视图”，“存储过程”，“触发器”，“函数”，"事件"
					 	subNodesToShow = new ArrayList<HashMap<String,Object>>();
					    if(split[1].startsWith("biao")){//表示当前点击的是“表”
					    		//列出当前(数据库:dbname)下面的所有表名称
						    	int i1 = split[1].indexOf('(');
						    	int i2 = split[1].indexOf(')');
						    	String dbname=split[1].substring(i1+1, i2);
						    	
						    	try {
										List<String>  tableNames=databaseService.listTables(dbname,"TABLE");
									    for (String tablename : tableNames) {
									    	  HashMap<String, Object> map = new HashMap<String,Object>();
									    	  map.put("id", "tablename"+CommonConstant.SEPARATOR+tablename+"("+dbname+")"+CommonConstant.SEPARATOR+UUID.randomUUID().toString());
									    	  map.put("text", tablename);
									    	  map.put("state", "closed");
									    	  subNodesToShow.add(map);
										}
								} catch (Exception e) {
										e.printStackTrace();
										subNodesToShow=null;
								}
					    }else if(split[1].startsWith("shitu")){//表示当前点击的是“视图”
					    	
					    }else if(split[1].startsWith("procudure")){//表示当前点击的是“存储过程”
					    	
					    }else if(split[1].startsWith("funciton")){//表示当前点击的是“函数”
					    	
					    }else if(split[1].startsWith("trigger")){//表示当前点击的是“触发器”
					    	
					    }else if(split[1].startsWith("event")){//表示当前点击的是“事件”
					    	
					    }  
				 }
		}
		
		return  subNodesToShow;
	}
	
	
	
	
	@RequestMapping("/openTableData")
	@ResponseBody
	public  HashMap<String, Object>  openTableData(String dbname,String tablename){//表示初次打开表，需要加载标题
			HashMap<String, Object> resultMap = null;
			try {
					resultMap = new HashMap<String,Object>();
					List<String> fieldNames=databaseService.listTableFieldNames(dbname,tablename);
					/**
					 * {"columns":[[{"field":"name","title":"名字"},
			        			    {"field":"age","title":"年龄"}
		        			      ]]}
					 */
					HashMap<String, Object> columnsMap = new HashMap<String,Object>();
					ArrayList<Object> list1 = new ArrayList<Object>();
					ArrayList<Object> list2 = new ArrayList<Object>();
					for (String fieldName : fieldNames) {
							HashMap<String, String>  map2= new HashMap<String,String>();
							map2.put("field", fieldName);
							map2.put("title", fieldName);
							list2.add(map2);
					}
					list1.add(list2);
					columnsMap.put("columns", list1);
					
					/**
					 * {
		        			"total":4,
		        			"rows":[
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
		        			       ]
		        		}
					 */
					HashMap<String, Object> loadDataMap = new HashMap<String,Object>();
					loadDataMap.put("total", 100);
					
					List<HashMap<String, Object>> rows=commonService.listTableData(dbname,tablename);//databaseService.listTableData(dbname,tablename,fieldNames);
					loadDataMap.put("rows", rows);
					
					
					resultMap.put("titles", columnsMap);
					resultMap.put("datas", loadDataMap);
			} catch (Exception e) {
					e.printStackTrace();
					resultMap=null;
			}
			return resultMap;
	}
	
	
	
	/**
	 * 表信息
	 * @return
	 */
	@RequestMapping("/openTableInfo")
	@ResponseBody
	public HashMap<String, Object>  openTableInfo(String dbname,String tablename){
			HashMap<String, Object>  tableInfo=null;
			try {
					tableInfo=databaseService.openTableInfo(dbname,tablename);
			} catch (Exception e) {
					e.printStackTrace();
					tableInfo=null;
			}
			
			return tableInfo;
	}
	
	
	public static void main(String[] args) {
			String separator="$";
			String name="aaa$bbb$ccc";
			String[] arr = name.split("\\"+separator);
			
			for (String string : arr) {
				System.out.println(string);
				
			}
	}
}
