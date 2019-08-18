<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生登录</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/signin.css" />

<body>

<div class = "container">
<form method="get" action="${pageContext.request.contextPath}/student/Login" class ="form-signin">
<h2 class = "form-signin-heading">登录界面</h2>
<label for="inputstu" class="sr-only">STUID</label>
学号<input type="text" name = "stuid" placeholder="输入学号" class = "form-control" required=""><br>
<label for="inputPassword" class="sr-only">Password</label>
密码<input type="password" name = "password" placeholder="输入密码" class = "form-control" required=""><br>
<input type="radio" name = "roleid" value="0" checked>管理员
<input type="radio" name = "roleid" value="1">学生
<input type="radio" name = "roleid" value="2">教师
<div class="form-group">
      	<input type="text" class="form-control" id="inputPassword3" name="ucheckC" placeholder="请输入验证码">
   		 <div class="col-sm-3">
     	 <img id="checkCodeImg" src="${pageContext.request.contextPath}/CheckCode/CheckCode" οnclick="checkCode(this)"/>
   		 </div>
</div>
<input type="submit" value="登录" class = "btn btn-lg btn-primary btn-block">
</form>



<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript">
  
   function checkCode(obj) {
       /*?后面是GET请求数据*/
//怎么点击图片就刷新验证码，不能刷新页面，否则用户名与密码刷掉了
  //如何保证页面不刷新，图片重新加载访问servlet就可以切换验证码？
  //浏览器对于img标签，如果src的路径不变不会重新请求servlet资源，所以必须改变src的路径

      obj.src="${pageContext.request.contextPath}/CheckCode/CheckCode?"+new Date().getTime();
           $(function () {
               $("#tou").load('guide.html');
           });
       }

  </script>






<form action="${pageContext.request.contextPath}/student/registered" onsubmit="return validate()" class ="form-signin">

学号<input type = "text" name = "stuid" placeholder="学号" class = "form-control" required=""><br>
密码<input type = "password" name = "password"  id = "pwd1" placeholder="密码" class = "form-control" required=""><br>
密码<input type = "password" id = "pwd2" placeholder="重复密码" class = "form-control" required=""><span id="tishi" ></span><br>

<input type= "radio" name = "roleid" value="1" checked>学生<br>
<input type= "radio" name = "roleid" value="2">教师<br>
<button type = "submit" id = "btn" class = "btn btn-lg btn-primary btn-block">注册</button>

</form>
</div>

<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript">
function validate(){
	var pwd1 = document.getElementById("pwd1").value;
	var pwd2 = document.getElementById("pwd2").value;
	if(pwd1 == pwd2){
		document.getElementById("tishi").innerHTML="<font color='green'>两次密码相同</font>";
		return true;
	}else{
		document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
		return false;
	}
}
</script>


</body>
</html>