<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/shopping.css">
    <style>
    	.btn {
    		font-size: 0.8rem;
    	}
    </style>
    <script src="../resources/js/member_login4.js"></script>
</head>
<body>
<div id="wrap" class="container">
    <h1 class="text-center">공지사항 리스트 - 관리자 페이지</h1>
     <div class="text-right">
        <a class="btn btn-success" href="banchan?command=notice_write_form">새 글 등록</a>
        <a class="btn btn-primary" href="banchan?command=admin_page">관리자 페이지</a>
        <button class="btn btn-danger" onclick="logout()">로그아웃</button>
    </div>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">내용</th>
            <th scope="col">비밀번호</th>
            <th scope="col">이미지</th>
            <th scope="col">작성시간</th>
            <th scope="col">수정</th>
            <th scope="col">삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.id}</td>
                <td>${board.title}</td>
                <td>${board.author}</td>
                <td>${board.content}</td>
                <td>${board.password}</td>
                <td>${board.imageUrl}</td>
                <td>${board.datePosted}</td>
                
                <td><a class="btn btn-primary" href="banchan?command=notice_update_form&id=${board.id}">게시글 수정</a></td>
                <td><a class="btn btn-danger" href="banchan?command=notice_delete_form&id=${board.id}">게시글 삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
   
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
