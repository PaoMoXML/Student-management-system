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




<button id = "reSet" type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalTable">
  修改密码
</button>
<div id="modalTable" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal table</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
			<form>
			旧密码<input type="password" name="passwordo" id="oldPassword"value="" class = "form-control"/>
			新密码<input type="password" name="password1" id="password1" value="" class = "form-control"/>
			重复新密码<input type="password" name="password2" id="password2"value="" class = "form-control">
			<input type="hidden"name="password">
			<input type="hidden" name="stuid" id="stuid" value="" />
			<input type="hidden" name="roleid" id="roleid" value="" />
			<input type="hidden" name="id" id="id" value="" />
			<span id="tishi" ></span>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"id = "change" >修改</button>
      </div>
    </div>
  </div>
</div>






<script type="text/javascript">
	$('#change').click(function(){
		var pwdold = document.getElementById("oldPassword").value;
		var stuidc = "${sessionScope.teacher.stuid}"; 
		var roleidc = "${sessionScope.teacher.roleid}"; 
		var url1 = "${pageContext.request.contextPath}/student/changePassword";
		var checked = {"stuid":stuidc,"password":pwdold,"roleid":roleidc};
		var jsonData1 = JSON.stringify(checked);
		$.ajax({
			async : false,
			type:"post",
			url:url1,
			data:jsonData1,
			dataType:"json",
            contentType : "application/json;charset=UTF-8",
            success:function(res){
            	console.log(res)
            	if(res.key=="error"){
            		alert("旧密码输入错误");
            	};
            	if(res.key=="success"){
            		var pwd1 = document.getElementById("password1").value;
            		var pwd2 = document.getElementById("password2").value;
            		console.log("pwd1",pwd1);
            		console.log("pwd2",pwd2);
            		if(pwd1 == pwd2){
            			console.log("两次密码相同");
                			var url2 = "${pageContext.request.contextPath}/student/reSetPassword2";
                			var stuid23 = "${sessionScope.teacher.stuid}"; 
                			var password23 = document.getElementById('password1').value; 
                			var changes = {"stuid":stuid23,"password":password23};
                			var jsonData100 = JSON.stringify(changes);
                			console.log(stuid23);
                			console.log(password23);
                			$.ajax({
                				async : false,
                				type:"post",
                				url:url2,
                				data:jsonData100,
                				dataType:"json",
                	            contentType : "application/json;charset=UTF-8",
                	            success: function(result){
                	            	alert("密码修改成功");
                	                   console.log(result);
                	               },
                	               error: function(result) {
                	                   console.log(result);
                	               },
                			});
            		}else{
            			alert("两次密码不相同");
            		};

            	}else{
            		console.log("出错")
            	}
            },
            error:function(res){
            	console.log(res)
            },
		});

	});
</script>


</body>
</html>