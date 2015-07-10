<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>人事管理</title>
		<%@include file="/ui/common.jsp"%>
		<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">

			$().ready(function(){
				$("#form1").validationEngine();
			});
		
			function addPage() {
				window.location = "${pageContext.request.contextPath}/sysUserAction_AddUI.do";
			}
			
			function search() {
				$("#form1").action = "${pageContext.request.contextPath}/sysUserAction_Check.do";
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
			
			function exportData(){
					var params = {};
					var url = "sysUserAction_Export.do";
					$.post(
						 url, 
					     params, 
					     function(json){
					     	var obj = eval('('+json+')');
					     	//if(confirm("确定下载?")){
					     		window.location.href = "${pageContext.request.contextPath}/uploadFileAction_Download.do?fileName="+obj.url;
					     	//}
				      })
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
				$("#name").val("");
				$("#cnname").val("");
				$("#groupId").get(0).selectedIndex= 0 ;
				$("#duty").val("");
				$("#name").focus();
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
			<span class="menu_selected">人事管理</span>
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
						人员搜索
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
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="name" name="name" cssStyle="width:100px;" cssClass="validate[maxSize[20]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中文名：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="cnname" name="cnname" cssStyle="width:100px;" cssClass="validate[maxSize[20]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属部门：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:select list="%{groupList}" id="groupId" name="groupId"
										listKey="groupId" listValue="name" headerKey=""
										headerValue="-----请选择------" cssStyle="width:90%" />
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职务：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="duty" name="duty" cssStyle="width:100px;" cssClass="validate[maxSize[20]]"/>
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
			&nbsp;人员列表
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
			<button type='button' class='button'
				onMouseOver="this.className='button_over';"
				onMouseOut="this.className='button';" onClick="exportData()">
				<img
					src="${pageContext.request.contextPath}/ui/images/button/redo.png"
					border='0' align='absmiddle' width="17px" height="16px">
				&nbsp;导出
			</button>
		</div>
		<!-- list -->
		<div class="border">
			<s:form id="form2" name="form2" method="post" action="sysUserAction_Delete.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="PowerTable" class="PowerTable">
					<!-- title -->
					<tr>
						<td width="4%" class="listViewThS1">
							<input type="checkbox" id="checkall" name="checkall" value=""
								class="checkbox" onClick="checkAll()">
						</td>
						<td width="13%" class="listViewThS1">
							用户名
						</td>
						<td width="13%" class="listViewThS1">
							中文名
						</td>
						<td width="13%" class="listViewThS1">
							性别
						</td>
						<td width="15%" class="listViewThS1">
							操作权限组
						</td>
						<td width="10%" class="listViewThS1">
							所属部门
						</td>
						<td width="10%" class="listViewThS1">
							移动电话
						</td>
						<td width="10%" class="listViewThS1">
							职务
						</td>
					</tr>

					<s:iterator value="%{userList}">
						<tr onmouseover="this.style.backgroundColor = '#99DD00'" style="CURSOR: hand" onmouseout="this.style.backgroundColor = ''" bgcolor="#FFFFFF">
							<td>
								<s:checkbox name="ids" id="ids" cssClass="checkbox"
									fieldValue="%{userId}" onclick="changeCheckCount()" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/sysUserAction_EditUI.do?userId=<s:property value="%{userId}"/>">
								<font style="color: red;"><s:property value="%{name}" /></font></a>
							</td>
							<td>
								<s:property value="%{cnname}" />
							</td>
							<td>
								<s:if test="%{sex==\"男\"}">
								<img src="${pageContext.request.contextPath}/ui/images/nan.png" title="男" width="20" height="15" border="0">
								</s:if>
								<s:else>
								<img src="${pageContext.request.contextPath}/ui/images/nv.png" title="女" width="20" height="15" border="0">
								</s:else>
							</td>
							<td>
								<s:property value="%{sysRole.roleName}" />
							</td>
							<td>
								<s:property value="%{sysUserGroup.name}" />
							</td>
							<td>
								<s:property value="%{movetelePhone}" />
							</td>
							<td>
								<s:property value="%{duty}" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</body>
</html>