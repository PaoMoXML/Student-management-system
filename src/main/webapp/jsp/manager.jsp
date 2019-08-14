<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
</head>
<body>
<form action="${pageContext.request.contextPath}/studentD/listStudentD" method="post">
姓名<input type = "text" name = "name">
<button type = "submit" class = "btn btn-sm btn-primary">查询</button>
</form>
<table  class = "table">
		<tr>
			<td>学号</td>
			<td>姓名</td>
			<td>电话</td>
			<td>班级</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${sd}" var="sd" varStatus="st">
			<tr>
				<td>${sd.stuid}</td>
				<td>${sd.name}</td>
				<td>${sd.phone}</td>
				<td>${sd.classid}</td>
				<td>
				<a href="${pageContext.request.contextPath}/studentCourse/course?stuid=${sd.stuid}" class = "btn btn-sm btn-primary">查看课程</a> 
				<a href="${pageContext.request.contextPath}/classes/seeClasses2?classid=${sd.classid}" class = "btn btn-sm btn-info">查看班级</a>
				<a href="${pageContext.request.contextPath}/student/reSetPassword?stuid=${sd.stuid}" class = "btn btn-sm btn-danger">重置密码</a>
				</td>
				
			</tr>
		</c:forEach>
</table>
<div style="">
        <a href="?start=0">首 页</a>
        <c:if test="${page.start-page.count>=0}">
            <a href="?start=${page.start-page.count}">上一页</a>
        </c:if>
        <c:if test="${page.start-page.count<0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.start+page.count<=page.last}">
            <a href="?start=${page.start+page.count}">下一页</a>
        </c:if>
        <c:if test="${page.start+page.count>page.last}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <a href="?start=${page.last}">末页</a>
    </div>
    
    
    <div>
    <a href="changeCourse.jsp">添加课程</a>
    <a href="">删除课程</a>
    </div>

<form action = "${pageContext.request.contextPath}/teacherd/teaList">
姓名<input type = "text" name = "teacherName">
<button type = "submit" class = "btn btn-sm btn-primary">查询</button>
</form>

<table  class = "table">
		<tr>
			<td>教师号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>图片</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${tl}" var="tl" varStatus="st">
			<tr>
				<td>${tl.teaid}</td>
				<td>${tl.teacherName}</td>
				<td>${tl.age}</td>
				<td>${tl.pic}</td>
				<td><a href="${pageContext.request.contextPath}/student/reSetPassword?stuid=${tl.teaid}" class = "btn btn-sm btn-danger">重置密码</a></td>
				
			</tr>
		</c:forEach>
</table>

<div style="">
        <a href="?start=0">首 页</a>
        <c:if test="${page.start-page.count>=0}">
            <a href="?start=${page.start-page.count}">上一页</a>
        </c:if>
        <c:if test="${page.start-page.count<0}">
            <a href="javascript:void(0)">上一页</a>
        </c:if>
        <c:if test="${page.start+page.count<=page.last}">
            <a href="?start=${page.start+page.count}">下一页</a>
        </c:if>
        <c:if test="${page.start+page.count>page.last}">
            <a href="javascript:void(0)">下一页</a>
        </c:if>
        <a href="?start=${page.last}">末页</a>
</div>



<table class = "table">
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








</body>
</html>