<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link rel="StyleSheet" href="${pageContext.request.contextPath}/dtree/dtree.css" type="text/css" />
	<link rel="StyleSheet" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" type="text/css" />
	<link rel="StyleSheet" href="${pageContext.request.contextPath}/easyui/themes/icon.css" type="text/css" />
	
	
	
	<link  rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<link  rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-2.0.3.js"  charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/dtree/dtree.js"></script>

</head>
<body>
		<div class="easyui-layout" style="width:100%;height:600px;">
			<div region="west" split="true" title="localhost" style="width:200px;">
						<!-- 左侧属性菜单 -->
						<ul id="tt" class="easyui-tree"></ul>
			</div>
			<div class="easyui-layout"  region="center" title="询问" style="padding:5px;">
						<div region="north" split="true" title="查询区域"  style="height:200px;">
								select * from user;
						</div>
						<div region="center" title="列表区域"   style="height: auto;padding-top: 0px;padding-right: 0px;">
								<div class="easyui-tabs" style="width:100%;height:100%;">
										<div title="信息" id="tab_info">
											
										</div>
										<div title="表数据" id="tab_tableData"  closable="true"   data-options="selected:true">
												<table id="table_table" 
												       class="easyui-datagrid"  
												       rownumbers="true" 
												       pagination="true"  
												       toolbar="#div_tableToolbar"
												       style="width: auto;height: auto">
													<thead>
														<tr>
														</tr>
													</thead> 
												</table>
												<div id="div_tableToolbar">
													<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:alert('Add')">导出为</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:alert('Cut')">复制数据</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">插入新行</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">为当前行创建副本</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">保存更改</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">取消更改</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">删除选定行</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">网格视图</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">表单视图</a>
													<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('Save')">文字视图</a>
												</div>
										</div>
										<div title="表信息" id="tab_tableInfo" iconCls="icon-reload" closable="true">
												<h6 style="background-color: #BDC5FE">
														Format:&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio"/>HTML&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio">文本/详细&nbsp;&nbsp;&nbsp;&nbsp;
														<button>刷新</button>
												</h6>
												
												 <h3>表：xxxxx</h3>
												 <h5 style="background-color: #F5DBC7"> Columns(12)</h5>
												  <button>计算适合的数据类</button><br/>
												  <table class="table">
													  <caption>通过读取现有数据查找该表的最佳数据类型。<a>详细了解</a></caption>
													  <thead>
													    <tr  class="success">
													      <th>Field</th>
													      <th>Type</th>
													      <th>Comment</th></tr>
													  </thead>
													  <tbody>
													    <tr class="success">
													      <td>产品2</td>
													      <td>10/11/2013</td>
													      <td>发货中</td>
													    </tr>
													  </tbody>
													</table><br/>
													
													
													<h5 style="background-color: #F5DBC7">Indexes(1)</h5>
													<button>找出多余索引</button><br/>
													<table class="table">
													  <caption>找到该表的冗余索引。  <a>了解详情</a></caption>
													  <thead>
													    <tr>
													      <th>Indexes</th>
													      <th>Columns</th>
													      <th>Index Type</th></tr>
													  </thead>
													  <tbody>
													    <tr class="success">
													      <td>PRIMARY</td>
													      <td>Id</td>
													      <td>Unique</td>
													    </tr>
													  </tbody>
													</table><br/>
													
													
													<h4 style="background-color: #F5DBC7">DDL信息</h4>
													<table class="table">
													  <caption>上下文表格布局</caption>
													  <thead>
													    <tr class="success">
													      <th>Create Table</th>
													  </thead>
													  <tbody>
													    <tr>
													      <td>CREATE TABLE `co_appstatus` (
															  `mode` varchar(50) DEFAULT NULL COMMENT '设备网络模式(4G、3G)',
															  `cell` varchar(50) DEFAULT NULL,
															  `rxlevel` double(28,14) DEFAULT NULL COMMENT '接收电平',
															  `task` varchar(50) DEFAULT NULL COMMENT '所执行任务名称(我理解的应为co_base_action的action_name)',
															  `progress` varchar(50) DEFAULT NULL,
															  `status` varchar(50) DEFAULT NULL COMMENT '执行进度',
															  `app_session_id` int(11) DEFAULT NULL COMMENT '应该是co_apptokensession表的id(即表示该设备该当前的回话id)',
															  `id` int(11) NOT NULL AUTO_INCREMENT,
															  `cmd` varchar(50) DEFAULT NULL,
															  `cmdState` varchar(50) DEFAULT NULL,
															  `ipv4` varchar(50) DEFAULT NULL,
															  `ipv6` varchar(50) DEFAULT NULL,
															  PRIMARY KEY (`id`)
															) ENGINE=InnoDB AUTO_INCREMENT=4943 DEFAULT CHARSET=utf8 COMMENT='接入设备(手机)某次会话的状态表'
													      </td>
													    </tr>
													  </tbody>
													</table>
													
										</div>
								</div>
						</div>
			</div>
		</div>
		<!--  鼠标右键弹出主menu -->
	   <!--  <div id="mm" class="easyui-menu" style="width:120px;">
	        <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
	        <div onclick="removeit()" data-options="iconCls:'icon-remove'">Remove</div>
	        <div class="menu-sep"></div>
	        <div onclick="expand()">Expand</div>
	        <div onclick="collapse()">Collapse</div>
	    </div> -->
	   <div id="menu_tablename" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>粘贴sql语句</div>
	        <div>将表复制到不同的主机/数据库</div>
	        <div>数据搜索</div>
	        <div>打开表</div>
	        <div>在新选项卡中打开表格</div>
	        <div>创建表</div>
	        <div>改变表</div>
	        <div>管理索引</div>
	        <div>关/系/外键</div>
	        <div>更多表操作</div>
	        <div>备份/导出</div>
	        <div>导入</div>
	        <div>create trigger</div>
	    </div>
	   <div id="menu_wenzi_biao" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>创建表</div>
	        <div>将表复制到不同的主机/数据库</div>
	        <div>数据搜索</div>
	        <div>计划备份</div>
	        <div>备份表作为sql转储</div>
	    </div>
	   <div id="menu_wenzi_shitu" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>创建视图</div>
	    </div>
	   <div id="menu_wenzi_procedure" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>创建存储过程</div>
	    </div>
	   <div id="menu_wenzi_function" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>创建函数</div>
	    </div>
	   <div id="menu_wenzi_trigger" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>创建触发器</div>
	    </div>
	   <div id="menu_wenzi_event" class="easyui-menu" style="width:200px;"><!-- 在tablename上的menu -->
	        <div>创建事件</div>
	    </div>
</body>

<script type="text/javascript">
$(function(){
		var currDbName;
		var currTableName;
		var separator="$";//node.id中的分隔符,要和CommonConstant中的一致
		
	//加载树
		$("#tt").tree({ 
			url: '${pageContext.request.contextPath}/index/listDatabases',
	        method: 'get',
	        animate: true,
	        onExpand:function(node){//“节点展开”事件
	        		var arr=node.id.split(separator);
	        		var type=arr[0];
	        		if(type=="dbname"){//展开的是“数据库名称”节点，为currDbName赋值
	        				currDbName=node.text;
	        		}
	        },
	        onContextMenu: function(e,node){
		        	//判断如果点击的是表名称，则弹出“打开表”的menu
		        	var arr=node.id.split("_");
		        	var type=arr[0];
		        	var typeName=arr[1];
		        	var id=arr[2];
		        	//alert(type);
		        	if(type=="tablename"){//弹出"打开表"menu
			        		// $(this).tree('select',node.target);
			 	            $('#menu_tablename').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	            });
			 	           currTableName=node.text;
		        	}else if(type=="wenzi"&&typeName.indexOf("biao")==0){
		        		 $('#menu_wenzi_biao').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	          });
		        	}else if(type=="wenzi"&&typeName.indexOf("shitu")==0){
		        		 $('#menu_wenzi_shitu').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	          });
		        	}else if(type=="wenzi"&&typeName.indexOf("procedure")==0){
		        		 $('#menu_wenzi_procedure').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	          });
		        	}else if(type=="wenzi"&&typeName.indexOf("function")==0){
		        		 $('#menu_wenzi_function').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	          });
		        	}else if(type=="wenzi"&&typeName.indexOf("trigger")==0){
		        		 $('#menu_wenzi_trigger').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	          });
		        	}else if(type=="wenzi"&&typeName.indexOf("event")==0){
		        		 $('#menu_wenzi_event').menu('show',{
			 	                left: e.pageX,
			 	                top: e.pageY
			 	          });
		        	}
		            e.preventDefault();//阻止浏览器默认事件
	        },
	        onClick:function(node){  
		        	var arr= node.id.split(separator);
		        	var type=arr[0];
		        	
		        	if(type=="dbname"){//单击的是数据库名称
		        		  	 currDbName=arr[1];
		        	}else if(type=="tablename"){//单击的是数据表名称
		        			//(加载表数据)
		        		
		        		  	 currTableName=node.text;
		        		  	 var url_="${pageContext.request.contextPath}/index/openTableData?dbname="+currDbName+"&tablename="+currTableName;
			        		 $.ajax({
		   			                 url:url_ ,
		   			                 type: "get",
		   			                 dataType: "json",
		   			                 success: function (data) {
				   			                 $('#table_table').datagrid(data.titles);//加载标题
				   			        		 $('#table_table').datagrid('loadData',data.datas);//加载数据
		   			                 }
	   			             }); 
			        		 
			        		 
			        		 
			        		 
			        		 //(加载表信息)
			        		  url_="${pageContext.request.contextPath}/index/openTableInfo?dbname="+currDbName+"&tablename="+currTableName;
			        		  $.ajax({
		   			                 url:url_ ,
		   			                 type: "get",
		   			                 dataType: "json",
		   			                 success: function (data) {
		   			                	 
		   			                	 alert(data);
		   			                	 
		   			                 }
	   			             }); 
			        		 
			        		 
			        		 
			        		 
			        		 
			        		 
		        		
		        		/*	"columns":[[
			        			           {"field":"name","title":"名字"},
			        			           {"field":"age","title":"年龄"},
			        			           {"field":"hobby","title":"爱好"},
			        			           {"field":"address","title":"地址"}
		        			          ]]
		        		});
		        		
		        		$('#table_table').datagrid('loadData',{
		        			"total":4,
		        			"rows":[
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
			        			        {"name":"张三","age":23,"hobby":"骑马","address":"河南省信阳市"},
		        			       ]
		        		}); */
		        	}
		    }
		});
});





//alert("aaaa_bbb_ccc".split("_"));

		
/* function append(){
    var t = $('#tt');
    var node = t.tree('getSelected');
    t.tree('append', {
        parent: (node?node.target:null),
        data: [{
            text: 'new item1'
        },{
            text: 'new item2'
        }]
    });
}
function removeit(){
    var node = $('#tt').tree('getSelected');
    $('#tt').tree('remove', node.target);
}
function collapse(){
    var node = $('#tt').tree('getSelected');
    $('#tt').tree('collapse',node.target);
}
function expand(){
    var node = $('#tt').tree('getSelected');
    $('#tt').tree('expand',node.target);
} */
</script>
</html>