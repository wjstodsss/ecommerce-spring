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
    <script type="text/javascript" src="../../resources/js/validator.js"></script>
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
        <form method="post" action="banchan?command=admin_register" name="frm">
        <input type="hidden" id="code" name="code" value="${admin.code}">
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
                <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="adminPassword" required>
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
                <div class="col-sm-10 offset-sm-2">
                    <button type="submit" class="btn btn-primary"
						onclick="return checkPassword()">수정</button>
                    <button type="reset" class="btn btn-secondary">다시작성</button>
                    <button type="button" class="btn btn-info" onclick="location.href='banchan?command=admin_list'">목록</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
