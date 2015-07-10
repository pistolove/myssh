<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>工资管理</title>
		<%@include file="/ui/common.jsp"%>
		<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/ui/datepicker97/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript">

			$().ready(function(){
				$("#form1").validationEngine();
			});
		
			function addPage() {
				window.location = "${pageContext.request.contextPath}/salaryAction_AddUI.do";
			}
			
			function search() {
				$("#form1").action = "${pageContext.request.contextPath}/salaryAction_Check.do";
				var validate = $("#form1").validationEngine('validate');
				if (validate) {
					$("#form1").submit();
				}
			}
			
			function ChartView(){
				window.location = "${pageContext.request.contextPath}/salaryAction_Chart.do";
			}
			
			function drops() {
				var len=$("input[type='checkbox'][name='ids']:checked").length;
		        if(len<1){
		          alert("您至少选择一个!!!");
		          return false;
		        }
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
				$("#userName").val("");
				$("#groupName").val("");
				$("#payday").val("");
				$("#userName").focus();
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
			<span class="menu_selected">工资管理</span>
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
						工资搜索
					</div>
				</th>
				<th class="th_head">
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<s:form id="form1" name="form1" method="post" action="salaryAction_Check.do">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							name="base" id="base">
							<tr>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工姓名：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="userName" name="userName" cssStyle="width:100px;" cssClass="validate[maxSize[20]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="groupName" name="groupName" cssStyle="width:100px;" cssClass="validate[maxSize[20]]"/>
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发放日期：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="payday" name="payday" cssStyle="width:100px;" cssClass="Wdate" onfocus="WdatePicker({skin:'ext',dateFmt:'yyyy-MM-dd'})"/>
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
			&nbsp;工资列表
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
				onMouseOut="this.className='button';" onClick="ChartView()">
				<img
					src="${pageContext.request.contextPath}/ui/images/button/report.png"
					border='0' align='absmiddle' width="19px" height="15px">
				&nbsp;工资报表
			</button>
		</div>
		<!-- list -->
		<div class="border">
			<s:form id="form2" name="form2" method="post" action="salaryAction_Delete.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="PowerTable" class="PowerTable">
					<!-- title -->
					<tr>
						<td width="4%" class="listViewThS1">
							<input type="checkbox" id="checkall" name="checkall" value=""
								class="checkbox" onClick="checkAll()">
						</td>
						<td width="10%" class="listViewThS1">
							员工姓名
						</td>
						<td width="10%" class="listViewThS1">
							部门名称
						</td>
						<td width="15%" class="listViewThS1">
							发放日期
						</td>
						<td width="15%" class="listViewThS1">
							绩效工资
						</td>
						<td width="10%" class="listViewThS1">
							加班费
						</td>
						<td width="10%" class="listViewThS1">
							考勤合计
						</td>
						<td width="20%" class="listViewThS1">
							实发工资
						</td>
					</tr>

					<s:iterator value="%{salaryList}">
						<tr onmouseover="this.style.backgroundColor = '#99DD00'" style="CURSOR: hand" onmouseout="this.style.backgroundColor = ''" bgcolor="#FFFFFF">
							<td>
								<s:checkbox name="ids" id="ids" cssClass="checkbox"
									fieldValue="%{salaryId}" onclick="changeCheckCount()" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/salaryAction_EditUI.do?salaryId=<s:property value="%{salaryId}"/>">
									<font style="color: red;"><s:property value="%{userName}" /></font></a>
							</td>
							<td>
								<s:property value="%{groupName}" />
							</td>
							<td>
								<s:property value='%{payday}'/>
							</td>
							<td>
								<s:property value="%{grossPay}" />
							</td>
							<td>
								<s:property value="%{overtimeCharges}" />
							</td>
							<td>
								<s:property value="%{attendance}" />
							</td>
							<td>
								<s:property value="%{summation}" />
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</body>
</html>