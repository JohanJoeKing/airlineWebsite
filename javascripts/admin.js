function check(){
	if(form1.thour.value == ""){
		alert("起飞时间（小时）不能为空！");
		form1.thour.focus();
		return false;
	}
	if(form1.tminute.value == ""){
		alert("起飞时间（分钟）不能为空！");
		form1.tminute.focus();
		return false;
	}
	if(form1.ahour.value == ""){
		alert("到达时间（小时）不能为空！");
		form1.ahour.focus();
		return false;
	}
	if(form1.aminute.value == ""){
		alert("到达时间（分钟）不能为空！");
		form1.aminute.focus();
		return false;
	}
	if(form1.timeLength.value == ""){
		alert("飞行时长不能为空！");
		form1.timeLength.focus();
		return false;
	}
	if(form1.price.value == ""){
		alert("票价不能为空！");
		form1.price.focus();
		return false;
	}
}

function check_p(){
        if(form3.price.value == ""){
		alert("票价不能为空！");
		form1.price.focus();
		return false;
	}
}