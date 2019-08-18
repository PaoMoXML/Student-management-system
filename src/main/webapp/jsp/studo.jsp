<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看选课</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script> 
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
</head>
<body>
<table  class = "table">
		<tr>
			<td>ID</td>		
			<td>课程名</td>
			<td>教师</td>
			<td>上课地点</td>
			<td>上课时间</td>
			<td>成绩</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${sc}" var="sc" varStatus="st">
		<tr>
			<td>${sc.id}</td>
			<td>${sc.course.courseName}</td>
			<td>${sc.course.teacherName}</td>
			<td>${sc.course.place}</td>
			<td>${sc.course.time}</td>
			<td>${sc.grade}</td>
			<td><button id = "${cs.id}" onclick = "del(this,this.id)">退课</button></td>
		</tr>
		</c:forEach>
</table>
<script type="text/javascript">
function del (obj,id){
	var td_content = $(obj).parents("tr").children("td");//获取当前行中的所有td值
	var id = td_content.eq(0).text();//获取当前行第一个td的值
	var url = "${pageContext.request.contextPath}/studentCourse/delCourse";
	var Info = {"id":id};
	var jsonData = JSON.stringify(Info);
	
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
        	console.log(result.key)
        	if(result.key == 5)
        		alert("退课成功")
             	window.location.href = "${pageContext.request.contextPath}/studentCourse/course2?stuid=${student.stuid}"

        	}
        
	})
		
}

</script>
</body>
</html>