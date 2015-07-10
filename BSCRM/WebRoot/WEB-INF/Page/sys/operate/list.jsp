<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>权限管理</title>
		<%@include file="/ui/common.jsp"%>
		<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">

			$().ready(function(){
				$("#form1").validationEngine();
			});
		
			function addPage() {
				window.location = "${pageContext.request.contextPath}/operateAction_AddUI.do";
			}
			
			function search() {
				$("#form1").action = "${pageContext.request.contextPath}/operateAction_Check.do";
				var validate = $("#form1").validationEngine('validate');
				if (validate) {
					$("#form1").submit();
				}
			}
			
			function drops() {
				var len=$("input[type='checkbox'][name='ids']:checked").length;
		        if(len<1){
		          alert("您至少选择一个!!!");
		          return false;
		        }
				$("#form2").submit();
			}
			
			function clean() {
				$("#operateName").val("");
				$("#operateUrl").val("");
				$("#operateName").focus();
			}
			
			function changeCheckCount() {
				var count = 0;
				$("input[type='checkbox'][name='ids']").each(function(index, data) {
					if (this.checked) {
						count++;
					}
				});
			
				if (count == $("input[type='checkbox'][name='ids']").length) {
					$("#checkall").attr("checked", "checked");
				} else {
					$("#checkall").attr("checked", null);
				}
			}
			
			function checkAll() {
				if ($("#checkall")[0].checked) {
					$("input[type='checkbox'][name='ids']").attr("checked", "checked");
				} else {
					$("input[type='checkbox'][name='ids']").attr("checked", null);
				}
			}
		</script>
	</head>

	<body>
		<div class="mtitle">
			<div class="mtitle-row">
				&nbsp;
			</div>
			<span class="menu_selected">权限管理</span>
		</div>
		<br>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tabForm">
			<tr>
				<th class="th_head">
					<div id="menuArrow1"
						style="background:url(${pageContext.request.contextPath}/ui/images/down.gif) no-repeat center;float:left;">
						&nbsp;
					</div>
					<div id="menuTitle1" style="font-weight: bold">
						搜索权限
					</div>
				</th>
				<th class="th_head">
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<s:form id="form1" name="form1" method="post" action="operateAction_Check.do">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							name="base" id="base">
							<tr>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;权限名称：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="operateName" name="operateName" cssStyle="width:100px;" cssClass="validate[maxSize[50]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;权限URL：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="operateUrl" name="operateUrl" cssStyle="width:100px;" cssClass="validate[maxSize[50]]"/>
								</td>
								<td width="25%" align="center">
									<div class="control">
										<button type='button' class='button'
											onMouseOver="this.className='button_over';"
											onMouseOut="this.className='button';" onClick="search();">
											<img
												src="${pageContext.request.contextPath}/ui/images/button/sousuo.png"
												border='0' align='absmiddle'>
											&nbsp;搜索
										</button>
										<button type='button' class='button'
											onMouseOver="this.className='button_over';"
											onMouseOut="this.className='button';"
											onClick="clean();">
											<img
												src="${pageContext.request.contextPath}/ui/images/button/qingkong.png"
												border='0' align='absmiddle'>
											&nbsp;清空
										</button>
									</div>
								</td>
							</tr>
						</table>
					</s:form>
				</td>
			</tr>
		</table>
		<br>
		<h3>
			<img src="${pageContext.request.contextPath}/ui/images/menu/khlb.png"
				border="0">
			&nbsp;权限列表
		</h3>
		<div class="control">
			<button type='button' class='button'
				onMouseOver="this.className='button_over';"
				onMouseOut="this.className='button';"
				onClick="addPage();">
				<img
					src="${pageContext.request.contextPath}/ui/images/button/xinjian.png"
					border='0' align='absmiddle'>
				&nbsp;新建
			</button>
			<button type='button' class='button'
				onMouseOver="this.className='button_over';"
				onMouseOut="this.className='button';" onClick="drops()">
				<img
					src="${pageContext.request.contextPath}/ui/images/button/shanchu.png"
					border='0' align='absmiddle'>
				&nbsp;删除
			</button>
		</div>
		<!-- list -->
		<div class="border">
			<s:form id="form2" name="form2" method="post" action="operateAction_Delete.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="PowerTable" class="PowerTable">
					<!-- title -->
					<tr>
				    	<td width="6%" class="listViewThS1">
				   	    <input type="checkbox" id="checkall" name="checkall" value="" class="checkbox" onClick="checkAll()"></td>
				  	    <td width="10%" class="listViewThS1">权限名称</td>
				        <td width="50%" class="listViewThS1">权限URL</td>
					</tr>

					<s:iterator value="%{operateList}" var="course">
						<tr onmouseover="this.style.backgroundColor = '#99DD00'" style="CURSOR: hand" onmouseout="this.style.backgroundColor = ''" bgcolor="#FFFFFF">
							<td>
								<s:checkbox name="ids" id="ids" cssClass="checkbox"
									fieldValue="%{operateId}" onclick="changeCheckCount()" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/operateAction_EditUI.do?operateId=<s:property value="%{operateId}"/>">
									<font style="color: red;"><s:property value="%{operateName}" /></font></a>
							</td>
							<td><s:property value="%{operateUrl}" /></td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</body>
</html>