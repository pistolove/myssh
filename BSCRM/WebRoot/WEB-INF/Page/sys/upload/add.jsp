<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>文件上传</title>
	<%@include file="/ui/common.jsp" %>
	<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
	<script language="javascript" type="text/ecmascript">

	function uploadFiles(){
		var file = document.getElementById("uploadImages").value;
		if(file==""){
			alert("请先选择要上传文件!");
			return;
		}
		document.form1.submit();
	}

	function createInput(parentID, inputFileID) {
		var parent = $(parentID);//获取父元素

		var div = document.createElement("div");//创建一个div容器用于包含input file
		var x = parseInt(Math.random() * (80 - 1)) + 1;
		var divName = inputFileID + x.toString();//随机div容器的名称
		div.name = divName;
		div.id = divName;

		var aElement = document.createElement("input"); //创建input
		aElement.name = inputFileID;
		aElement.id = inputFileID;
		aElement.type = "file";//设置类型为file

		var delBtn = document.createElement("input");//再创建一个用于删除input file的Button
		delBtn.type = "button";
		delBtn.value = "删除";
		delBtn.onclick = function() {
			removeInput(parentID, divName)
		};//为button设置onclick方法

		div.appendChild(aElement);//将input file加入div容器
		div.appendChild(delBtn);//将删除按钮加入div容器
		parent.appendChild(div);//将div容器加入父元素
	}

	function removeInput(parentID, DelDivID) {
		var parent = $(parentID);
		parent.removeChild($(DelDivID));
	}

	function $(v) {
		return document.getElementById(v);
	}

	function Back(){
			history.back();
	}
</script>
<body>
<div class="mtitle">
	<div class="mtitle-row">&nbsp;</div>
	文件上传
</div>
<br>
<div class="control">
	&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="Back();"> <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' align='absmiddle'>&nbsp;返回</button>
</div>
<table width="100%" border="0" cellspacing="0" class="tabForm">
  <tr>
    <th colspan="4" align="left" class="th_head">
		<div id="menuArrow1" style="background:url(${pageContext.request.contextPath}/ui/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
		<div id="menuTitle1" style="font-weight:bold">上传文件信息</div>
	</th>
  </tr>
	<table>
		<tr>
		  	<td>
		    	<s:form action="uploadFileAction_SaveFiles.do" name="form1" id="form1" method="post"  enctype="multipart/form-data" >
					<div id="menu1">
							<input type="file" name="uploadImages"  id="uploadImages">
					</div>
			    </s:form>
		     <button type='button' onClick="uploadFiles();"> <img src="${pageContext.request.contextPath}/ui/images/upload1.png" height="30" width="118"></button>
		     <button type='button' onClick="createInput('menu1','uploadImages')"><img src="${pageContext.request.contextPath}/ui/images/addcontinue1.png"></button>
			</td>
	  </tr>
  	</table>
  </table>
	</body>
</html>