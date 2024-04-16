function checkLoginState() {
    var memberToken = sessionStorage.getItem("memberToken");
    if (memberToken) {
        document.getElementById("loginButton").value = "로그아웃";
        document.getElementById("loginButton").setAttribute("onclick", "logout()");
        
    } else {
        console.log("false")
        document.getElementById("loginButton").value = "로그인";
        document.getElementById("loginButton").setAttribute("onclick", "goToLoginForm()");
    }
}


function goToLoginForm() {
    window.location.href = "banchan?command=login_form";
     loginTitle.innerHTML = "사용자 로그인"
}

function goToAdminPage() {

    window.location.href = "banchan?command=admin_page";
}

function goToAdminLoginForm() {
    window.location.href = "banchan?command=admin_login_form";
    loginTitle.innerHTML = "관리자 로그인"
}


function goToRegisterForm() {
	console.log("dsdfsdfasdfsadfs")
    window.location.href = "banchan?command=register_form";
}

function goToTestForm() {
    window.location.href = "banchan?command=test_page";
}



function login() {
    // 사용자가 일반 사용자인지 확인
    if ($("#userId").attr("name") === 'userId') {
        var userId = $("input[name='userId']").val();
        var userPassword = $("input[name='userPassword']").val();
        var url = "banchan?command=member_login";
    } else {
        // 사용자가 관리자인지 확인
        var adminId = $("input[name='adminId']").val();
        var adminPassword = $("input[name='adminPassword']").val();
        
        var url = "banchan?command=admin_login";
    }
    
    // AJAX 요청 보내기
    $.ajax({
        type: "POST",
        url: url,
        data: {
            userId: userId,
            userPassword: userPassword,
            adminId: adminId,
            adminPassword: adminPassword
        },
        success: function (response) {
            
            // 일반 사용자인 경우 index 페이지로, 관리자인 경우 admin 페이지로 이동
            if ($("#userId").attr("name") == 'userId') {
				sessionStorage.setItem("memberToken", response);
                window.location.href = "banchan?command=index";	
            } else {
				sessionStorage.setItem("adminToken", response);
                window.location.href = "banchan?command=admin_page";
            }
        },
        error: function (xhr, status, error) {
            if (xhr.status === 401) {
                alert("Invalid username or password.");
            } else {
                console.error("Error:", error);
            }
        }
    });
}


function logout() {
    // sessionStorage에서 토큰을 삭제합니다.
    sessionStorage.clear();
    window.location.href = "banchan?command=index";	
    
    // 서버에 로그아웃 요청을 보내도록 구현할 수 있습니다.
    /**
	 * var xhr = new XMLHttpRequest();
    xhr.open("POST", "/banchan?command=logout", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 로그아웃이 성공했을 때 추가적인 작업을 수행할 수 있습니다.
            console.log("Logout successful");
        } else {
			 // 로그아웃에 실패한 경우에 대한 처리를 수행할 수 있습니다.
            console.error("Logout failed");
		}
    };
    xhr.send();
	 */
    
}


function setTitle() {
    // 현재 URL을 가져옴
    var currentUrl = window.location.search;
    
    // URL에서 command 파라미터 값을 추출
    var urlParams = new URLSearchParams(currentUrl);
    var command = urlParams.get('command');
console.log(command)
    // command 값에 따라 타이틀 변경
    var loginTitle = document.getElementById("loginTitle");
    var idName = document.getElementById("userId");
    var passwordName = document.getElementById("userPassword");
    if (command === "login_form") {
        loginTitle.innerHTML = "사용자f234f";
        idName.setAttribute('name', 'userId');
        passwordName.setAttribute('name','userPassword');
    } else if (command === "admin_login_form") {
        loginTitle.innerHTML = "관리자usafdh";
        idName.setAttribute('name','adminId');
        passwordName.setAttribute('name','adminPassword');
    }
}