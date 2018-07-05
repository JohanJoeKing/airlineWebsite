function check(){
	if(form1.username.value == ""){
		alert("用户名不能为空！");
		form1.username.focus();
		return false;
	}
	if(form1.telephone.value == ""){
		alert("手机号不能为空！");
		form1.telephone.focus();
		return false;
	}
	if(form1.password1.value == ""){
		alert("设置密码不能为空！");
		form1.password1.focus();
		return false;
	}
	if(form1.password2.value == ""){
		alert("确认密码不能为空！");
		form1.password2.focus();
		return false;
	}
	if(form1.sex.value == ""){
		alert("性别不能为空！");
		form1.sex.focus();
		return false;
	}
	if(form1.birthday.value == ""){
		alert("出生年月不能为空！");
		form1.birthday.focus();
		return false;
	}
}