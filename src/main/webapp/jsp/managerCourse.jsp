<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程</title>
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
            <input type="text" class="form-control" name="courseName" id="search_name"/>
        </div>
        <div class="col-sm-1 col-sm-offset-4">
            <button class="btn btn-primary" id="search_btn">查询</button>
        </div>
     </div>
</div>
<table id="mytab" class="table table-striped table-bordered table-hover"></table>

<script type="text/javascript">
$('#mytab').bootstrapTable({
	method : 'post',
	url : "${pageContext.request.contextPath}/course/seeCourse",//请求路径
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
		   courseName : $('#search_name').val(),
		};
		return temp;
	},
	columns : [ {
		field : '',
		checkbox : true,
	}, {
		title : 'ID',
		field : 'id',
		sortable : true
	}, {
		title : '课程名',
		field : 'courseName',
		sortable : true
	}, {
		title : '教师名',
		field : 'teacherName',
		sortable : true
	}, {
		title : '上课地点',
		field : 'place',
	}, {
		title : '上课时间',
		field : 'time',
	}, {
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
	 	+ row.id
	 	+ "&apos;)'>删除</button><button class = 'btn btn-sm btn-warning' data-toggle='modal' data-target='#changeModalTable' onclick = 'showchange(&apos;"
	 	+ row.id
	 	+ "&apos;,&apos;"
	 	+ row.courseName
	 	+ "&apos;,&apos;"
	 	+ row.teacherName
	 	+ "&apos;,&apos;"
	 	+ row.place
	 	+ "&apos;,&apos;"
	 	+ row.time
	 	+ "&apos;)'>修改</button>"
	return htm;
}

//查询按钮事件
$('#search_btn').click(function() {
	$('#mytab').bootstrapTable('refresh', {
		url : '${pageContext.request.contextPath}/course/seeCourse'
	});
})











</script>


<div id="modalTableAddCourse" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">添加课程</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <label for="inputstu" class="sr-only">STUID</label>
		课程名<input type = "text" name = "courseName" id = "courseName" class = "form-control" required="">
		教师名<input type = "text" name = "teacherName" id = "teacherName" class = "form-control" required="">
		上课地点<input type = "text" name = "place" id = "place" class = "form-control" required="">
<%-- 		上课时间<input type = "text" name = "time" id = "time" class = "form-control" required="" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime())%>">
 --%>	 <div id="datetimepicker" class="input-append date">  
      	上课时间<input type="text" name="time" id="time" class = "form-control"></input>  
      <span class="add-on">  
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>  
      </span>  
    </div>  
    


  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id ="addCourse">添加</button>
      </div>
      
      <script type="text/javascript">
      
	$('#addCourse').click(function(){

			var url = "${pageContext.request.contextPath}/course/insertCourse";
			var courseName = document.getElementById('courseName').value; 
			var teacherName = document.getElementById('teacherName').value; 
			var place = document.getElementById('place').value; 
			var time = document.getElementById('time').value;
			var updates = {"courseName":courseName,"teacherName":teacherName,"place":place,"time":time};
			var jsonData = JSON.stringify(updates);

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

	});
	
    $('#datetimepicker').datetimepicker({
        format: 'yyyy-MM-dd',
        language: 'en',
        pickDate: true,
        pickTime: true,
        hourStep: 1,
        minuteStep: 15,
        secondStep: 30,
        inputMask: true
      });
</script> 
      
      
    </div>
  </div>
</div>





    <button class = "btn btn-sm btn-primary" data-toggle="modal" data-target="#modalTableAddCourse">添加课程</button>

	<a href="" class = "btn btn-sm btn-primary">删除课程</a>
</body>
</html>