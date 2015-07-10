<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>工资编辑</title>
<%@include file="/ui/common.jsp" %>
<link href="${pageContext.request.contextPath}/ui/css/style_cn.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/ui/js/utils.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ui/datepicker97/WdatePicker.js" type="text/javascript"></script>
	<script language="javascript">
		
		$().ready(function(){
			$("#form1").validationEngine();
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
			$("#payday").val($("#payday").val().substring(0, 10)) ;
		}
		
		function calculateSummation(){
			var sum = 0;
			var grossPay = parseFloat($("#grossPay").val());
			var mealAllowance = parseFloat($("#mealAllowance").val());
			var overtimeCharges = parseFloat($("#overtimeCharges").val());

			var providentFund = parseFloat($("#providentFund").val());
			var insurance = parseFloat($("#insurance").val());
			var taxes = parseFloat($("#taxes").val());
			var attendance = parseFloat($("#attendance").val());
			var roomSurcharge = parseFloat($("#roomSurcharge").val());
			
			if(grossPay){
				sum = parseFloat(sum) + parseFloat($("#grossPay").val());
			}
			if(mealAllowance){
				sum = parseFloat(sum) + parseFloat($("#mealAllowance").val());
			}
			if(overtimeCharges){
				sum = parseFloat(sum) + parseFloat($("#overtimeCharges").val());
			}
			//@@@@@@@@@@@@@@@@@@@@@扣除费用@@@@@@@@@@@@@@@@@@@@@@@
			if(roomSurcharge){
				sum = parseFloat(sum) - parseFloat($("#roomSurcharge").val());
			}
			if(providentFund){
				sum = parseFloat(sum) - parseFloat($("#providentFund").val());
			}
			if(insurance){
				sum = parseFloat(sum) - parseFloat($("#insurance").val());
			}
			if(taxes){
				sum = parseFloat(sum) - parseFloat($("#taxes").val());
			}
			if(attendance){
				sum = parseFloat(sum) - parseFloat($("#attendance").val());
			}
			$("#summation").val(sum);
		}
		
		function UpdateSalary(){
			var salaryId = $("#salaryId").val();
			var userId = $("#userId").val();
			var userName = $("#userName").val();
			var groupName = $("#groupName").val();
			var grossPay = $("#grossPay").val();
			var payday = $("#payday").val();
			var roomSurcharge = $("#roomSurcharge").val();
			var mealAllowance = $("#mealAllowance").val();
			var providentFund = $("#providentFund").val();
			var insurance = $("#insurance").val();
			var overtimeCharges = $("#overtimeCharges").val();
			var taxes = $("#taxes").val();
			var attendance = $("#attendance").val();
			var summation = $("#summation").val();
			var remark = editor.html();
			var validate = $("#form1").validationEngine('validate');
			if(validate){
				var params = {
					 salaryId : salaryId,
					 userId : userId,
					 userName : userName,
					 grossPay : grossPay,
					 groupName : groupName,
					 payday : payday,
					 roomSurcharge : roomSurcharge,
					 mealAllowance : mealAllowance,
					 providentFund : providentFund,
					 insurance : insurance,
					 overtimeCharges : overtimeCharges,
					 taxes : taxes,
					 attendance : attendance,
					 summation : summation,
					 remark : remark
				};
				var url = "salaryAction_Update.do";
				$.post(  
						 url, 
					     params, 
					     function(json){
							if(json == "true"){
								alert("更新成功!");
								window.location = "salaryAction_Check.do";
							}else{
								alert("更新失败!");
							}
				         })
			}
		}
		
		function validateUser(){
			var userId = $("#userId").val();
			if(userId == null){
				return;
			}
			var params = {userId : userId};
			var url = "salaryAction_CheckUser.do";
			$.post(
				 url, 
			     params, 
			     function(json){
			     	var dataObj=eval("("+json+")");
			     	if(dataObj.length == 0){
			     		alert("系统中无编号为[ "+userId+" ]所对应的员工!");
			     		return;
			     	}
			     	var userName = dataObj[0].userName;
			     	if(userName != null){
				     	$("#userName").val(userName);
			     	}
			     	var groupName = dataObj[1].groupName;
			     	if(groupName != null){
						$("#groupName").val(groupName);
			     	}
		      })
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
	工资-编辑
</div>
<br>
<div class="control">
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="UpdateSalary();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/baocun.png" border='0' 
	             align='absmiddle'>&nbsp;保存</button>
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="Back();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' 
	             align='absmiddle'>&nbsp;返回</button>
</div>
<br/>
<table width="100%" border="0" cellspacing="0" class="tabForm">
<s:hidden id="salaryId" name="salaryId"/>
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
				<td class="red">员工工号：</td>
				<td>
					<s:textfield id="userId" name="userId" cssStyle="width:90%" readonly="true" cssClass="disabled"/>
				</td>
			</tr>
			<tr>
				<td>员工姓名：</td>
				<td>
					<s:textfield id="userName" name="userName" cssStyle="width:90%" readonly="true" cssClass="disabled" />
				</td>
				<td>部门名称：</td>
				<td>
					<s:textfield id="groupName" name="groupName" cssStyle="width:90%" readonly="true" cssClass="disabled"/>
				</td>
			</tr>
			<tr>
				<td>绩效工资：</td>
				<td>
					<s:textfield id="grossPay" name="grossPay" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
				<td>发放日期：</td>
				<td>
					<s:textfield id="payday" name="payday" cssStyle="width:90%" cssClass="Wdate" onfocus="WdatePicker({skin:'ext',dateFmt:'yyyy-MM-dd'})"/>
				</td>
			</tr>
			<tr>
				<td>伙食补助：</td>
				<td>
					<s:textfield id="mealAllowance" name="mealAllowance" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
				<td>住房补助：</td>
				<td>
					<s:textfield id="roomSurcharge" name="roomSurcharge" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
			</tr>
			<tr>
				<td>公积金：</td>
				<td>
					<s:textfield id="providentFund" name="providentFund" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
				<td>保险金：</td>
				<td>
					<s:textfield id="insurance" name="insurance" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
			</tr>
			<tr>
				<td>加班费：</td>
				<td>
					<s:textfield id="overtimeCharges" name="overtimeCharges" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
				<td>考勤合计：</td>
				<td>
					<s:textfield id="attendance" name="attendance" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
			</tr>
			<tr>
				<td>代缴税款：</td>
				<td>
					<s:textfield id="taxes" name="taxes" cssStyle="width:90%" cssClass="validate[custom[number],maxSize[10]]" onblur="calculateSummation();"/>
				</td>
				<td>实发工资：</td>
				<td>
					<s:textfield id="summation" name="summation" cssStyle="width:90%" readonly="true" cssClass="disabled"/>
				</td>
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
</s:form>
</body>
</html>