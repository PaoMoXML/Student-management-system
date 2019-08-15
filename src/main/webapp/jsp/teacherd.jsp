<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师个人中心</title>
    <%--css部分--%>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-table.min.css">

    <%--js部分--%>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	var url = "${pageContext.request.contextPath}/teacherd/teacherD"
	var teaid = "${sessionScope.teacher.stuid}";
	var Info = {"teaid":teaid};
	var jsonData = JSON.stringify(Info);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success:function(res){
        	console.log(res);
           	 document.getElementById("teacherName").innerHTML = res.teaDetail.teacherName;
           	 document.getElementById("age").innerHTML = res.teaDetail.age;
           	 document.getElementById("pic").innerHTML = res.teaDetail.pic;
        	
        },
        error:function(res){
        	console.log(res)
        },
        });
});
</script>
<table class = "table">
<tr>
	<td>姓名</td>
	<td>年龄</td>
	<td>年龄</td>
</tr>
<tr>
	<td id = "teacherName"></td>
	<td id = "age"></td>
	<td id = "pic"></td>
</tr>
</table>




<button id = "reSet" class = "btn btn-sm btn-primary">修改密码</button>
<script type="text/javascript" >
$('#reSet').click(function(){
	var url = "${pageContext.request.contextPath}/student/searchStudent";
	var stuid = "${sessionScope.teacher.stuid}";
	var Info = {"stuid": stuid};
	var jsonData = JSON.stringify(Info);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
            console.log(result.stuInfo);
            var detail = result.stuInfo;
            $(function(detail){
            	$(function(){
            		  $("#notshow").show();
            	})
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
<div id = "notshow" style ="display:none">
<form>
<input type="text" name="password" id="password" value="" />
<input type="hidden" name="stuid" id="stuid" value="" />
<input type="hidden" name="roleid" id="roleid" value="" />
<input type="hidden" name="id" id="id" value="" />
<input type="hidden" name="id" id="id" value="" />
	<button id = "change" class = "btn btn-sm btn-primary">修改</button>
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
	              	 window.location.href = '${pageContext.request.contextPath}/teacherd/teacherD?teaid=${teacher.stuid}'
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