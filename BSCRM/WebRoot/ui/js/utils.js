function getCurTime() {
	var myDate = new Date();
	var fullyear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
	var month = myDate.getMonth() + 1; //获取当前月份(0-11,0代表1月)
	var date = myDate.getDate(); //获取当前日(1-31)
	var mytime = myDate.toLocaleTimeString(); //获取当前时间
	if(month<10){  month = "0"+month;  }
    if(date<10){  date = "0"+date;  }
	var myfulltime = fullyear + "-" + month + "-" + date + " " + mytime;
	/*window.setTimeout("getTime();", 500);*/
	return myfulltime;
}
