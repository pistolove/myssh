<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>部门新建</title>
<%@include file="/ui/common.jsp" %>
<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
<script language="javascript">
	var editor;
	
	$().ready(function(){
		$("#form1").validationEngine();
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="remark"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});
		});
	});

	//所有的需要验证的表单form和文本框都需要id属性
	function AddUserGroup() {
		var groupId = $("#groupId").val();
		var name = $("#name").val();
		var principal = $("#principal").val();
		var incumbent = $("#incumbent").val();
		var remark = editor.html();
		var validate = $("#form1").validationEngine('validate');
		if(validate){
			var params = {"groupId":groupId,"name":name,"principal":principal,"incumbent":incumbent,"remark":remark};
			var url = "sysUserGroupAction_Save.do";
			$.post(  
					 url, 
				     params, 
				     function(json){
						if(json == "true"){
							alert("添加成功!");
							window.location = "sysUserGroupAction_Check.do";
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
<s:form id="form1" name="form1"  method="post" action="/sysUserGroupAction_Save.do">
<div class="mtitle">
	<div class="mtitle-row">&nbsp;</div>
	部门-新建
</div>
<br>
<div class="control">
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="AddUserGroup()">
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
				<td class="red">部门名称</td>
				<td><s:textfield id="name" name="name" cssStyle="width:90%" cssClass="validate[required,maxSize[100]]"/></td>
		
				<td>部门负责人</td>
				<td><s:textfield id="principal" name="principal" cssStyle="width:90%" cssClass="validate[required,maxSize[50]]"/></td>
			
			</tr>
			<tr>
				<td height="40" valign="top">部门职能</td>
				<td colspan="3"><s:textarea id="incumbent" name="incumbent" rows="3" cssStyle="width:96%" cssClass="validate[maxSize[200]]"/></td>
			</tr>
			<tr>
				<td height="40" valign="top">备注</td>
				<td colspan="3"><s:textarea id="remark" name="remark" rows="3" cssStyle="width:96%;height:100px;visibility:hidden;"/></td>
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