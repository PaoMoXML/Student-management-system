<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师管理</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />

<%--js部分--%>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>

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
     <input type="hidden" class = "form-control" id = "teaid2"> 
     姓名<input type="text" class = "form-control" id = "teacherName2">
     年龄<input type="text" class = "form-control" id = "age2">
     图片<input type="text" class = "form-control" id = "pic2">
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-secondary"  onclick = "change()" data-dismiss="modal">修改</button>
      </div>
    </div>
  </div>
</div>






<script type="text/javascript">

$('#mytab').bootstrapTable({
	method : 'post',
	url : "${pageContext.request.contextPath}/teacherd/teacherTable",//请求路径
	striped : true, //是否显示行间隔色
	pageNumber : 1, //初始化加载第一页
	cache : true,//是否缓存数据
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
		title : '教工号',
		field : 'teaid',
		sortable : true
	}, {
		title : '姓名',
		field : 'teacherName',
	}, {
		title : '年龄',
		field : 'age',
	}, {
		title : '图片',
		field : 'pic',
	},{
		title : '操作',
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
	 	+ row.teaid
	 	+ "&apos;)'>删除</button><button class = 'btn btn-sm btn-warning' data-toggle='modal' data-target='#changeModalTable' onclick = 'showchange(&apos;"
	 	+ row.id
	 	+ "&apos;,&apos;"
	 	+ row.teaid
	 	+ "&apos;,&apos;"
	 	+ row.teacherName
	 	+ "&apos;,&apos;"
	 	+ row.age
	 	+ "&apos;,&apos;"
	 	+ row.pic
	 	+ "&apos;)'>修改</button>"
	return htm;
}

//删除
function del(teaid){
	var url = '${pageContext.request.contextPath}/teacherd/delTeacherd'
	var del = {"teaid":teaid};
	var jsonData = JSON.stringify(del);
		$.ajax({
			type:"post",
			url:url,
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
		})
}
//将数据显示到修改框中
function showchange(id,teaid,teacherName,age,pic){
	 document.getElementById('teaid2').value=teaid;
	 document.getElementById('teacherName2').value=teacherName;
	 document.getElementById("age2").value=age;
	 document.getElementById("pic2").value=pic;
}
//修改
function change(){
	 var teaid = document.getElementById('teaid2').value;
	 var teacherName = document.getElementById('teacherName2').value;
	 var age = document.getElementById("age2").value;
	 var pic = document.getElementById("pic2").value;
	 
		var changes = {"teaid":teaid,"name":teacherName,"age":age,"pic":pic};
		var jsonData = JSON.stringify(changes);
			$.ajax({
				type:"post",
				url:'${pageContext.request.contextPath}/teacherd/updateTeaInfo',
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
		url : '${pageContext.request.contextPath}/teacherd/teacherTable'
	});
})
</script>

<!-- 添加教师 -->
<div id="modalTableAddTea" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">添加教师</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div id = "addTeaInput">
     姓名<input type="text" value="" class = "form-control" id = "teacherName1">
     年龄<input type="text" value="" class = "form-control" id = "age1">
     图片<input type="text" value="" class = "form-control" id = "pic1">
     </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  id ="addTea"data-dismiss="modal">添加</button>
      </div>
    </div>
  </div>
</div>



<script>

$('#addTea').click(function(){
	var url = "${pageContext.request.contextPath}/teacherd/addTea";
	var teacherName = document.getElementById('teacherName1').value; 
	var age = document.getElementById('age1').value; 
	var pic = document.getElementById('pic1').value; 
	var insert = {"teacherName":teacherName,"age":age,"pic":pic};
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
<button class = "btn btn-sm btn-primary" data-toggle="modal" data-target="#modalTableAddTea">添加教师</button>
</body>
</html>