<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>top</title>
<link href="${pageContext.request.contextPath}/ui/headerfiles/buttons.css"  rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/ui/js/jquery-1.6.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	
	function init(){
		var username = document.getElementById("username").value;
		document.getElementById('user').innerHTML = username;
		tick();
	}
	
	function LoginOut(){
		if(confirm("��ȷ���˳�ϵͳ?")){
			var params = {};
			var url = "loginAction_LoginOut.do";
			$.post(
				 url, 
			     params, 
			     function(json){
			     	if(json){
			     		window.parent.location.reload();
			     	}
		      })
		}
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
		   " ������",
		   " ����һ",
		   " ���ڶ�",
		   " ������",
		   " ������",
		   " ������",
		   " ������");
		   theday = today.getFullYear()+"��" + [today.getMonth()+1]+"��" +today.getDate()+"��" + d[today.getDay()+1];
		   intHours = today.getHours();
		   intMinutes = today.getMinutes();
		   intSeconds = today.getSeconds();
		   if (intHours == 0) {
		   hours = "12:";
		   xfile = " ��ҹ ";
		   } else if (intHours < 12) {
		   hours = intHours+":";
		   xfile = " ���� ";
		   } else if (intHours == 12) {
		   hours = "12:";
		   xfile = " ���� ";
		   } else {
		   intHours = intHours - 12
		   hours = intHours + ":";
		   xfile = " ���� ";
		   }
		   timeString = theday+xfile+today.toLocaleTimeString();
		   time.innerHTML = timeString;
		   window.setTimeout("tick();", 100);
	}
</script>
	<body onload="init();">
	<s:hidden name="username" id="username" value="%{#username}"/>
		<div style="border-bottom: #3b3b3b 7px solid; background: #000000; background-repeat: repeat-x; background-position: top center;" id="header">
			<div class="wrapper2">
				<div id="header">
					<div style="height: 52px; float: left; width: 728px; padding-top: 8px;"></div>
					<div id="tabs">
						<div class="tabsheader" id="chromemenu" style="z-index: 999;">
							<ul>
								<!--<li>
									<a href="uploadFileAction_ImageView.do" style="color: #dedede;" target="downFrame">
									<img src="${pageContext.request.contextPath}/ui/headerfiles/home1.png" width="23" height="23" alt="Explore">
											&nbsp;��ҳ
									</a>
								</li>
								--><li>
									<a href="sysUserGroupAction_Check.do" style="color: #dedede;" target="downFrame">
									<img src="${pageContext.request.contextPath}/ui/headerfiles/group.png" width="20" height="20" alt="Explore">
											&nbsp;���Ź���
									</a>
								</li>
								<li>
									<a href="sysUserAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/user.png" width="20" height="20" alt="Forums">
											&nbsp;Ա������
									</a>
								</li>
								<li>
									<a href="courseAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/course.png" width="20" height="20" alt="Forums">
											&nbsp;�γ̹���
									</a>
								</li>
								<li>
									<a href="salaryAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/salary.png" width="23" height="23" alt="Forums">
											&nbsp;���ʹ���
									</a>
								</li>
								<li>
									<a href="uploadFileAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/uploadfile.png" width="23" height="23" alt="Forums">
											&nbsp;�ļ�����
									</a>
								</li>
								<li>
									<a href="sysLogAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/log.png" width="23" height="23" alt="Forums">
											&nbsp;��־����
									</a>
								</li>
								<li>
									<a href="sysRoleAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/role.png" width="23" height="23" alt="Forums">
											&nbsp;��ɫ����
									</a>
								</li>
								<li>
									<a href="operateAction_Check.do" style="color: #dedede;" target="downFrame"><img
											src="${pageContext.request.contextPath}/ui/headerfiles/operate.png" width="23" height="23" alt="Forums">
											&nbsp;Ȩ�޹���
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div id="logo" style="position: absolute; left: 5px; top : 3px; height: 28px; line-height: 28px; color: silver;">
						<img alt="" src="${pageContext.request.contextPath}/ui/images/log2.png">
					</div>
					<div id="time" style="position: absolute; right: 100px; top : 18px; height: 28px; line-height: 28px; color: yellow; font-style: italic;">
					</div>
					<div id="userinfo" style="position: absolute; right: 62px; height: 28px; line-height: 28px; color: #A7C94D; font-size: 16px; font-style: italic;">
					��ӭ&nbsp;[<font id="user" style="color: silver;"></font>]&nbsp;��½ 
					</div>
					<img src="${pageContext.request.contextPath}/ui/images/loginout1.png" title="�˳�" width="28" height="28" alt="Forums" onclick="LoginOut();" style="position: absolute; right: 12px; height: 28px; padding-top: 4px; cursor: pointer;">
					<br class="clearboth"/>
				</div>
			</div>
		</div>
	</body>
</html>