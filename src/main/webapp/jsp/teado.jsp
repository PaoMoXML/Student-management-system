<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看学生选课</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
</head>
<body>
<table  class = "table">
		<tr>
			<td>课程名</td>
			<td>教师</td>
			<td>上课地点</td>
			<td>上课时间</td>
			<td>成绩</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${sc}" var="sc" varStatus="st">
		<tr>
			<td>${sc.course.courseName}</td>
			<td>${sc.course.teacherName}</td>
			<td>${sc.course.place}</td>
			<td>${sc.course.time}</td>
			<td>${sc.grade}</td>
			<td><a href="${pageContext.request.contextPath}/studentCourse/selectGrade?stuid=${sc.stuid}&courseid=${sc.courseid}" class = "btn btn-sm btn-warning">修改成绩</a></td>
		</tr>
		</c:forEach>
</table>

<br>

<form>
<input   id = "stuid" value="${grade.stuid}" type="hidden">
<input   id = "courseid" value="${grade.courseid}" type="hidden">
输入成绩<input type="text" id = "grade" value="${grade.grade}">
<button  id = "sender" class="btn btn-sm btn-danger">提交</button>
</form>

<div id="messageDiv"></div> 

<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script> 
<script type="text/javascript">
	$('#sender').click(function(){
		var stuid = document.getElementById('stuid').value; 
		var courseid = document.getElementById('courseid').value; 
		var grade = document.getElementById('grade').value; 
		var studentCourse = {"stuid":stuid,"courseid":courseid,"grade":grade};
		var jsonData = JSON.stringify(studentCourse);
		var page = "${pageContext.request.contextPath}/studentCourse/updateGrade";
		
		$.ajax({
			type:"post",
			url:page,
			data:jsonData,
			dataType:"json",
			contentType : "application/json;charset=UTF-8",
			success: function(result){
				  window.location.href = '${pageContext.request.contextPath}/studentCourse/course?courseid='+courseid+'&stuid='+stuid
                console.log(result);
            },
            error: function(result) {
                console.log(result);
            }
		});
		 alert("提交成功！");
	});
</script>

    
<%--     action="${pageContext.request.contextPath}/studentCourse/updateGrade" method="post"      
 --%>
</body>
</html>