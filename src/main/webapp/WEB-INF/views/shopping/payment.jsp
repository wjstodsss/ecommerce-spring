<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제</title>
<!-- 부트스트랩 CSS 파일 로드 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../resources/js/product2.js"></script>
<style>
.image-column img {
	max-width: 60px;
	max-height: 60px;
}
/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
}

/* 테이블 헤더 스타일 */
th {
	background-color: #f2f2f2;
	padding: 8px;
	text-align: left;
	border: 1px solid #ddd;
}

/* 테이블 셀 스타일 */
td {
	border: 1px solid #ddd;
	padding: 8px;
}

/* 이미지 열 스타일 */
.image-column img {
	width: 60px;
	height: 60px;
}

/* 첫 번째 열의 너비 */
.col-1 {
	width: 20%;
}

/* 두 번째 열의 너비 */
.col-2 {
	width: 30%;
}

th, td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container offset-md-4">
		<h1 class="mt-5 mb-3">구매 정보 확인</h1>
		<div class="col-md-6">
			<form action="banchan?command=test" method="post" id='paymentForm'>

				<h2>상품 정보</h2>
				<div id="tableContainer"></div>
				<!-- 구매 정보 -->
				<h2 class="mt-5 mb-3">결제 정보</h2>
				<input type="hidden" name="currentDate" id="currentDate">

				<h6>결제 방법</h6>

				<div class="mb-3">
					<input type="radio" name="payMethod" value="card" id="normal"
						checked> <label class="form-check-label" for="normal">카드</label>
				</div>

				<div class="mb-3">
					<label for="show_pay" class="form-label">보여주기 카드 정보</label> <input
						type="text" class="form-control bg-info" name="show_pay"
						value="카드번호: 1234 mm:12 yy:24 cvc:123 이름:finn" readonly>
				</div>
				<div class="mb-3">
					<label for="cardNumber" class="form-label">카드 번호</label> <input
						type="text" class="form-control" id="cardNumber" name="cardNumber"
						value="1234" placeholder="카드 번호를 입력하세요" required>
				</div>
				<div class="mb-3">
					<label for="expirationMMInput" class="form-label">유효 기간</label>
					<p>MM:</p>
					<input type="text" class="form-control" id="expirationMMInput"
						name="expirationMMInput" placeholder="유효 월을 입력해주세요" maxlength="5"
						value="12" required>
					<p>YY:</p>
					<input type="text" class="form-control" id="expirationYYInput"
						name="expirationYYInput" placeholder="유효 년도를 입력해주세요" maxlength="5"
						value="24" required>
				</div>
				<div class="mb-3">
					<label for="cvv" class="form-label">CVC</label> <input type="text"
						class="form-control" id="cvc" name="cvc" value="123"
						placeholder="CVC를 입력하세요">
				</div>
				<div class="mb-3">
					<label for="cardHolderName" class="form-label">카드 소유자 이름</label> <input
						type="text" class="form-control" id="cardHolderName" value="finn"
						name="cardHolderName" placeholder="카드 소유자 이름을 입력하세요">
				</div>


				<!-- 배송지 정보 입력 -->
				<h2 class="mt-5 mb-3">배송지 정보</h2>
				<div class="mb-3">
					<label for="recipientName" class="form-label">수령인 이름</label> <input
						type="text" class="form-control" id="recipientName"
						name="recipientName" value="꼴뚜기" placeholder="수령인 이름을 입력하세요">
				</div>
				<div class="mb-3">
					<label for="zipcode" class="form-label">우편번호</label>
					<div class="input-group">
						<input type="text" class="form-control" id="zipcode"
							name="zipcode" placeholder="우편번호" size="5" value="16619">
						<button class="btn btn-outline-secondary" type="button"
							onclick="execDaumPostcode()">우편번호검색</button>
					</div>
				</div>
				<div class="mb-3">
					<label for="roadAddress" class="form-label">도로명 주소</label> <input
						type="text" class="form-control" id="roadAddress"
						name="roadAddress" value="경기 수원시 권선구 권선로357번길 30 (서둔동)"
						placeholder="도로명 주소">
				</div>
				<div class="mb-3">
					<label for="jibunAddress" class="form-label">지번 주소</label> <input
						type="text" class="form-control" id="jibunAddress"
						name="jibunAddress" value="경기 수원시 권선구 서둔동 425" placeholder="지번 주소">
				</div>
				<div class="mb-3">
					<label for="detailAddress" class="form-label">나머지 주소</label> <input
						type="text" class="form-control" id="detailAddress"
						name="detailAddress" value="수원역" placeholder="나머지 주소">
				</div>
				<div class="mb-3">
					<label for="phoneNumber" class="form-label">연락처</label> <input
						type="text" class="form-control" id="phoneNumber"
						name="phoneNumber" value="01012341234" placeholder="연락처를 입력하세요">
				</div>


				<!-- 결제 버튼 -->
				<button type="submit" class="btn btn-primary">결제하기</button>
			</form>
		</div>
	</div>


	<!-- 부트스트랩 JavaScript 파일 로드 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script>
		document.getElementById("currentDate").value = getCurrentDate();
		document.getElementById('paymentForm').addEventListener('submit',
				function(event) {
					deletePayedItem();
					alert(sessionStorage.cartItems)
				});

		// 현재 날짜를 가져오는 함수
		function getCurrentDate() {
    var currentDate = new Date();
    return currentDate.toLocaleString();
}
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}
							document.getElementById('zipcode').value = data.zonecode;
							document.getElementById('roadAddress').value = fullRoadAddr;
							document.getElementById('jibunAddress').value = data.jibunAddress;
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}

		// sessionStorage에서 selectedItems 가져오기
		var selectedItemsJson = sessionStorage.getItem("selectedItems");

		// JSON 문자열을 JavaScript 객체로 파싱
		var selectedItems = JSON.parse(selectedItemsJson);
		var totalPrice = 0; // 총 가격을 저장할 변수 초기화

		// 테이블을 생성할 HTML 코드를 담을 변수 초기화
		var tableHtml = "<table>";
		tableHtml += "<tr><th>ID</th><th>상품</th><th>수량</th><th>가격</th></tr>";

		// 각 객체의 속성에 접근하여 테이블 행을 추가
		selectedItems
				.forEach(function(item) {
					var id = item.id; // 상품 ID
					var quantity = item.quantity; // 상품 수량
					var imageUrl = item.imageUrl; // 상품 이미지 URL
					var price = item.price; // 상품 가격

					// 테이블에 행 추가
					tableHtml += "<tr>";
					tableHtml += "<td class='col-1'>" + id + "</td>";
					tableHtml += "<td class='col-2 image-column'><img src='"
					+ imageUrl + "' alt='상품 이미지'></td>";
					tableHtml += "<td class='col-1' name='quantity'>"
							+ quantity + "</td>";
					tableHtml += "<td class='col-2'>"
							+ parseInt(price).toLocaleString('ko-KR') + "</td>";
					tableHtml += "<input type='hidden' name='id' value=" + id + ">";
					tableHtml += "<input type='hidden' name='price' value=" + price + ">";
					tableHtml += "<input type='hidden' name='quantity' value=" + quantity + ">";
					tableHtml += "</tr>";

					totalPrice += parseInt(price); // 가격은 문자열이므로 숫자로 변환하여 합산
				});

		tableHtml += "<tr>";
		tableHtml += "<td colspan='3' class='text-end'>Total Price:</td>"; // 총 가격 레이블
		tableHtml += "<input type='hidden' name='totalPrice' value=" + totalPrice + ">";
		tableHtml += "<input type='hidden' name='totalPrice' value=" + selectedItems + ">";
		tableHtml += "<input type='hidden' name='memberId' value='1'>";
		tableHtml += "<input type='hidden' name='paymentMethod' value='card'>";
		tableHtml += "<td class='col-2'>" + totalPrice.toLocaleString('ko-KR')
				+ "</td>"; // 총 가격 합산값
		tableHtml += "</tr>";

		// 테이블을 닫음
		tableHtml += "</table>";

		// 생성한 HTML 코드를 삽입할 요소를 찾아서 삽입
		document.getElementById("tableContainer").innerHTML = tableHtml;

		function getImageUrl(url) {
			// 현재 페이지의 URL을 가져옴
			var currentPageUrl = window.location.href;
			// 이미지 경로를 생성하여 반환
			return currentPageUrl.replace("views/shopping/payment.jsp", url);
		}
	</script>
</body>
</html>
