<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程添加</title>
<%@include file="/ui/common.jsp" %>
<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
	<script language="javascript">
		
		$().ready(function(){
			$("#form1").validationEngine();
		});
		
		function AddCourse(){
			var className = $("#className").val();
			var price = $("#price").val();
			var target = $("#target").val();
			var textbook = $("#textbook").val();
			var amount = $("#amount").val();
			var curNumber = $("#curNumber").val();
			var status = $('input:radio[name="status"]:checked').val();
			var validate = $("#form1").validationEngine('validate');
			if(validate){
				var params = {
					 className : className,
					 price : price,
					 target : target,
					 textbook : textbook,
					 amount : amount,
					 curNumber : curNumber,
					 status : status
				};
				var url = "courseAction_Save.do";
				$.post(  
						 url, 
					     params, 
					     function(json){
							if(json == "true"){
								alert("添加成功!");
								window.location = "courseAction_Check.do";
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
<s:form id="form1" name="form1" method="post" action="courseAction_Save.do" >
<div class="mtitle">
	<div class="mtitle-row">&nbsp;</div>
	课程-添加
</div>
<br>
<div class="control">
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="AddCourse();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/baocun.png" border='0' 
	             align='absmiddle'>&nbsp;保存</button>
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="Back();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' 
	             align='absmiddle'>&nbsp;返回</button>
</div>
<br/>
<table width="100%" border="0" cellspacing="0" class="tabForm">
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
				<td class="red">课程名称：</td>
				<td>
					<s:textfield id="className" name="className" cssStyle="width:90%" cssClass="validate[required,maxSize[20]]"/>
				</td>
				<td class="red">课程价格：</td>
				<td>
					<s:textfield id="price" name="price" cssStyle="width:90%" cssClass="validate[custom[integer]]"/>
				</td>
			</tr>
			<tr>
				<td class="red">招生对象：</td>
				<td colspan="3">
					<s:textarea id="target" name="target" rows="4" cssStyle="width:96%" cssClass="validate[maxSize[500]]"/>
				</td>
			</tr>
			<tr>
				<td>培训教材：</td>
				<td colspan="3">
					<s:textarea id="textbook" name="textbook" rows="4" cssStyle="width:96%" cssClass="validate[maxSize[200]]"/>
				</td>
			</tr>
			<tr>
				<td>招生人数：</td>
				<td>
					<s:textfield id="amount" name="amount" cssStyle="width:90%" cssClass="validate[custom[integer]]"/>
				</td>
				<td>报名人数：</td>
				<td>
					<s:textfield id="curNumber" name="curNumber" cssStyle="width:90%" cssClass="validate[custom[integer]]"/>
				</td>
			</tr>
			<tr>
				<td>班级状态：</td>
				<td>
				 <img src="${pageContext.request.contextPath}/ui/images/hot.png" width="25" height="27" border="0"> <INPUT TYPE="radio" NAME="status" ID="status" value="0" title="火热报名中...">
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <img src="${pageContext.request.contextPath}/ui/images/lock.png" width="25" height="27" border="0"> <INPUT TYPE="radio" NAME="status" ID="status" value="1" title="已经开班!!!">
				</td>
			</tr>
  		</table>
		</div>
	</td>
  </tr>
</table>
</s:form>
</body>
</html>