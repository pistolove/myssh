<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
   <head>
      <title>工资分布报表</title>
   </head>
   <script src="${pageContext.request.contextPath}/ui/js/jquery-1.6.min.js" type="text/javascript"></script>
   <script type="text/javascript">
   		var flag = "Column3D";
   		function View(){
   			if(flag=="Column2D"){
	   		  	$('#Column2D').css("display","");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Column3D";
   			}else if(flag=="Column3D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Pie2D";
   			}else if(flag=="Pie2D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Pie3D";
   			}else if(flag=="Pie3D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Area2D";
   			}else if(flag=="Area2D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Bar2D";
   			}else if(flag=="Bar2D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Doughnut2D";
   			}else if(flag=="Doughnut2D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","");
	   		  	$('#Doughnut3D').css("display","none");
	   		  	flag = "Doughnut3D";
   			}else if(flag=="Doughnut3D"){
	   		  	$('#Column2D').css("display","none");
	   		  	$('#Column3D').css("display","none");
	   		  	$('#Pie2D').css("display","none");
	   		  	$('#Pie3D').css("display","none");
	   		  	$('#Area2D').css("display","none");
	   		  	$('#Bar2D').css("display","none");
	   		  	$('#Doughnut2D').css("display","none");
	   		  	$('#Doughnut3D').css("display","");
	   		  	flag = "Column2D";
   			}
   		}

   		function Back(){
			history.back();
		}
   </script>
   	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="View();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/exchange.png" border='0' 
	             align='absmiddle' width="17px" height="16px">&nbsp;切换报表</button>
	<button type='button' class='button' onMouseOver="this.className='button_over';" 
	        onMouseOut="this.className='button';"  onClick="Back();">
	        <img src="${pageContext.request.contextPath}/ui/images/button/fanhui.png" border='0' 
	             align='absmiddle'>&nbsp;返回</button>
   <body bgcolor="#ffffff" style="text-align: center;margin-right: auto;margin-left: auto;">
   		<div name="Column2D" id="Column2D" >
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Column2D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Column3D" id="Column3D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Column3D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Pie2D" id="Pie2D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Pie2D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Pie3D" id="Pie3D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Pie3D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Area2D" id="Area2D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Area2D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Bar2D" id="Bar2D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Bar2D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Doughnut2D" id="Doughnut2D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Doughnut2D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		<div name="Doughnut3D" id="Doughnut3D" style="display: none">
	         <embed src="${pageContext.request.contextPath}/ui/Charts/Doughnut3D.swf" flashVars="&dataXML=
								         <chart caption='工资报表' subcaption='企业所有员工薪水分段报表' xAxisName='工资段' yAxisName='人数' numberSuffix='人'>
								         	<c:forEach var="pol" items="${policyList}">
											    <set label='${pol[1]}' value='${pol[0]}' />
										    </c:forEach>
										</chart>
	         &chartWidth=700&chartHeight=300" quality="high" width="800" height="300" name="Chart" id="Chart" type="application/x-shockwave-flash" />
	     </div>
   		
</body>
</html>