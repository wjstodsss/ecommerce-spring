<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="../resources/js/member_login4.js"></script>
    <style>
        .header-nav {
            margin: 10px;
        }
    </style>
</head>
<body class="d-flex flex-column justify-content-center align-items-center vh-100">
    <h1 class="text-center">관리자 페이지</h1>
    <div class="text-center">
    
    	<a href="banchan?command=admin_list" class="btn btn-primary header-nav">관리자 등록</a>
        <a href="banchan?command=product_list" class="btn btn-primary header-nav">제품등록</a>
        <a href="banchan?command=notice_list" class="btn btn-primary header-nav">공지사항</a>
        <a href="banchan?command=qna_list" class="btn btn-primary header-nav">질의응답</a>
        <a href="banchan?command=faq_list" class="btn btn-primary header-nav">자주 찾는 질문</a>
        <a href="banchan?command=review_list" class="btn btn-primary header-nav">구매 후기</a>
        <button onclick="logout()" class="btn btn-danger header-nav">로그아웃</button>
    </div>

    <script>
        // 세션 스토리지에서 토큰을 가져옴
        var adminToken = sessionStorage.getItem("adminToken");
        
        // 토큰이 없으면 로그인 페이지로 리다이렉트
        if (!adminToken) {
            window.location.href = "banchan?command=admin_login_form";
        }
    </script>
</body>
</html>
