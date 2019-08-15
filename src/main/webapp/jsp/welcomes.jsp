<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
</head>

  <div class="col-sm-3 col-md-2 sidebar" >
          <ul class="nav nav-sidebar">
            <li class="active"><a href="">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="${pageContext.request.contextPath}/studentD/listStudentD2" target="right">教师学生查询</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="${pageContext.request.contextPath}/jsp/student.jsp"target="right">学生信息中心</a></li>
          </ul>
  </div> 
        
          <div class = "container" style="margin:35px auto auto auto;">
            <iframe src="${pageContext.request.contextPath}/jsp/teacher.jsp" name="right" width="800" height="700" frameborder="0" ></iframe>
          </div>

        

</html>