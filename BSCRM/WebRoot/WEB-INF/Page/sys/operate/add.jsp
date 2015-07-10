<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>功能新建</title>
<%@include file="/ui/common.jsp" %>
<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
<script language="javascript">
	var editor;
	
	$().ready(function(){
		$("#form1").validationEngine();
	});

	//所有的需要验证的表单form和文本框都需要id属性
	function AddOperate() {
		/*
		private String operateId;
		private String operateName;
		private String operateUrl;
		*/
		var operateName = $("#operateName").val();
		var operateUrl = $("#operateUrl").val();
		var validate = $("#form1").validationEngine('validate');
		if(validate){
			var params = {"operateName":operateName,"operateUrl":operateUrl};
			var url = "operateAction_Save.do";
			$.post(  
					 url, 
				     params, 
				     function(json){
						if(json == "true"){
							alert("添加成功!");
							window.location = "operateAction_Check.do";
						}else{
							alert("添加失败!");
						}
			         })
		}
	}
	
	function Back(){
		history.back();
	}
</script>
</head>
<body>
<s:form id="form1" name="form1"  method="post" action="operateAction_Save.do">
<div class="mtitle">
	<div class="mtitle-row">&nbsp;</div>
	功能-新建
</div>
<br>
<div class="control">
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="AddOperate()">
	        <img src="${pageContext.request.contextPath}/ui/images/button/baocun.png" border='0' 
	             align='absmiddle'>&nbsp;保存</button>
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="Back()">
	        <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' 
	             align='absmiddle'>&nbsp;返回</button>
</div>
<br/>
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
				<td width="16%"></td>
				<td width="34%"></td>
				<td width="16%"></td>
				<td width="34%"></td>
			</tr>			
			<tr>
				<td class="red">功能名称</td>
				<td><s:textfield id="operateName" name="operateName" cssStyle="width:90%" cssClass="validate[required,maxSize[100]]"/></td>
			</tr>
			<tr>
				<td>功能URL</td>
				<td colspan="3"><s:textfield id="operateUrl" name="operateUrl" cssStyle="width:36%;" cssClass="validate[required,maxSize[100]]"/></td>
			</tr>
  		</table>
		</div>
	</td>
  </tr>
</table>
<br>
</s:form>
</body>
</html>