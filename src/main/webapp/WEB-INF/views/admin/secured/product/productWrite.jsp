<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록 - 관리자 페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../resources/js/product.js"></script>
    <script src="../resources/js/member_login4.js"></script>
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
        <h1 class="text-center">상품 등록 - 관리자 페이지</h1>
        <form method="post" action="banchan?command=product_write" enctype="multipart/form-data" name="frm">
            <div class="form-group row">
                <label for="productName" class="col-sm-2 col-form-label">상품명</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="productName" name="productname" placeholder="상품명을 입력하세요" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="price" class="col-sm-2 col-form-label">가격</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="price" name="price" placeholder="가격을 입력하세요" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="category" class="col-sm-2 col-form-label">카테고리</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="category" name="category" placeholder="카테고리를 입력하세요" value="${product.category}" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="pictureUrl" class="col-sm-2 col-form-label">사진</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control-file" id="pictureUrl" name="pictureUrl">
                    <small class="form-text text-muted">(주의사항 : 이미지를 변경하고자 할때만 선택하시오)</small>
                </div>
            </div>
            <div class="form-group row">
                <label for="description" class="col-sm-2 col-form-label">설명</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="description" name="description" rows="5" placeholder="상품 설명을 입력하세요"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <button type="submit" class="btn btn-primary" onclick="return productCheck()">등록</button>
                    <button type="reset" class="btn btn-secondary">다시작성</button>
                    <button type="button" class="btn btn-info" onclick="location.href='banchan?command=product_list'">목록</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
