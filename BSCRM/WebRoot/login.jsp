<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
	<title>传智播客企业管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="ui/images/login/login.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/ui/js/Cookies.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/ui/js/login.js"></script> 
	<%@include file="/ui/common.jsp" %>
	<script type="text/javascript">
	
		$().ready(function(){
			$("#loginform").validationEngine();
			tick();
		});
		
		function login(){
			var username = $("#username").val();
			var password = $("#password").val();
			var captcha = $("#captcha").val();
			var remember = document.getElementById("remember").checked;
			var validate = $("#loginform").validationEngine('validate');
			if(validate){
					var params = {"username":username,"password":password,"captcha":captcha,"remember":remember};
					var url = "loginAction_Login.do";
					$.post(  
						 url, 
					     params, 
					     function(json){
							if(json == "ERRYZM"){
								alert("验证码错误!");
							}else if(json == "WRONGUSER"){
								alert("用户名或密码错误!");
							}else{
								window.location = "loginAction_MenuMain.do"
							}
					 })
			}
		}
		
		function changeImage(){
			    var changeimg=document.getElementById("changeimg");
   				changeimg.src="${pageContext.request.contextPath}/loginAction_ChangeImg.do?timeStamp="+new Date().getTime();
		}
		
		function enterKey(){
			var ev=window.event.keyCode;
			if(ev == 13){login();}
		}
		
		function tick() {
		   var hours, minutes, seconds, xfile;
		   var intHours, intMinutes, intSeconds;
		   var today, theday;
		   today = new Date();
		   function initArray(){
		   this.length=initArray.arguments.length
		   for(var i=0;i<this.length;i++)
		   this[i+1]=initArray.arguments[i] }
		   var d=new initArray(
		   " 星期日",
		   " 星期一",
		   " 星期二",
		   " 星期三",
		   " 星期四",
		   " 星期五",
		   " 星期六");
		   theday = today.getFullYear()+"年" + [today.getMonth()+1]+"月" +today.getDate()+"日" + d[today.getDay()+1];
		   intHours = today.getHours();
		   intMinutes = today.getMinutes();
		   intSeconds = today.getSeconds();
		   if (intHours == 0) {
		   hours = "12:";
		   xfile = " 午夜 ";
		   } else if (intHours < 12) {
		   hours = intHours+":";
		   xfile = " 上午 ";
		   } else if (intHours == 12) {
		   hours = "12:";
		   xfile = " 正午 ";
		   } else {
		   intHours = intHours - 12
		   hours = intHours + ":";
		   xfile = " 下午 ";
		   }
		   timeString = theday+xfile+today.toLocaleTimeString();
		   time.innerHTML = timeString;
		   window.setTimeout("tick();", 100);
	}
	</script>
	</head>
	<body class="body" onload="init();">
		<div id="time" style="position: absolute; right: 100px; top : 18px; height: 28px; line-height: 28px; color: yellow; font-style: italic"></div>
		<form action="" id="loginform" name="loginform">
			<div class="myform">
				<s:textfield id="username" name="username" onkeypress="enterKey();" cssStyle="width: 180px; height: 23px; color: #EE4000; font-weight:bold; font-size: large;" cssClass="validate[required,maxSize[20]]"/>
			  	<br>
				<br>
				<s:password id="password" name="password" onkeypress="enterKey();" cssStyle="width: 180px; height: 23px; color: #EE4000; font-weight:bold; font-size: large;" cssClass="validate[required,maxSize[50]]"/>
				<br>
				<div style="width: 380px; height: 12px;"></div>
				<table>
					  <tr>
					  <th align="left"> <s:textfield id="captcha" name="captcha" onkeypress="enterKey();" cssStyle="width: 90px; height: 23px; color: #EE4000; font-weight:bold; font-size: large;" cssClass="validate[required]"/>&nbsp;&nbsp;</th>
					  <th align="right"><img id="changeimg" alt="" src="${pageContext.request.contextPath}/loginAction_ChangeImg.do" title="点击换一张" style="cursor:pointer;height: 23px;width: 65px"  onclick="changeImage()"></th>
					 </tr>
				</table>
				<br>
				<s:checkbox id="remember" name="remember" title="记住我?" />
			</div>
			<div class="login_button">
				<input type="button" name="queding" class="queding" onClick="login();" />
			</div>
		</form>
		<div id="logo" style="position: absolute; left: 80px; top : 90px; height: 28px; line-height: 28px; color: silver;">
			<img alt="" src="${pageContext.request.contextPath}/ui/images/biglog.png">
		</div>
	</body>
	<div id="bottom" style="position: absolute; left: 480px; top : 600px; height: 28px; line-height: 28px; color: yellow; font-style: oblique;">北京传智播客科技有限公司 CopyRight@2006-2012</div>
</html>