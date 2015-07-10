<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>部门设置</title>
		<%@include file="/ui/common.jsp"%>
		<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			$().ready(function(){
					$("#form1").validationEngine();
				});
			function addPage() {
				window.location = "${pageContext.request.contextPath}/sysUserGroupAction_AddUI.do";
			}
			
			function drops() {
				var len=$("input[type='checkbox'][name='ids']:checked").length;
		        if(len<1){
		          alert("您至少选择一个!!!");
		          return false;
		        }
				$("#form2").submit();
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
					$("#slt_ids_count2").empty();
					$("#slt_ids_count2").append($("input[type='checkbox'][name='ids']").length);
				} else {
					$("input[type='checkbox'][name='ids']").attr("checked", null);
					$("#slt_ids_count2").empty();
					$("#slt_ids_count2").append(0);
				}
			}
			
			function search() {
				$("#form1").action = "${pageContext.request.contextPath}/sysUserGroupAction_Check.do";
				var validate = $("#form1").validationEngine('validate');
				if (validate) {
					$("#form1").submit();
				}
			}
			
			function clean() {
				document.getElementById("name").value = "";
				document.getElementById("principal").value = "";
				document.getElementById("name").focus();
			}
		</script>
	</head>
	<body>
		<div class="mtitle">
			<div class="mtitle-row">
				&nbsp;
			</div>
			<span class="menu_selected">部门设置</span>
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
						部门搜索
					</div>
				</th>
				<th class="th_head">
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<s:form id="form1" name="form1" method="post" action="">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							name="base" id="base">
							<tr>
								<br />
								<td width="25%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：
									<s:textfield id="name" name="name" cssStyle="width:140px"
										cssClass="validate[maxSize[20]]" />
								</td>
								<td width="25%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门负责人：
									<s:textfield id="principal" name="principal"
										cssStyle="width:140px" cssClass="validate[maxSize[20]]" />
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;
								</td>
								<td width="40%" align="center">
									<div class="control">
										<button type='button' class='button'
											onMouseOver="this.className='button_over';"
											onMouseOut="this.className='button';" onClick="search()">
											<img
												src="${pageContext.request.contextPath}/ui/images/button/sousuo.png"
												border='0' align='absmiddle'>
											&nbsp;搜索
										</button>
										<button type='button' class='button'
											onMouseOver="this.className='button_over';"
											onMouseOut="this.className='button';" onClick="clean()">
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
			&nbsp;部门列表
		</h3>
		<div class="control">
			<button type='button' class='button'
				onMouseOver="this.className='button_over';"
				onMouseOut="this.className='button';" onClick="addPage();">
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
			<s:form id="form2" name="form2" method="post"
				action="sysUserGroupAction_Delete.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="PowerTable" class="PowerTable">
					<!-- title -->
					<tr>
						<td width="5%" class="listViewThS1">
							<input type="checkbox" id="checkall" name="checkall" value=""
								class="checkbox" onClick="checkAll()">
						</td>
						<td width="20%" class="listViewThS1">
							部门名称
						</td>
						<td width="15%" class="listViewThS1">
							部门负责人
						</td>
						<td width="35%" class="listViewThS1">
							部门职能
						</td>
						<td width="25%" class="listViewThS1">
							人员设置
						</td>
					</tr>

					<s:iterator value="%{groupList}">
						<tr onmouseover="this.style.backgroundColor = '#99DD00'" style="CURSOR: hand" onmouseout="this.style.backgroundColor = ''" bgcolor="#FFFFFF">
							<td>
								<s:checkbox name="ids" id="ids" cssClass="checkbox"
									fieldValue="%{groupId}" onclick="changeCheckCount()" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/sysUserGroupAction_EditUI.do?groupId=<s:property value="%{groupId}"/>" >
										<font style="color: red;"><s:property value="%{name}" /></font> </a>
							</td>
							<td>
								<s:property value="%{principal}" />
							</td>
							<td>
								<s:property value="%{incumbent}" />
							</td>
							<td class="red">
								<a href="${pageContext.request.contextPath}/sysUserGroupAction_CheckGroupUser.do?groupId=<s:property value="%{groupId}"/>">设置</a>
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</body>
</html>