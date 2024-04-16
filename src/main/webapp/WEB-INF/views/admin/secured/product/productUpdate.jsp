<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 - 관리자 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript" src="../../resources/js/product.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">상품 수정 - 관리자 페이지</h1>
		<form method="post" action="banchan?command=product_update"
			enctype="multipart/form-data" name="frm">
			<input type="hidden" name="code" value="${product.code}"> <input
				type="hidden" name="nonmakeImg" value="${product.pictureUrl}">
			<div class="row">
				<div class="col-md-6 border text-center">
					<c:choose>
						<c:when test="${empty product.pictureUrl}">
							<img src="upload/noimage.gif" class="img-fluid">
						</c:when>
						<c:otherwise>
							<img src="upload/${product.pictureUrl}" class="img-fluid">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="productName">상품명</label> <input type="text"
							class="form-control" id="productName" name="productname"
							value="${product.productName}" required>
					</div>
					<div class="form-group">
						<label for="price">가격</label>
						<div class="input-group">
							<input type="number" class="form-control" id="price" name="price"
								value="${product.price}" required>
							<div class="input-group-append">
								<span class="input-group-text">원</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="category">카테고리</label> <input type="text"
							class="form-control" id="category" name="category"
							value="${product.category}" required>
					</div>
					<div class="form-group">
						<label for="pictureUrl">사진</label>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="pictureUrl"
								name="pictureUrl"> <label class="custom-file-label"
								for="pictureUrl">파일 선택...</label>
						</div>
						<small class="form-text text-muted">(주의사항 : 이미지를 변경하고자 할때만
							선택하시오)</small>
					</div>
					<div class="form-group">
						<label for="description">설명</label>
						<textarea class="form-control" id="description" name="description"
							rows="5" required>${product.description}</textarea>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary"
							onclick="return productCheck()">수정</button>
						<button type="reset" class="btn btn-secondary">다시 수정</button>
						<button type="button" class="btn btn-info"
							onclick="location.href='banchan?command=product_list'">목록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
