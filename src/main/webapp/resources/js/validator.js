function boardCheck() {
	if (document.frm.title.value.length == 0) {
		alert("제목을 작성해주세요");
		frm.title.focus();
		return false;
	}

	if (document.frm.author.value.length == 0) {
		alert("작성자를 작성해주세요");
		frm.author.focus();
		return false;
	}


	if (document.frm.content.value.length == 0) {
		alert("내용을 작성해주세요");
		frm.content.focus();
		return false;
	}

	return true;
}

function checkPassword() {
	if(password.value !== passwordRef.value) {
		alert (document.getElementById("kk").value);
		return false;
	}
	return true;
}


function checkNewPassword() {
	if(password.value.length != 0 && passwordRef.value.length != 0) {
		if(password.value !== passwordRef.value) {
			alert ("비밀번호 입력이 일치하지 않습니다.");
			return false;
		}
	}
	return true;
}
