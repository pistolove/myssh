<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>人员-编辑</title>
<%@include file="/ui/common.jsp" %>
<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/ui/js/utils.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ui/datepicker97/WdatePicker.js" type="text/javascript"></script>

<script language="javascript">
	var editor;
	
	$().ready(function(){
		$("#form1").validationEngine();
		$("#password").val($("#sourcePass").val());
		$("#creator").val($("#creators").val());
		$("#createTime").val($("#createTimes").val());
		$("#updater").val($("#updaters").val());
		var sexs = $("#sexs").val();
		$(":radio[name=sex]").each(function(){
			if(this.value == sexs){
				$(":radio[name=sex][value='"+sexs+"']").attr("checked","true");
			}
		});
		setTime();
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
	
	function setTime(){
		$("#birthday").val(($("#birthday").val()).substring(0, 10));
		$("#finishSchoolDate").val(($("#finishSchoolDate").val()).substring(0, 10));
		$("#workDate").val(($("#workDate").val()).substring(0, 10));
		$("#createTime").val(($("#createTime").val()).substring(0, 19));
		$("#updateTime").val(getCurTime());
		setTimeout("setTime();", 100);
	}
	
	function UpdateUser(){
		var userId = $("#userId").val();
		var name = $("#name").val();
		var cnname = $("#cnname").val();
		var password = $("#password").val();
		var sourcePass = $("#sourcePass").val();
		var sex = $(":radio[name='sex']:checked").val();
		var birthday = $("#birthday").val();
		var address = $("#address").val();
		var telephone = $("#telephone").val();
		var email = $("#email").val();
		var roleId = $("#roleId").val();
		var groupId = $("#groupId").val();
		var duty = $("#duty").val();
		var workDate = $("#workDate").val();
		var commendMan = $("#commendMan").val();
		var movetelePhone = $("#movetelePhone").val();
		
		var nowAddress = $("#nowAddress").val();
		var nowtelePhone = $("#nowtelePhone").val();
		var identityCode = $("#identityCode").val();
		var instancyLinkman = $("#instancyLinkman").val();
		var instancytelePhone = $("#instancytelePhone").val();
		var highSchool = $("#highSchool").val();
		var finishSchool = $("#finishSchool").val();
		var finishSchoolDate = $("#finishSchoolDate").val();
		var remark = editor.html();
		
		var creator = $("#creator").val();
		var createTime = $("#createTime").val();
		var updater = $("#updater").val();
		var updateTime = $("#updateTime").val();
		
		var validate = $("#form1").validationEngine('validate');
		if(validate){
			var params = {
				 userId : userId,
				 name : name,
				 cnname : cnname,
				 password : password,
				 sourcePass : sourcePass,
				 sex : sex,
				 birthday : birthday,
				 address : address,
				 telephone : telephone,
				 email : email,
				 roleId : roleId,
				 groupId : groupId,
				 duty : duty,
				 workDate : workDate,
				 commendMan : commendMan,
				 movetelePhone : movetelePhone,
				 nowAddress : nowAddress,
				 nowtelePhone : nowtelePhone,
				 identityCode : identityCode,
				 instancyLinkman : instancyLinkman,
				 instancytelePhone : instancytelePhone,
				 highSchool : highSchool,
				 finishSchool : finishSchool,
				 finishSchoolDate : finishSchoolDate,
				 remark : remark,
				 creator : creator,
				 createTime : createTime,
				 updater : updater,
				 updateTime : updateTime
			};
			var url = "sysUserAction_Update.do";
			$.post(  
					 url, 
				     params, 
				     function(json){
						if(json == "true"){
							alert("修改成功!");
							window.location = "sysUserAction_Check.do";
						}else{
							alert("修改失败!");
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
<s:form id="form1" name="form1" method="post" action="sysUserAction_Save.do" >
<div class="mtitle">
	<div class="mtitle-row">&nbsp;</div>
	人员-修改
</div>
<br>
<div class="control">
	<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
	        onClick="UpdateUser();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/baocun.png" border='0' 
	        align='absmiddle'>&nbsp;保存</button>
	<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
	       onClick="Back();">
	       <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' 
	       align='absmiddle'>&nbsp;返回</button>
</div>

<table width="100%" border="0" cellspacing="0" class="tabForm">
  <s:hidden id="userId" name="userId"/>
  <s:hidden id="sexs" name="sexs"/>
  <s:hidden id="sourcePass" name="sourcePass" value="%{password}"/>
  <s:hidden id="creators" name="creators" value="%{creator}"/>
  <s:hidden id="createTimes" name="createTimes" value="%{createTime}"/>
  <s:hidden id="updaters" name="updaters" value="%{updater}"/>
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
				<td class="red">用户名：</td>
				<td>
					<s:textfield id="name" name="name" cssStyle="width:90%" cssClass="validate[required,maxSize[20]]"/>
				</td>
				<td class="red">中文名：</td>
				<td>
					<s:textfield id="cnname" name="cnname" cssStyle="width:90%" cssClass="validate[required,maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td class="red">密码：</td>
				<td>
					<s:password id="password" name="password" cssStyle="width:90%" cssClass="validate[required,maxSize[50]]"/>
				</td>
				<td>推荐人：</td>
				<td>
					<s:textfield id="commendMan" name="commendMan" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td>移动电话：</td>
				<td>
					<s:textfield id="movetelePhone" name="movetelePhone" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
				<td>电子邮件：</td>
				<td>
					<s:textfield id="email" name="email" cssStyle="width:90%" cssClass="validate[maxSize[100]]"/>
				</td>
			</tr>
			<tr>
				<td>家庭地址：</td>
				<td>
					<s:textfield id="address" name="address" cssStyle="width:90%" cssClass="validate[maxSize[200]]"/>
				</td>
				<td>家庭电话：</td>
				<td>
					<s:textfield id="telephone" name="telephone" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td>现住宅地址：</td>
				<td>
					<s:textfield id="nowAddress" name="nowAddress" cssStyle="width:90%" cssClass="validate[maxSize[200]]"/>
				</td>
				<td>现住宅电话：</td>
				<td>
					<s:textfield id="nowtelePhone" name="nowtelePhone" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td>身份证号码：</td>
				<td>
					<s:textfield id="identityCode" name="identityCode" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td>紧急联系人：</td>
				<td>
					<s:textfield id="instancyLinkman" name="instancyLinkman" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
				<td>紧急联系电话：</td>
				<td>
					<s:textfield id="instancytelePhone" name="instancytelePhone" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td class="red">操作权限组：</td>
				<td>
					<s:select list="%{roleList}" id="roleId" name="roleId" listKey="roleId" listValue="roleName" 
						headerKey="" headerValue="-------------------------------------------请选择---------------------------------------------" 
						cssStyle="width:90%"/>
               </td>
					<td class="red">所属部门：</td>
				<td>
					<s:select list="%{groupList}" id="groupId" name="groupId" listKey="groupId" listValue="name" 
						headerKey="" headerValue="-------------------------------------------请选择---------------------------------------------" 
						cssStyle="width:90%"/>
				</td>
			</tr>
  		</table>
		</div>
	</td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellspacing="0" class="tabForm">
  <tr>
    <th colspan="4" align="left" class="th_head">
		<div id="menuArrow2" style="background:url(${pageContext.request.contextPath}/ui/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
		<div id="menuTitle2" style="font-weight:bold">详细信息</div>
	</th>
  </tr>
  <tr>
  	<td>
		<div id="menu2">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="16%"></td>
				<td width="34%"></td>
				<td width="16%"></td>
				<td width="34%"></td>
			</tr>			
			<tr>
				<td>性别：</td>
				<td>
					<input type='radio' name='sex' id='sex' value='男' class='radio' checked="checked"><img src="${pageContext.request.contextPath}/ui/images/nan.png" title="男" width="20" height="20" border="0">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type='radio' name='sex' id='sex' value='女' class='radio'><img src="${pageContext.request.contextPath}/ui/images/nv.png" title="女" width="20" height="20" border="0">
				</td>
				<td>出生日期：</td>
				<td>
					<s:textfield id="birthday" name="birthday" cssStyle="width:90%" cssClass="Wdate" onfocus="WdatePicker({skin:'ext',dateFmt:'yyyy-MM-dd'})"/>
				</td>
			</tr>
			<tr>
				<td>职务：</td>
				<td>
					<s:textfield id="duty" name="duty" cssStyle="width:90%" cssClass="validate[maxSize[20]]"/>
				</td>
			</tr>
			<tr>
				<td>入职时间：</td>
				<td>
					<s:textfield id="workDate" name="workDate" cssStyle="width:90%" cssClass="Wdate" onfocus="WdatePicker({skin:'ext',dateFmt:'yyyy-MM-dd'})"/>
				</td>
				<td>最高学历：</td>
				<td>
					<s:textfield id="highSchool" name="highSchool" cssStyle="width:90%" cssClass="validate[maxSize[100]]"/>
				</td>
			</tr>
			<tr>
				<td>毕业学校：</td>
				<td>
					<s:textfield id="finishSchool" name="finishSchool" cssStyle="width:90%" cssClass="validate[maxSize[100]]"/>
				</td>
				<td>毕业时间：</td>
				<td>
					<s:textfield id="finishSchoolDate" name="finishSchoolDate" cssStyle="width:90%" cssClass="Wdate" onfocus="WdatePicker({skin:'ext',dateFmt:'yyyy-MM-dd'})"/>
				</td>
			</tr>
			<tr>
				<td>备注：</td>
				<td colspan="3">
					<s:textarea id="remark" name="remark" cssStyle="width:96%;height:100px;visibility:hidden;"/>
				</td>
			</tr>
  		</table>
		</div>
	</td>
  </tr>
</table>
<br>
<table width="100%" border="0" cellspacing="0" class="tabForm">
  <tr>
    <th colspan="4" align="left" class="th_head">
		<div id="menuArrow4" style="background:url(${pageContext.request.contextPath}/ui/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
		<div id="menuTitle4" style="font-weight:bold">系统信息</div>
	</th>
  </tr>
  <tr>
  	<td>
		<div id="menu4">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="16%"></td>
				<td width="34%"></td>
				<td width="16%"></td>
				<td width="34%"></td>
			</tr>
			<tr>
				<td>创建人：</td>
				<td>
					<s:textfield id="creator" name="creator"  cssStyle="width:90%" readonly="true" cssClass="disabled" />
				</td>
				<td>创建时间：</td>
				<td>
					<s:textfield id="createTime" name="createTime" cssStyle="width:90%"  readonly="true" cssClass="disabled"/>
				</td>
			</tr>
			<tr>
				<td>修改人：</td>
				<td>
					<s:textfield id="updater" name="updater" cssStyle="width:90%"  readonly="true" cssClass="disabled"/>
				</td>
				<td>修改时间：</td>
				<td>
					<s:textfield id="updateTime" name="updateTime" cssStyle="width:90%" readonly="true" cssClass="disabled"/>
				</td>
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