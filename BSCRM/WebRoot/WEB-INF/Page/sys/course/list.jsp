<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>课程管理</title>
		<%@include file="/ui/common.jsp"%>
		<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">

			$().ready(function(){
				$("#form1").validationEngine();
			});
		
			function addPage() {
				window.location = "${pageContext.request.contextPath}/courseAction_AddUI.do";
			}
			
			function search() {
				$("#form1").action = "${pageContext.request.contextPath}/courseAction_Check.do";
				var validate = $("#form1").validationEngine('validate');
				if (validate) {
					$("#form1").submit();
				}
			}
			
			function drops() {
				$("#form2").submit();
			}
			
			function deleteIds() {
				document.getElementById("methodId").value = "delete";
				document.forms[1].submit();
			}
			
			function enable() {
				document.getElementById("methodId").value = "enable";
				document.forms[1].submit();
			}
			
			function disable() {
				document.getElementById("methodId").value = "disable";
				document.forms[1].submit();
			}
			
			function clean() {
				$("#className").val("");
				$("#target").val("");
				$("#status").removeAttr("checked");
				$("#className").focus();
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
			<span class="menu_selected">课程管理</span>
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
						课程搜索
					</div>
				</th>
				<th class="th_head">
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<s:form id="form1" name="form1" method="post" action="courseAction_Check.do">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							name="base" id="base">
							<tr>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课程名称：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="className" name="className" cssStyle="width:100px;" cssClass="validate[maxSize[50]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;招生对象：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="target" name="target" cssStyle="width:100px;" cssClass="validate[maxSize[500]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：
								</td>
								<td width="10%" nowrap="nowrap">
									<img src="${pageContext.request.contextPath}/ui/images/hot.png" width="25" height="27" border="0"> <INPUT TYPE="radio" NAME="status" ID="status" value="0" title="火热报名中..." <s:if test="status==0">checked="checked"</s:if>>
				 					<img src="${pageContext.request.contextPath}/ui/images/lock.png" width="25" height="27" border="0"> <INPUT TYPE="radio" NAME="status" ID="status" value="1" title="已经开班!!!" <s:if test="status==1">checked="checked"</s:if>>
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
			&nbsp;课程列表
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
			<s:form id="form2" name="form2" method="post" action="courseAction_Delete.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="PowerTable" class="PowerTable">
					<!-- title -->
					<tr>
						<td width="4%" class="listViewThS1">
							<input type="checkbox" id="checkall" name="checkall" value=""
								class="checkbox" onClick="checkAll()">
						</td>
						<td width="15%" class="listViewThS1">
							课程名称
						</td>
						<td width="10%" class="listViewThS1">
							价格
						</td>
						<td width="15%" class="listViewThS1">
							招生对象
						</td>
						<td width="20%" class="listViewThS1">
							培训教材
						</td>
						<td width="10%" class="listViewThS1">
							招生数量
						</td>
						<td width="10%" class="listViewThS1">
							报名人数
						</td>
						<td width="10%" class="listViewThS1">
							状态
						</td>
					</tr>

					<s:iterator value="%{courseList}" var="course">
						<tr onmouseover="this.style.backgroundColor = '#99DD00'" style="CURSOR: hand" onmouseout="this.style.backgroundColor = ''" bgcolor="#FFFFFF">
							<td>
								<s:checkbox name="ids" id="ids" cssClass="checkbox"
									fieldValue="%{courseId}" onclick="changeCheckCount()" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/courseAction_EditUI.do?courseId=<s:property value="%{courseId}"/>">
									<font style="color: red;"><s:property value="%{className}" /></font></a>
							</td>
							<td>
								<s:property value="%{price}" />
							</td>
							<td>
								<s:property value="%{target}" />
							</td>
							<td>
								<s:property value="%{textbook}" />
							</td>
							<td>
								<s:property value="%{amount}" />
							</td>
							<td>
								<s:property value="%{curNumber}" />
							</td>
							<td>
							   <s:if test="#course.status==0 ">
							        <img src="${pageContext.request.contextPath}/ui/images/hot.png" width="15" height="15" border="0"> 
							   </s:if>
							   <s:else>
					 				<img src="${pageContext.request.contextPath}/ui/images/lock.png" width="15" height="15" border="0"> 
							   </s:else>
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</body>
</html>