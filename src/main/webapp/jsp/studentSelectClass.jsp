<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生选课</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script> 
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/sweetalert/1.1.2/sweetalert.min.css">
<script type="text/javascript" src="https://cdn.bootcss.com/sweetalert/1.1.2/sweetalert.min.js"></script>

</head>
<body>
	<table class = "table" id="tbList">
		<tr>
			<td>id</td>
			<td>课程名</td>
			<td>教师名</td>
			<td>上课地点</td>
			<td>上课时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${cl}" var="cl" varStatus="st">
		<tr>	
			<td id = "id">${cl.id}</td>
			<td>${cl.courseName}</td>
			<td>${cl.teacherName}</td>
			<td>${cl.place}</td>
			<td>${cl.time}</td>
			<td><button  id="${cl.id}" onclick = "lick(this, this.id)" class = "btn btn-sm btn-success">选择</button></td>
		</tr>
		</c:forEach>
	</table>
	
	
<script type="text/javascript">
function lick (obj,id){
	var td_content = $(obj).parents("tr").children("td");  //获取当前行中的所有td值
	var content = td_content.eq(0).text(); //获取当前行第一个td的值
	var url = "${pageContext.request.contextPath}/studentCourse/checkGrade";
	var courseid = content;
	var stuid = "${sessionScope.student.stuid}";
	var Info = {"stuid":stuid,"courseid":courseid};
	var jsonData = JSON.stringify(Info);
		//先检查是否已经选择
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success: function(result){
            console.log(result.key);
            if(result.key == 1){
            	swal('提示', "已选过此课程", 'error');
            }
				//选课
            if(result.key == 2){
            	var url2 = "${pageContext.request.contextPath}/studentCourse/insertCourse";
            	$.ajax({
            		type:"post",
            		url:url2,
            		data:jsonData,
            		dataType:"json",
                    contentType : "application/json;charset=UTF-8",
                    success: function(data){
                    	console.log(data);
                    	 if(data.key == "success"){
                    		 swal('提示', "选课成功", 'success');
                         }
                    	 else{
                    		 swal('提示', "选课失败", 'error');
                          }
                    }
            	});
            }
            
        },
        error: function(result) {
            console.log(result);
        },
	})
}
</script>
</body>
</html>