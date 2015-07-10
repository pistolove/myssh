		function init(){
			var flag = false;
			var name = GetCookie("username");
			if(name != null){
				$("#username").val(name);
				flag = true;
			}
			var pass = GetCookie("password");
			if(pass != null){
				$("#password").val(pass);
				flag = true;
			}
			if(flag){
				$("[name='remember']").attr("checked",'true');//记住我
			}
			
			var username = $("#username").val();
			var password = $("#password").val();
			var captcha = $("#captcha").val();
			if(username == ""){
				$("#username").focus()
			}
			if(password == ""&&username != ""){
				$("#password").focus()
			}
			if(captcha == ""&&password != ""){
				$("#captcha").focus()
			}
		}
