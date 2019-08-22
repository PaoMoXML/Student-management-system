<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%> 
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />

<%--js部分--%>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>

<!-- 时间 -->
<script src="../js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-datetimepicker.min.css" />

<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/sweetalert/1.1.2/sweetalert.min.css">
<script type="text/javascript" src="https://cdn.bootcss.com/sweetalert/1.1.2/sweetalert.min.js"></script>
</head>
<body>







<div class="panel panel-default">
    <div class="panel-heading">
        查询条件
    </div>
    <div class="panel-body form-group" style="margin-bottom:0px;">
        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">姓名：</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" name="name" id="search_name"/>
        </div>
        <div class="col-sm-1 col-sm-offset-4">
            <button class="btn btn-primary" id="search_btn">查询</button>
        </div>
     </div>
</div>

<table id="mytab" class="table table-striped table-bordered table-hover"></table>









<div id="changeModalTable" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">修改</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">    
      <input type="hidden" class = "form-control" id = "stuid2"> 
     姓名<input type="text" class = "form-control" id = "name2">
     年龄<input type="text" class = "form-control" id = "age2">
     电话<input type="text" class = "form-control" id = "phone2">
     班级<input type="text" class = "form-control" id = "classid2">
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-secondary"  onclick = "change()" data-dismiss="modal">修改</button>
      </div>
    </div>
  </div>
</div>

<!-- 查看班级 -->
<div id="classesModalTable" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document" style="width:100%;height:100%">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">班级</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
		<!-- <table id="table2" class="table table-striped table-bordered table-hover"></table> -->
		<table  class = "table">
	    <c:forEach items="${classesInfo}" var="ci" varStatus="st">
	    <tr>
	    	<td>班级id：${ci.classid}</td>
		    	<tr>
		    	<td>姓名</td>
		    	<td>年龄</td>
		    	<td>电话</td>
		    	</tr>
		    	<c:forEach items="${ci.studentd}" var="cs" varStatus="st">
		    	<tr>
		    	<td>${cs.name}</td>
		    	<td>${cs.age}</td>
		    	<td>${cs.phone}</td>
		    	</tr>
		    		
		    	</c:forEach>
	    </c:forEach>
</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- <input type = "text" id = "classid100"> -->


<script>


function classes(classid){
	console.log(classid);
	
		
$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/classes/seeClasses2?classid="+classid,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
            console.log(result);
                        if (result.key == "success") {
                            swal('提示', "删除成功", 'success');
                        } else {
                            swal('提示', "删除失败", 'error');
                        }
           },
           error: function(result) {
               console.log(result);
           },
	});
/* 	
$('#table2').bootstrapTable('destroy').bootstrapTable({
	method : 'post',
	url : "${pageContext.request.contextPath}/classes/seeClasses3?classid="+classid,//请求路径
	striped : true, //是否显示行间隔色
	pageNumber : 1, //初始化加载第一页
	toolbar : '#toolbar', //工具按钮用哪个容器
	buttonsAlign : "right", //按钮位置
	pagination : true,//是否分页
	sidePagination : 'client',//server:服务器端分页|client：前端分页
	pageSize : 5,//单页记录数
	pageList : [ 5, 10, 20, 30 ],//可选择单页记录数
	showRefresh : true,//刷新按钮
	clickToSelect:true,//点击选中

	columns : [ {
		field : '',
		checkbox : true,
	},
		{
		title : 'ID',
		field : 'id',
		sortable : true
	}, {
		title : '年龄',
		field : 'age',
		sortable : true
	}, {
		title : '姓名',
		field : 'name',
	}, {
		title : '年龄',
		field : 'age',
		formatter : function(value,row, index){   //主要配置在这里
            return row.studentd.name;
        }
	}, {
		title : '班级',
		field : 'classid',
	},{
		title : '电话',
		field : 'phone',
	}]
})
 */
}
</script>





<script type="text/javascript">

$('#mytab').bootstrapTable({
	method : 'post',
	url : "${pageContext.request.contextPath}/studentD/stuTable2",//请求路径
	striped : true, //是否显示行间隔色
	pageNumber : 1, //初始化加载第一页
	cache : true,//是否缓存数据
	toolbar : '#toolbar', //工具按钮用哪个容器
	buttonsAlign : "right", //按钮位置
	pagination : true,//是否分页
	sidePagination : 'server',//server:服务器端分页|client：前端分页
	pageSize : 5,//单页记录数
	pageList : [ 5, 10, 20, 30 ],//可选择单页记录数
	showRefresh : true,//刷新按钮
	clickToSelect:true,//点击选中
	queryParams : function(params) {//上传服务器的参数
		var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
		   limit : params.limit, // 每页显示数量
	       offset : params.offset, // SQL语句起始索引
	       page: (params.offset / params.limit) + 1, 
		   name : $('#search_name').val(),
		};
		return temp;
	},
	columns : [ {
		field : '',
		checkbox : true,
	},
		{
		title : 'ID',
		field : 'id',
		sortable : true
	}, {
		title : '学号',
		field : 'stuid',
		sortable : true
	}, {
		title : '姓名',
		field : 'name',
	}, {
		title : '年龄',
		field : 'age',
	}, {
		title : '班级',
		field : 'classid',
	},{
		title : '操作',
		field : 'id',
		formatter : operation,//对资源进行操作
	} ]
})
 
//value代表该列的值，row代表当前对象
function formatSex(value, row, index) {
	return value == 1 ? "男" : "女";
	//或者 return row.sex == 1 ? "男" : "女";
}
 
//删除、编辑操作
function operation(value, row, index) {
	var htm = "<button id = 'del' class='btn btn-sm btn-danger' onclick='del(&apos;"
			 	+ row.stuid
			 	+ "&apos;)'>删除</button><button class = 'btn btn-sm btn-warning' data-toggle='modal' data-target='#changeModalTable' onclick = 'showchange(&apos;"
			 	+ row.stuid
			 	+ "&apos;,&apos;"
			 	+ row.name
			 	+ "&apos;,&apos;"
			 	+ row.age
			 	+ "&apos;,&apos;"
			 	+ row.phone
			 	+ "&apos;,&apos;"
			 	+ row.classid
			 	+ "&apos;)'>修改</button><button id = 'del' class='btn btn-sm btn-info' data-toggle='modal' data-target='#classesModalTable' onclick='classes(&apos;"
			 	+ row.classid
			 	+ "&apos;)'>查看班级</button>"
	return htm;
}
//查看班级
/* function classes(classid){
	var classes = {"classid":classid};
	var jsonData = JSON.stringify(classes);
		$.ajax({
			
		})
	
} */

/* function classes(classid){
	document.getElementById('classid100').value=classid;
} */

 
//删除 
 function del(stuid){
	 	var del = {"stuid":stuid};
		var jsonData = JSON.stringify(del);
			$.ajax({
				type:"post",
				url:'${pageContext.request.contextPath}/studentD/delStu',
				data:jsonData,
				dataType:"json",
		        contentType : "application/json;charset=UTF-8",
		        success: function(result){
		            console.log(result);
                        if (result.key == "success") {
                             swal('提示', "删除成功", 'success');
                         } else {
                             swal('提示', "删除失败", 'error');
                         }
		               $('#mytab').bootstrapTable('refresh');
		           },
		           error: function(result) {
		               console.log(result);
		           },
			});
 }
 //将数据显示倒修改框中
 function showchange(stuid,name,age,phone,classid){
	 document.getElementById('stuid2').value=stuid;
	 document.getElementById('phone2').value=phone;
	 document.getElementById("name2").value=name;
	 document.getElementById("age2").value=age;
	 document.getElementById("classid2").value=classid;
 }
 //修改
 function change(){
	 var stuid = document.getElementById('stuid2').value;
	 var phone = document.getElementById('phone2').value;
	 var name = document.getElementById("name2").value;
	 var age = document.getElementById("age2").value;
	 var classid = document.getElementById("classid2").value;
	 
		var changes = {"stuid":stuid,"name":name,"age":age,"classid":classid};
		var jsonData = JSON.stringify(changes);
			$.ajax({
				type:"post",
				url:'${pageContext.request.contextPath}/studentD/updateStuInfo',
				data:jsonData,
				dataType:"json",
		        contentType : "application/json;charset=UTF-8",
		        success: function(result){
		            console.log(result);
                        if (result.key == "success") {
                             swal('提示', "修改成功", 'success');
                         } else {
                             swal('提示', "修改失败", 'error');
                         }
		               $('#mytab').bootstrapTable('refresh');
		           },
		           error: function(result) {
		               console.log(result);
		           },
			})
 }
  

 
 
//查询按钮事件
$('#search_btn').click(function() {
	$('#mytab').bootstrapTable('refresh', {
		url : '${pageContext.request.contextPath}/studentD/stuTable2'
	});
})
</script>

<div id="modalTableAddStu" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">添加学生</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div id = "addStuInput">
     姓名<input type="text" value="" class = "form-control" id = "name1">
     年龄<input type="text" value="" class = "form-control" id = "age1">
     电话<input type="text" value="" class = "form-control" id = "phone1">
     班级<input type="text" value="" class = "form-control" id = "classid1">
     </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  id ="addStu"data-dismiss="modal">添加</button>
      </div>
    </div>
  </div>
</div>



<script>

$('#addStu').click(function(){
	var url = "${pageContext.request.contextPath}/studentD/addStu";
	var name = document.getElementById('name1').value; 
	var age = document.getElementById('age1').value; 
	var phone = document.getElementById('phone1').value; 
	var classid = document.getElementById('classid1').value;
	var insert = {"name":name,"age":age,"phone":phone,"classid":classid};
	var jsonData = JSON.stringify(insert);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
               console.log(result);
               
           },
           error: function(result) {
               console.log(result);
           },
	});
})


</script>






    <div>
    <button class = "btn btn-sm btn-primary" data-toggle="modal" data-target="#modalTableAddStu">添加学生</button>
    </div>


</body>
</html>