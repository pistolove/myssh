<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>部门人员设置</title>
<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/ui/js/listbox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ui/js/global.js" type="text/javascript"></script>
<script>
	function check() {
		var users = dumpSelect("right");
		var unusers = dumpSelect("left");
		document.ActionForm.unusers.value = unusers;
		if(users == "") {
			alert("请至少选择一个人员!");
			return false;
		}else{
			document.ActionForm.users.value = users;
			return true;
		}
	}

	function Back(){
		history.back();
	}
</script>
</head>

<body>
<form name="ActionForm" method="post" action="sysUserGroupAction_SaveGroupUser.do" onSubmit="return check();">
<s:hidden id="groupId" name="groupId"/>
<input type="hidden" name="users" value="">
<input type="hidden" name="unusers" value="">
<div class="mtitle">
	<div class="mtitle-row">&nbsp;</div>
	部门人员设置
</div>
<br>
<div class="control">
	<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="if(check()) document.ActionForm.submit();"><img src="${pageContext.request.contextPath}/ui/images/button/baocun.png" border='0' align='absmiddle'>&nbsp;保存</button>
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="Back();"> <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' align='absmiddle'>&nbsp;返回</button>
</div>
<table width="100%" border="0" cellspacing="0" class="tabForm">
  <tr>
    <th colspan="4" align="left" class="th_head">
		<div id="menuArrow1" style="background:url(${pageContext.request.contextPath}/ui/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
		<div id="menuTitle1" style="font-weight:bold">基本信息</div>
	</th>
  </tr>
  <tr>
  	<td>
		<div id="menu1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="37%">所有用户</td>
				<td width="22%">&nbsp;</td>
				<td width="41%">当前部门中的用户</td>
			</tr>
			<tr>
				<td>
					<s:select list="%{leftList}" id="lslt" name="lselect" size="1" multiple="true"
										listKey="userId" listValue="name" cssStyle="width:90%;height:250px" ondblclick="moveRight();" />
					</td>
				<td align="center">
					<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="moveRight()"><img src="${pageContext.request.contextPath}/ui/images/button/youyi.png" border='0' align='absmiddle'>&nbsp;单个右移</button><br/><br/>
					<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="moveLeft()"><img src="${pageContext.request.contextPath}/ui/images/button/zuoyi.png" border='0' align='absmiddle'>&nbsp;单个左移</button><br/><br/>
					<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="moveAllRight()"><img src="${pageContext.request.contextPath}/ui/images/button/quanbuyy.png" border='0' align='absmiddle'>&nbsp;全部右移</button><br/><br/>
					<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="moveAllLeft()"><img src="${pageContext.request.contextPath}/ui/images/button/quanbuzy.png" border='0' align='absmiddle'>&nbsp;全部左移</button>
				</td>
				<td>
					<s:select list="%{rightList}" id="rslt" name="rselect" size="1" multiple="true"
										listKey="userId" listValue="name" cssStyle="width:90%;height:250px" ondblclick="moveLeft();"/>
				</td>
			</tr>
  		</table>
		</div>
	</td>
  </tr>
</table>

</form>
</body>
</html>