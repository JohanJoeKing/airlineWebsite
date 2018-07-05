function check(){
	if(form1.account.value == ""){
		alert("账号不能为空！");
		form1.account.focus();
		return false;
	}
	if(form1.password.value == ""){
		alert("密码不能为空！");
		form1.password.focus();
		return false;
	}
}