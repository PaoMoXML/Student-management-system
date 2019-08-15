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

<%--js部分--%>
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/sweetalert/1.1.2/sweetalert.min.css">
<script type="text/javascript" src="https://cdn.bootcss.com/sweetalert/1.1.2/sweetalert.min.js"></script>
</head>
<body>
<table  class = "table">
		<tr>
			<td>课程名</td>
			<td>教师</td>
			<td>上课地点</td>
			<td>上课时间</td>
			<td>成绩</td>
			<td>学号</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${sc}" var="sc" varStatus="st">
		<tr>
			<td id = "id">${sc.stuid}</td>
			<td>${sc.courseid}</td>
			<td>${sc.course.courseName}</td>
			<td>${sc.course.teacherName}</td>
			<td>${sc.course.place}</td>
			<td>${sc.course.time}</td>
			<td>${sc.grade}</td>
			<td><button  id="${sc.stuid}" onclick = "lick(this, this.id)"class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modalTable">选择</button></td>
		</tr>
		</c:forEach>
</table>
<script type="text/javascript">
function lick(obj,id){
	var td_content = $(obj).parents("tr").children("td");  //获取当前行中的所有td值
	var content = td_content.eq(0).text(); //获取当前行第一个td的值
	var content2 = td_content.eq(1).text();
	var url = "${pageContext.request.contextPath}/studentCourse/selectGrade"
	var stuid = content;
	var courseid = content2;
	var Info = {"stuid":stuid,"courseid":courseid}
	var jsonData = JSON.stringify(Info);
	$.ajax({
		type:"post",
		url:url,
		data:jsonData,
		dataType:"json",
        contentType : "application/json;charset=UTF-8",
        success:function(res){
        	console.log(res);
        	detail = res.detail
        	for(e in detail) $("#" + e).val(detail[e]);
        },
        error:function(){
        	console.log(res);	
        },
	})
}
</script>
<%-- ${pageContext.request.contextPath}/studentCourse/selectGrade?stuid=${sc.stuid}&courseid=${sc.courseid}
 --%><br>





<div id="modalTable" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal table</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body" id = "test">
      
		<input   id = "stuid" value="" type="hidden">
		<input   id = "courseid" value="" type="hidden">
    输入成绩<input    id = "grade" value="" type="text" >
		<button  id = "sender2" class="btn btn-sm btn-danger" data-dismiss="modal" aria-label="Close">提交</button>
		
<script type="text/javascript">



	$('#sender2').click(function(){
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
			success: function(res){
                console.log(res);
                        if (res.msg == "success") {
	                            swal('提示', "修改成功", 'success');
	                        } else {
	                            swal('提示', "修改失败", 'error');
	                        }
            },
            error: function(result) {
                console.log(result);
            }
		});
	});
	
	
	
</script>
		
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>

</script>


<div id="messageDiv"></div> 

<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script> 


    
<%--     action="${pageContext.request.contextPath}/studentCourse/updateGrade" method="post"      
 --%>
</body>
</html>