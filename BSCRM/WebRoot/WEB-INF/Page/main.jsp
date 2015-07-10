<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>传智播客企业管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script type="text/javascript">

		function init(){
			window.location.reload();
		}
	</script>

<frameset rows="92,*" cols="*">
  <frame src="${pageContext.request.contextPath}/loginAction_MenuTop.do" name="topFrame"  id="topFrame"  scrolling="NO" 
                noresize="noresize" frameborder="0" >
  
    <frame src="${pageContext.request.contextPath}/loginAction_MenuDown.do"  name="downFrame"  id="downFrame" 
                  scrolling="auto""   frameborder="0" framespacing="1px" bordercolor="#4faad8">
    <frame src="" name="rightFrame" id="rightFrame">
</frameset>
<body onload="init();">
</body>
</html>