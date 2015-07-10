<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=UTF-8">

		<title>出错了!</title>
		<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 18px;
}

.style4 {
	font-size: 12px
}

a:link {
	color: #FF0000;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}

.style5 {
	font-size: 50px;
	color: #FF0000
}
-->
</style>
<script type="text/javascript">
	function Back(){
			history.back();
	}
</script>
	</head>
	<body bgcolor="000000" text="#CCCCFF" vlink="#CCCCFF" alink="#CCCCFF">
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tbody>
				<tr>
					<td width="100%" height="100%" valign="middle" align="center">
						<p>
							<img src="${pageContext.request.contextPath}/ui/images/success.png" title="点我返回!" width="150" height="150" border="0" onclick="Back();">
						</p>
						<p class="style1">
							<span class="style5">Upload Success!!!</span>
							<br>
						</p>

					</td>
				</tr>
			</tbody>
		</table>

	</body>
</html>