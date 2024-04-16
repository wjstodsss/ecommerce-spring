<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>꼴뚜기의 첫번째 프로젝트</title>
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/css/member_login.css" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../resources/js/member_login4.js"></script>
<script src="../resources/js/board_util4.js"></script>
<script src="../resources/js/product2.js"></script>
<script src="../resources/js/member_join2.js"></script>
<style>
/* 네비게이션 바 스타일 */
.main-content {
	
}

.board-content {
	width: 980px;
	margin: 0 auto;
}

.board-back {
	justify-content: center;;
}

.board-wrap {
	width: 980px;
	margin: 0 auto;
}

.nav-side {
	height: 100%;
	background-color: #eee;
}

.side-nav {
	font-size: 1rem;
	font-family: "Noto Sans KR", dotum, 돋움, gulim, 굴림, sans-serif;
	color: rgb(0, 0, 0);
	background-color: #eeeeee;
	margin: 10px 5px;
	font-weight: 600;
	board-bottom: 1px solid white;
}

.nav-item {
	text-align: center;
}

.max-width-col-overflow {
	max-width: 480px;
	overflow: hidden;
}

.pagination-button {
	margin: 1px 4px;
	background: none;
}

.pageContainer {
	text-align: center;
	
}
</style>
</head>
<body
	onload="checkLoginState(); fetchBoardList(getByType()); displayCreateBtn()">

	<!-- /* header */ -->
	<header>
		<div id="topHeader">
			<div id="appDown">
				<button>진가네 앱 다운로드 ▼</button>
			</div>
			<nav>
				<ul>
					<li><input type="button" value="로그인" id="loginButton"
						class="header-nav"></li>
					<li>|</li>
					<li><input type="button" class="header-nav"
						onclick="goToRegisterForm()" value='회원가입'></li>
					<li>|</li>
					<li><input type="button" class="header-nav"
						onclick="goToBoard()" value='고객센터'></li>
					<li>|</li>
					<li><a href="#" class="header-nav">주문조회</a></li>
					<li>|</li>
					<li><a href="#" id="cart" class="header-nav"
						onclick="showCart()">장바구니</a></li>
					<li>|</li>
					<li><input type="button" id="loginButton"
						onclick="goToAdminLoginForm()" class="header-nav" value='관리자'></li>
				</ul>
			</nav>
		</div>

		<div id="middleHeader">
			<nav>
				<ul>
					<li><a href="#" onclick="handleCustomClick()">시그니처</a></li>
					<li>|</li>
					<li><a href="#" onclick="goToReview()">반찬후기</a></li>
					<li>|</li>
					<li><a href="banchan?command=info">배송안내</a></li>
				</ul>
			</nav>

			<div onclick="goToIndex()" id="logo">
				<a href="#"> <img src="/resources/img/header_middle/logo.png"
					alt="진가네로고">
				</a>
			</div>

			<div id="searchInput">
				<input id="inputWord">
				<button id="searchButton"></button>
			</div>
		</div>
		<div id="bottomHeader">
			<button onclick="handleClick(this)" id="0">하루반찬세트</button>
			<nav>
				<ul>
					<li><a href="#" class="jingaTitle" id="9"
						onclick="handleClick(this)">진가네 시그니처</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="1">진가네 명품김치</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="2">밑반찬</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="3">국·찌개 </a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="4">메인반찬</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="5">전</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="6">나물반찬</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="7">장아찌</a></li>
					<li><a href="#" class="jingaTitle" onclick="handleClick(this)"
						id="8">대용량</a></li>
				</ul>
			</nav>

		</div>
	</header>
	<div class="board-back">
		<div class="board-wrap">
			<!-- 네비게이션 사이드바 -->
			<div class="main-content" id="boardListContainer">
				<div class="row">
					<div class="col">
						<ul class="nav flex-column nav-side">
							<li class="nav-item"><input type="button" class="side-nav"
								onclick="fetchBoardList('notice')" value='공지사항'></li>
							<li class="nav-item"><input type="button" class="side-nav"
								onclick="fetchBoardList('qna')" value='Q&A'></li>
							<li class="nav-item"><input type="button" class="side-nav"
								onclick="fetchBoardList('faq')" value='자주하는 질문'></li>
							<li class="nav-item"><input type="button" class="side-nav"
								onclick="fetchBoardList('review')" value='상품후기'></li>
						</ul>
					</div>

					<input type="hidden" id="navTitle" value="notice">

					<!-- 게시판 컨텐츠 -->
					<div class="col-9">
						<div class="col text-right">

							<button onclick="goToModalForm()" class="btn btn-primary"
								id="newPostBtn">게시물 등록</button>
						</div>
						<h2 class="my-4" id="boardTitle"></h2>

						<div class="row">
							<div class="col">
								<table class="table table-striped" id="postTable">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
										</tr>
									</thead>
									<tbody id="postListBody">
										<!-- 여기에 서버에서 받아온 게시물이 동적으로 추가됩니다 -->
									</tbody>
								</table>
								<div class="pageContainer" id="pagination"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 게시물 등록 모달창 -->
	<div class="modal fade" id="formModal" tabindex="-1" role="dialog"
		aria-labelledby="cartModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cartModalLabel">자주하는 질문</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="frm" enctype="multipart/form-data" method="post">


						<div class="form-group">
							<label for="title">제목 *</label> <input type="text"
								class="form-control" id="title" name="title" required>
						</div>

						<div class="form-group">
							<label for="username">작성자 *</label> <input type="text"
								class="form-control" id="username" name="author" required>
						</div>

						<div class="form-group">
							<label for="pass">비밀번호 *</label> <input type="password"
								class="form-control" id="pass" name="password" required>
							<small class="form-text text-muted">게시물 수정 삭제시 필요합니다.</small>
						</div>

						<div class="form-group" id="upload">
							<label for="imageUrl" id="picture">사진</label> <input type="file"
								class="form-control" id="imageUrl" name="imageUrl"
								onchange="previewImage(event)" accept="image/*"> <img
								id="imagePreview" class="img-fluid" style="display: none;">
						</div>


						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" id="content" name="content"
								rows="5"></textarea>
						</div>
						<button type="submit" class="btn btn-primary"
							onclick="goToWriteAction()">등록</button>
						<button type="reset" class="btn btn-secondary">다시 작성</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 게시물 수정 X 삭제 모달창 -->
	<div class="modal fade" id="detailFormModal" tabindex="-1"
		role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cartModalLabel">자주하는 질문</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="updateFrm" enctype="multipart/form-data" method="post"
						onsubmit="doAction()">
						<input type="hidden" id="detailId" value="" name="detailId">
						<input type="hidden" id="detailPassword" value=""
							name="detailPassword"> <input type="hidden"
							name="nonmakeImg" id="nonmakeImg">

						<div class="form-group">
							<label for="title">제목 *</label> <input type="text"
								class="form-control" id="detailTitle" name="detailTitle"
								required>
						</div>

						<div class="form-group">
							<label for="username">작성자 *</label> <input type="text"
								class="form-control" id="detailAuthor" name="detailAuthor"
								required>
						</div>

						<div class="form-group" id="detailUpload">
							<label for="updateImage" id="updateImageLabel">사진</label> <input
								type="file" class="form-control" id="updateImage"
								name="detailImageUrl" onchange="previewImage(event)"
								accept="image/*" src=""> <img id="detailImageUrl">
						</div>


						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" id="detailContent"
								name="detailContent" rows="5"></textarea>
						</div>

						<div class="form-group">
							<label for="pass">비밀번호</label> <input type="password"
								class="form-control" id="checkPasswordRef"
								name="checkPasswordRef"> <small
								class="form-text text-muted">수정이나 삭제를 원하시면 비밀번호를 입력해 주세요</small>
						</div>

						<button type="button" class="btn btn-primary"
							onclick="doAction('update')">수정하기</button>
						<button type="button" class="btn btn-primary"
							onclick="doAction('delete')">삭제하기</button>
						<button type="reset" class="btn btn-secondary">다시 작성</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- 장바구니 모달 -->
	<div class="modal fade" id="cartModal" tabindex="-1" role="dialog"
		aria-labelledby="cartModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cartModalLabel">장바구니</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-12" id="cartList"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger"
						onclick="deleteSelectedItems()">선택된 상품 삭제</button>
					<button type="button" class="btn btn-success"
						onclick="buySelectedItems()">선택된 상품 구매</button>
				</div>
			</div>
		</div>
	</div>




	<footer id="footer">
		<div id="info01">
			<img src="/resources/img/footer/footer001.png" alt="배송안내">
		</div>

		<div id="info02">
			<p>공지사항</p>
			<div id="footerSlider"></div>
		</div>
		<div id="info03">
			<p>가이드</p>
			<div>
				<img src="/resources/img/footer/footer002.png" alt="배송" class="icon"
					onclick="goToDelivery()">
				<p>배송안내</p>
			</div>
			<div>
				<img src="/resources/img/footer/footer003.png" alt="혜택" class="icon"
					onclick="goToBuyInfo()">
				<p>첫구매혜택</p>
			</div>
			<div>
				<img src="/resources/img/footer/footer004.png" alt="고객센터"
					class="icon" onclick="goToBoard()">
				<p>고객센터</p>
			</div>
		</div>
		<div id="footerBottom">
			<p id="top">
				<a href="#">이용약관</a> <a href="#">개인정보처리방침</a>
			</p>


			<p id="middle1">
				주식회사진가네| 대표이사 : 진성엽| 사업자등록번호 : 611-87-00645 [사업자 정보확인]| 통신판매업신고 :
				2018-대구동구-0813호<br> 주소 : 대구광역시 동구 반야월북로2길16-6|
				대표번호:1899-7143|개인정보담당자 : 우윤화|이메일 : wooyouna@naver.com<br> 고객님의
				안전거래를 위해 현금 등으로 결제 시 kg이니시스의 구매안전 서비스를 이용하실 수 있습니다.
			</p>
			<img src="/resources/img/footer/footer005.png" alt="관련업체">
			<p id="right">
				<span>고객센터 & 단체구매문의</span><br> <span id="tel">1899-7143</span><br>
				평일 09:00~16:00<br> 점심시간 11:30~12:30<br> 토·일요일/공휴일 휴무
			</p>
		</div>
	</footer>
</body>
<script>

document.getElementById("inputWord").addEventListener("keypress", handleEnterKey);
document.getElementById("searchButton").addEventListener("click", handleClickKey);

	/* 공지사항 
	 v0.01: 240110 setInterval함수를 활용하여 추가한 기능, 정해진 공지사항이 시간 마다 변경 
	 */
	let news = [ "아이스팩 변경 공지드립니다.     2022-03-21",
			"진가네반찬 등급별안내     2019-07-02", "진가네반찬 배송안내     2018-12-19" ]
	let index = 0;
	function newsBoard() {

		document.getElementById("footerSlider").innerHTML = news[index];
		index++;
		if (index >= news.length)
			index = 0;
	}

	let boardSetInterval;
	function startBoardInterval() {
		let boardSetInterval = setInterval(newsBoard, 2000);
	}

	function stopBoardInterval() {
		clearInterval(boardSetInterval, 2000);
	}
</script>
</html>
