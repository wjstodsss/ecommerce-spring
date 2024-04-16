function goToIndex() {
	window.location.href = "banchan?command=index";
}

function loginCheck() {
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 써주세요");
		frm.userid.focus();
		return false;
	}
	if (document.frm.pwd.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	return true;
}

function idCheck() {
	if (document.frm.userid.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.frm.userId.focus();
		return;
	}
	
	let userId = document.frm.userid.value;
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "banchan?command=idCheck", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onload = function() {
		if (xhr.status === 200 && xhr.responseText === "available" && document.frm.userid.value.length > 3) {
			document.frm.reid.value = 1;
			alert("사용 가능한 아이디입니다.");
		} else if (document.frm.userid.value.length < 4) {
			alert("아이디는 4글자이상이어야 합니다.");
			frm.userid.focus();
		} else {
			alert("이미 사용 중인 아이디입니다. 다른 아이디를 선택해주세요.");
		}		
	}
	xhr.send("userId=" + userId);
}

function idok(userid) {
	opener.frm.userid.value = document.frm.userid.value;
	opener.frm.reid.value = document.frm.userid.value;
	self.close();
}


function joinCheck() {
	if (document.frm.username.value.length == 0) {
		alert("이름을 써주세요.");
		frm.username.focus();
		return false;
	}
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 써주세요");
		frm.userid.focus();
		return false;
	}
	if (document.frm.userid.value.length < 4) {
		alert("아이디는 4글자이상이어야 합니다.");
		frm.userid.focus();
		return false;
	}
	if (document.frm.pwd.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.pwd.value != document.frm.pwd_check.value) {
		alert("암호가 일치하지 않습니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.reid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.userid.focus();
		return false;
	}
	return true;
}



