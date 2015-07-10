<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>上传文件管理</title>
		<%@include file="/ui/common.jsp"%>
		<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/ui/datepicker97/WdatePicker.js" type="text/javascript"></script>
		<script type="text/javascript">

			$().ready(function(){
				$("#fileName").val($("#fileNames").val());
				$("#uploadTime").val($("#uploadTimes").val());
				$("#userId").get(0).selectedIndex= $("#userIds").val();
				$("#form1").validationEngine();
			});
		
			function addPage() {
				window.location = "${pageContext.request.contextPath}/uploadFileAction_AddUI.do";
			}
			
			function viewImgs(){
				window.location = "${pageContext.request.contextPath}/uploadFileAction_ImageView.do";
			}
			
			function search() {
				$("#form1").action = "${pageContext.request.contextPath}/uploadFileAction_Check.do";
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
				$("#fileName").val("");
				$("#uploadTime").val("");
				$("#userId").get(0).selectedIndex= 0 ;
				$("#fileName").focus();
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
			<span class="menu_selected">上传文件管理</span>
		</div>
		<br>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tabForm">
			<s:hidden name="fileNames" id="fileNames" value="%{#request.fileName}"/>
			<s:hidden name="uploadTimes" id="uploadTimes" value="%{#request.uploadTime}"/>
			<s:hidden name="userIds" id="userIds" value="%{#request.userId}"/>
			<tr>
				<th class="th_head">
					<div id="menuArrow1"
						style="background:url(${pageContext.request.contextPath}/ui/images/down.gif) no-repeat center;float:left;">
						&nbsp;
					</div>
					<div id="menuTitle1" style="font-weight: bold">
						文件搜索
					</div>
				</th>
				<th class="th_head">
				</th>
			</tr>
			<tr>
				<td colspan="2">
					<s:form id="form1" name="form1" method="post" action="uploadFileAction_Check.do">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							name="base" id="base">
							<tr>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文件名称：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="fileName" name="fileName" cssStyle="width:100px;" cssClass="validate[maxSize[20]]" />
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传人：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:select list="%{userList}" id="userId" name="userId"
										listKey="userId" listValue="cnname" headerKey=""
										headerValue="-----请选择------" cssStyle="width:90%" />
								</td>
								<td width="10%" nowrap="nowrap">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传日期：
								</td>
								<td width="10%" nowrap="nowrap">
									<s:textfield id="uploadTime" name="uploadTime" cssStyle="width:100px;" cssClass="Wdate" onfocus="WdatePicker({skin:'ext',dateFmt:'yyyy-MM-dd'})"/>
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
			&nbsp;文件列表
		</h3>
		<div class="control">
			<button type='button' class='button'
				onMouseOver="this.className='button_over';"
				onMouseOut="this.className='button';"
				onClick="addPage();">
				<img
					src="${pageContext.request.contextPath}/ui/images/button/xinjian.png"
					border='0' align='absmiddle'>
				&nbsp;上传
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
				onMouseOut="this.className='button';" onClick="viewImgs()">
				<img
					src="${pageContext.request.contextPath}/ui/images/button/viewimg.png"
					border='0' align='absmiddle' width="20px" height="20px">
				&nbsp;查看图片文件
			</button>
		</div>
		<!-- list -->
		<div class="border">
			<s:form id="form2" name="form2" method="post" action="uploadFileAction_Delete.do">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					id="PowerTable" class="PowerTable">
					<!-- title -->
					<tr>
						<td width="4%" class="listViewThS1">
							<input type="checkbox" id="checkall" name="checkall" value=""
								class="checkbox" onClick="checkAll()">
						</td>
						<td width="10%" class="listViewThS1">
							文件名称
						</td>
						<td width="10%" class="listViewThS1">
							文件大小
						</td>
						<td width="15%" class="listViewThS1">
							文件类型
						</td>
						<td width="15%" class="listViewThS1">
							上传日期
						</td>
						<td width="10%" class="listViewThS1">
							上传人
						</td>
						<td width="10%" class="listViewThS1">
							操作
						</td>
					</tr>

					<s:iterator value="%{fileList}" var="file">
						<tr onmouseover="this.style.backgroundColor = '#99DD00'" style="CURSOR: hand" onmouseout="this.style.backgroundColor = ''" bgcolor="#FFFFFF">
							<td>
								<s:checkbox name="ids" id="ids" cssClass="checkbox"
									fieldValue="%{fileId+','+fileName}" onclick="changeCheckCount()" />
							</td>
							<td>
								<font style="color: red;"><s:property value="%{fileName}" /></font>
							</td>
							<td>
								<s:property value="%{fileSize}" />&nbsp;KB
							</td>
							<td>
								 <s:if test="%{suffix==\"mp3\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/mp3.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"wma\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/mp3.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"jpg\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/img.png" width="20" height="20" border="0"> 
								 </s:if>
								<s:if test="%{suffix==\"jpeg\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/img.png" width="20" height="20" border="0"> 
								 </s:if>
								<s:if test="%{suffix==\"gif\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/img.png" width="20" height="20" border="0"> 
								 </s:if>
								<s:if test="%{suffix==\"png\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/img.png" width="20" height="20" border="0"> 
								 </s:if>
								<s:if test="%{suffix==\"bmp\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/img.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"pdf\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/pdf.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"ppt\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/ppt.png" width="20" height="20" border="0"> 
								 </s:if>
								<s:if test="%{suffix==\"zip\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/rar.png" width="20" height="20" border="0"> 
								 </s:if>
								<s:if test="%{suffix==\"exe\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/soft.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"doc\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/world.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"docx\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/world.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"xls\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/excel.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"xlsx\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/excel.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"accdb\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/accdb.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"ldb\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/accdb.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"mdb\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/accdb.png" width="20" height="20" border="0"> 
								 </s:if>
								 <s:if test="%{suffix==\"unknow\"}">
							        <img src="${pageContext.request.contextPath}/ui/icon/other.png" width="20" height="20" border="0"> 
								 </s:if>
							</td>
							<td>
								<s:property value="%{uploadTime}" />
							</td>
							<td>
								<s:property value="%{uploadPerson}" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/uploadFileAction_Download.do?fileName=<s:property value="%{fileName}"/>">
							        <img src="${pageContext.request.contextPath}/ui/images/download1.png" height="20" width="70" border="0"> 
								</a>
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
	</body>
</html>