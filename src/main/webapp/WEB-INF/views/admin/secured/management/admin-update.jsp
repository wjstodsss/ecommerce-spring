<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../resources/js/validator.js"></script>
    <style>
        body {
            padding-top: 50px;
        }

        #wrap {
            max-width: 800px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div id="wrap">
    <h1 class="text-center">관리자 수정</h1>
    <form method="post" action="banchan?command=admin_update" name="frm">
        <input type="hidden" id="code" name="code" value=${admin.code}>
        <input type="hidden" id="code" name="adminPassword" value=${admin.adminPassword}>
        <div class="form-group row">
            <label for="adminName" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="adminName" name="adminName" value=${admin.adminName} required>
            </div>
        </div>

        <div class="form-group row">
            <label for="adminId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="adminId" name="adminId" value=${admin.adminId} required>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">비밀번호 변경</label>
            <div class="col-sm-10">
                <button type="button" class="btn btn-primary" onclick="togglePasswordFields()">비밀번호 변경</button>
            </div>
        </div>

        <div id="passwordFields" style="display: none;">

            <div class="form-group row">
                <label for="newPassword" class="col-sm-2 col-form-label">새 비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="adminPassword" name="newPassword" >
                </div>
            </div>

            <div class="form-group row">
                <label for="confirmNewPassword" class="col-sm-2 col-form-label">새 비밀번호 확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="passwordRef" name="confirmNewPassword" >
                </div>
            </div>
        </div>

        <div class="form-group row">
            <label for="adminEmail" class="col-sm-2 col-form-label">이메일</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="adminEmail" name="adminEmail" value=${admin.adminEmail} required>
            </div>
        </div>

        <div class="form-group row">
            <label for="adminPhone" class="col-sm-2 col-form-label">전화번호</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="adminPhone" name="adminPhone" value=${admin.adminPhone} required>
            </div>
        </div>

        <div class="form-group row">
            <label for="admin" class="col-sm-2 col-form-label">권한</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="admin" name="admin" value=${admin.admin} readonly>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn btn-primary"
                        onclick="return checkNewPassword()">수정</button>
                <button type="reset" class="btn btn-secondary">다시작성</button>
                <button type="button" class="btn btn-info" onclick="location.href='banchan?command=admin_list'">목록</button>
            </div>
        </div>
    </form>
</div>

<script>
    function togglePasswordFields() {
        var passwordFields = document.getElementById('passwordFields');
        if (passwordFields.style.display === 'none') {
            passwordFields.style.display = 'block';
        } else {
            passwordFields.style.display = 'none';
        }
    }
    
    function checkNewPassword() {
    	if(adminPassword.value.length != 0 && passwordRef.value.length != 0) {
    		if(adminPassword.value !== passwordRef.value) {
    			alert ("비밀번호 입력이 일치하지 않습니다.");
    			return false;
    		}
    	}
    	return true;
    }

</script>

</body>
</html>
