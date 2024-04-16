<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>꼴뚜기의 첫번째 프로젝트</title>
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="../resources/css/member_login.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="../resources/js/member_login4.js"></script>
<script src="../resources/js/board_util4.js"></script>
<script src="../resources/js/product2.js"></script>
<script src="../resources/js/member_join2.js"></script>
<!-- 부트스트랩 CSS 링크 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* 컨테이너의 최대 크기 설정 */
.container {
	max-width: 980px;
}

/* 상품 카드 간격 설정 */
.mb-3 {
	margin-bottom: 15px;
}

.card-body {
	font-size: 0.8rem;
}

.text-muted {
	overflow: hidden;
	font-size: small;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>

</head>

<body onload="checkLoginState()">
	<!-- /* top banner */ -->
	<div id="topBanner">
		<a> <img src="/resources/img/top_banner/top_banner.jpg">
		</a>
		<button id="topClose"></button>
	</div>

	<!-- /* header */ -->
	<header>
		<div id="topHeader">
			<div id="appDown">
				<button>진가네 앱 다운로드 ▼</button>
			</div>
			<nav>
				<ul>
					<li><input type="button" id="loginButton"
						onclick="goToLoginForm()" class="header-nav" value='로그인'></li>
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
						onclick="handleClick(this)">진가네
							시그니처</a></li>
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

	<!-- /* slider */ -->
	<div id="slider">
		<img src="/resources/img/slide_image/membership_img.jpg" alt="회원가입혜택"
			id="memberShip"> <img
			src="/resources/img/slide_image/mobile_img.jpg" alt="모바일앱쿠폰이벤트"
			id="mobileAward"> <img
			src="/resources/img/slide_image/delivery_img.jpg" alt="배송당일출발"
			id="delivery">
		<ul>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
		</ul>
	</div>

	<!-- 상품 목록 -->
	<div class="container mt-3">
		<div class="row">
			<c:forEach var="i" begin="1" end="8">
				<c:set var="productListName" value="productList${i}" />
				<c:set var="productList" value="${requestScope[productListName]}" />
				<c:if test="${not empty productList}">
					<h5 class="card-title">카테고리 ${i}</h5>
					<div class="overflow-auto" style="white-space: nowrap;">
						<div class="col-md-3 mb-2">
							<div class="d-flex flex-nowrap">
								<c:forEach var="product" items="${productList}">
									<div class="mr-2">
										<div class="card" style="width: 14.7rem;">
											<img src="upload/${product.pictureUrl}" class="card-img-top"
												alt="Product Image" id="image${product.code}">												
											<div class="card-body">
												<h6 class="card-title" id="name${product.code}">${product.productName}</h6>
												<p class="card-text" id="price${product.code}">가격: ${product.price}원</p>
												<input type="number" id="quantity${product.code}" min="0"
													value="1">
												<div>
													<button class="btn btn-primary"
														onclick="addToCart(${product.code}, updateCart)">장바구니</button>
													<button class="btn btn-success"
														onclick="purchase(${product.code})">구매</button>
												</div>
											</div>
											<div class="card-footer">
												<p class="text-muted">상품 요약: ${product.description}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<!-- 장바구니 모달 -->
<div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cartModalLabel">장바구니</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div id="cartList"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-danger float-right mr-2" onclick="deleteSelectedItems()">선택된 상품 삭제</button>
                            <button type="button" class="btn btn-success float-right mr-2" onclick="buySelectedItems()">선택된 상품 구매</button>
                            <a href="NewFile.html">테스트</a>
                        </div>
                    </div>
                </div>
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
				<img src="/resources/img/footer/footer002.png" alt="배송" class="icon" onclick="goToDelivery()">
				<p>배송안내</p>
			</div>
			<div>
				<img src="/resources/img/footer/footer003.png" alt="혜택" class="icon" onclick="goToBuyInfo()">
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

	<script>
	document.getElementById("inputWord").addEventListener("keypress", handleEnterKey);
	document.getElementById("searchButton").addEventListener("click", handleClickKey);
	document.getElementById("topClose").addEventListener("click", topBannerDisplayNone);

	

	
        /* slider */
        /* 메인 슬라이더 페이드 인 페이드 아웃 기능 
        v0.01 : 240107 setTime()메서드에 시간을 입력하며 하드 코딩함
        v0.02 : 240110 로직을 조금 만들어 함수를 활용하지만 개체수 증가시 코드도 함께 증가
        v0.03 : 240115 개체수 증가시 코드 증가 문제 해결 -> 이미지 추가 시 아이디만 배열에 추가
        v0.04 : 240119 웹페이지 포커스 대기간 쌓이는 인터벌로 인한 페이드 인, 아웃 이상 현상 개선/visiblechange이벤트 활용
        */
        
        function fadeInManager() {

            let opacityValueFadeIn = 0;
            function FadeInUnit(image) {
                this.image = image;
                this.fadeIn = function () {
                    document.getElementById(image).style.opacity = opacityValueFadeIn;
                    opacityValueFadeIn += 0.1;
                    if (opacityValueFadeIn >= 1.5) {
                        clearInterval(myFadeIn);
                        opacityValueFadeIn = 0;
                    }
                }
                let myFadeIn = setInterval(this.fadeIn, 100);
            }

            let imageIdIndexFadeIn = 0;
            function repeatFadeIn() {
                const imageId = ["mobileAward", "delivery"];
                if (imageIdIndexFadeIn == imageId.length) {
                    stopFadeInInterval();
                    return
                }
                let createFadeIn = new FadeInUnit(imageId[imageIdIndexFadeIn]);
                imageIdIndexFadeIn++;
            }

            let fadeInInterval = setInterval(repeatFadeIn, 2500);

            function stopFadeInInterval() {
                clearInterval(fadeInInterval);
            }
        }

        function fadeOutManager() {

            let opacityValueFadeOut = 1;
            function FadeOutUnit(image) {
                this.image = image;
                this.fadeOut = function () {
                    document.getElementById(image).style.opacity = opacityValueFadeOut;
                    opacityValueFadeOut -= 0.1;
                    if (opacityValueFadeOut <= -0.7) {
                        clearInterval(myFadeOut);
                        opacityValueFadeOut = 1;
                    }
                }
                let myFadeOut = setInterval(this.fadeOut, 100);
            }

            let imageIdIndexFadeOut = 1;
            function repeatFadeOut() {
                const imageId = ["mobileAward", "delivery"];
                if (imageIdIndexFadeOut < 0) {
                    stopFadeOutInterval();
                    return
                }
                let createFadeOut = new FadeOutUnit(imageId[imageIdIndexFadeOut]);
                imageIdIndexFadeOut--;
            }

            let fadeOutInterval = setInterval(repeatFadeOut, 2500);

            function stopFadeOutInterval() {
                clearInterval(fadeOutInterval);
            }
        }

        let sliderTimer;

        function repeat() {
            setTimeout(fadeOutManager, 0);
            setTimeout(fadeInManager, 6000);
        }

        function sliderStart() {
            setTimeout(repeat, 0);
            sliderTimer = setInterval(repeat, 12000);
        }

        function sliderStop() {
            clearInterval(sliderTimer);
        }

        sliderStart();

        /* 공지사항 
        v0.01: 240110 setInterval함수를 활용하여 추가한 기능, 정해진 공지사항이 시간 마다 변경 
        */
        let news = ["아이스팩 변경 공지드립니다.     2022-03-21", "진가네반찬 등급별안내     2019-07-02", "진가네반찬 배송안내     2018-12-19"]
        let index = 0;
        function newsBoard() {

            document.getElementById("footerSlider").innerHTML = news[index];
            index++;
            if (index >= news.length) index = 0;
        }

        let boardSetInterval;
        function startBoardInterval() {
            let boardSetInterval = setInterval(newsBoard, 2000);
        }

        function stopBoardInterval() {
            clearInterval(boardSetInterval, 2000);
        }
         
       
    </script>
</body>

</html>