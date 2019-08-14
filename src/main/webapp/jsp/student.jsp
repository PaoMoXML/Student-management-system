<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script> 
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
</head>
<body>

<script type="text/javascript">
$(document).ready(function(){ 
	var url = "${pageContext.request.contextPath}/studentD/stuDetail"
	var stuid = "${sessionScope.student.stuid}";
	var Info = {"stuid": stuid};
	var jsonData = JSON.stringify(Info);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
        	 console.log(result.studentd);
        	 document.getElementById("stuid1").innerHTML = result.studentd.stuid;
        	 document.getElementById("name1").innerHTML = result.studentd.name;
        	 document.getElementById("age1").innerHTML = result.studentd.age;
        	 document.getElementById("phone1").innerHTML = result.studentd.phone;
        	 document.getElementById("classid1").innerHTML = result.studentd.classid;
        	},
    	error: function(result) {
             console.log(result);
        	},
	});
        
	}); 
</script>

个人信息：
<table class = "table">
<tr>
	<td>学号</td>
	<td>姓名</td>
	<td>年龄</td>
	<td>电话</td>
	<td>班级</td>
</tr>
<tr>
	<td id = "stuid1"></td>
	<td id = "name1"></td>
	<td id = "age1"></td>
	<td id = "phone1"></td>
	<td id = "classid1"></td>
</tr>
</table>

<a href="${pageContext.request.contextPath}/course/selectCourse" class = "btn btn-sm btn-primary">前去选课</a>

<a href="${pageContext.request.contextPath}/studentCourse/course2?stuid=${student.stuid}" class = "btn btn-sm btn-success">查看修改选课信息</a>

<button id = "reSet" class = "btn btn-sm btn-danger">修改密码</button>
<script type="text/javascript" >
$('#reSet').click(function(){
	var url = "${pageContext.request.contextPath}/student/searchStudent2";
	var stuid = "${sessionScope.student.stuid}";
	var Info = {"stuid": stuid};
	var jsonData = JSON.stringify(Info);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
        	$(function(){
      		  $("#notshow").show();
      		  })
            console.log(result.stuInfo);
            var detail = result.stuInfo;
            $(function(detail){
            	detail = result.stuInfo
            	for(e in detail) $("#" + e).val(detail[e]);
            })
        },
        error: function(result) {
            console.log(result);
        },
	});
});

</script>

<script type="text/javascript">
$(document).ready(function(){
	  $("#change").click(function(){
	  $("#notshow").hide();
	  });
});
</script>
<div id = "notshow" style="display:none">
	<form>
	<input type="text" name="password" id="password" value="" />
	<input type="hidden" name="stuid" id="stuid" value="" />
	<input type="hidden" name="roleid" id="roleid" value="" />
	<input type="hidden" name="id" id="id" value="" />
	<input type="hidden" name="id" id="id" value="" />
		<button id = "change">修改</button>
	</form>
</div>






<script type="text/javascript">
	$('#change').click(function(){

			var url = "${pageContext.request.contextPath}/student/reSetPassword2";
			var stuid = document.getElementById('stuid').value; 
			var password = document.getElementById('password').value; 
			var changes = {"stuid":stuid,"password":password};
			var jsonData = JSON.stringify(changes);
			
			$.ajax({
				type:"post",
				url:url,
				data:jsonData,
				dataType:"json",
	            contentType : "application/json;charset=UTF-8",
	            success: function(result){
	                   console.log(result);
	             	  alert("修改成功");
	               },
	               error: function(result) {
	                   console.log(result);
	               },
			});

	});
</script>
</body>
</html>