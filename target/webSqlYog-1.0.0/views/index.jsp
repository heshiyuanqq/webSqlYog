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
			<div id="content"   class="easyui-layout"  region="center" title="询问" style="padding:5px;">
						<div region="north" split="true" title="查询区域"  style="height:auto;">
									select * from user;
						</div>
						<div id="content" region="center" title="列表区域"   style="height: 200px;">
						
						
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
	
	//加载树
		$("#tt").tree({ 
			url: '${pageContext.request.contextPath}/index/listDatabases',
	        method: 'get',
	        animate: true,
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
	        	
	        	
	        	
	        	
	        	
	        	
	        	
	            e.preventDefault();
	        },
	        onClick:function(node){  
		        //alert(node.text);  
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