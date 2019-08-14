<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增删课程</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script> 
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />

</head>
<body>

<label for="inputstu" class="sr-only">STUID</label>
<input type = "text" name = "courseName" id = "courseName" class = "form-control" required="">
<input type = "text" name = "teacherName" id = "teacherName" class = "form-control" required="">
<input type = "text" name = "place" id = "place" class = "form-control" required="">
<input type = "text" name = "time" id = "time" class = "form-control" required="">
<button id = "insert" class = "btn btn-sm btn-primary">增加</button>

 <script type="text/javascript">
	$('#insert').click(function(){

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
</script> 
</body>
</html>