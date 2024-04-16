function productCheck() {
	if (document.frm.productname.value.length == 0) {
		alert("품명을 써주세요");
		frm.productname.focus();
		return false;
	}
	if (document.frm.price.value.length == 0) {
		alert("가격을 써주세요");
		frm.price.focus();
		return false;
	}
	if (isNaN(document.frm.price.value)) {
		alert("숫자를 입력해야 합니다");
		frm.price.focus();
		return false;
	}

	if (isNaN(document.frm.category.value)) {
		alert("숫자를 입력해야 합니다");
		frm.price.focus();
		return false;
	}
	return true;
}

function handleClick(element) {
	let valueToSend = element.id;
	let formDTO = document.createElement("form");
	formDTO.setAttribute("method", "post");
	formDTO.setAttribute("action", "banchan?command=product_set");
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "category");
	input.setAttribute("value", valueToSend);
	formDTO.appendChild(input);
	document.body.appendChild(formDTO);
	formDTO.submit();
}

function sliderHiddenAndStop() {
	document.getElementById("slider").style.display = "none";
	sliderStop();
}

var cartItems = JSON.parse(sessionStorage.getItem('cartItems')) || {};

function addToCart(product, callbackMethod) {
	var quantity = parseInt(document.getElementById("quantity" + product).value);
	var productImageUrl = document.getElementById("image" + product).getAttribute("src");
	var productName = document.getElementById("name" + product).innerText;
	// HTML 코드에서 가격 텍스트를 가져오기
	var priceText = document.getElementById("price" + product).innerText;

	// 숫자 부분만 추출하여 가격으로 사용
	var price = parseInt(priceText.match(/\d+/)[0]);


	// 장바구니에 해당 상품이 이미 있는지 확인
	if (cartItems.hasOwnProperty(product)) {
		// 이미 장바구니에 있는 경우 수량과 나머지 정보 모두 업데이트
		cartItems[product]['quantity'] += quantity;
		cartItems[product]['imageUrl'] = productImageUrl;
		cartItems[product]['productName'] = productName;
		cartItems[product]['price'] = price;
	} else {
		// 장바구니에 없는 경우 새로운 상품으로 추가
		cartItems[product] = {
			id: product,  // 상품의 고유 ID
			imageUrl: productImageUrl,
			productName: productName,
			quantity: quantity,  // 새로운 상품의 수량 설정
			price: price  // 새로운 상품의 수량 설정
		};
	}

	sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
	// 장바구니 업데이트
	callbackMethod();
}

function showCart() {
	updateCart();
}

var totalAmount = 0;
// 장바구니 업데이트 함수
function updateCart() {
	let i = 0;
	console.log("언제 바뀌는지 지켜보겠")
	var cartList = $("#cartList");
	cartList.empty(); // 기존 목록 초기화

	// 장바구니 테이블 생성
	var table = $("<table>").addClass("table"); // 부트스트랩 테이블 클래스 추가

	// 테이블 헤더 생성
	var headerRow = $("<tr>");

	// 전체 선택 체크박스 헤더 열
	var selectAllHeader = $("<th>");
	var selectAllCheckbox = $("<input>").attr({
		type: "checkbox",
		id: "selectAllCheckbox"
	}).change(function() {
		var checkboxes = $("#cartList input[type='checkbox']");
		checkboxes.prop("checked", $(this).prop("checked"));


		updateTotalAmount();
	});
	selectAllHeader.append(selectAllCheckbox);
	headerRow.append(selectAllHeader);

	// 상품명 헤더 열
	var productHeader = $("<th>").text("상품명");
	headerRow.append(productHeader);

	// 이미지 헤더 열
	var imageHeader = $("<th>").text("이미지");
	headerRow.append(imageHeader);

	// 수량 헤더 열
	var quantityHeader = $("<th>").text("수량");
	headerRow.append(quantityHeader);

	// 가격 헤더 열
	var priceHeader = $("<th>").text("가격");
	headerRow.append(priceHeader);

	// 테이블 헤더 추가
	table.append(headerRow);

	// 총 구매 예정 금액을 저장할 변수

	// 장바구니 목록 갱신
	$.each(cartItems, function(item, details) {
		var row = $("<tr>");

		// 체크박스 열
		var checkboxCell = $("<td>");
		var checkbox = $("<input>").attr({
			type: "checkbox",
			id: "selectId" + i++,
			name: "selectId",
			value: item
		}).change(function() {
			var isChecked = $(this).prop("checked");
			var itemPrice = parseInt($(this).closest("tr").find("input[name='amount']").val());
			if (isChecked) {
				console.log(totalAmount + "+")
				totalAmount += itemPrice;
			} else {
				console.log(totalAmount + "-")
				totalAmount -= itemPrice;
			}
			$("#totalAmount").text(totalAmount); // 총 구매 예정 금액 업데이트
		});
		checkboxCell.append(checkbox);
		row.append(checkboxCell);

		// 상품명 열
		var productCell = $("<td>").text(details.productName);
		row.append(productCell);

		// 이미지 열
		var imageCell = $("<td>").append($("<img>").attr({
			src: details.imageUrl,
			name: "selectImageUrl",
			style: "max-width: 60px; max-height: 60px;"
		}));
		row.append(imageCell);

		// 수량 입력 열
		var quantityCell = $("<td>");
		var quantityInput = $("<input>").attr({
			type: "number",
			min: 0,
			value: details.quantity,
			id: "selectQuantity",
			name: "selectQuantity",
			style: "max-width: 60px; max-height: 60px;"
		}).change(function() {
			var newQuantity = parseInt($(this).val());
			changeQuantity(details.id, newQuantity);
			priceInput.val(newQuantity * details.price);
		});
		quantityCell.append(quantityInput);
		row.append(quantityCell);

		// 가격 입력 열
		var priceCell = $("<td>");
		var priceInput = $("<input>").attr({
			name: "amount",
			type: "number",
			min: 0,
			value: details.price * details.quantity,
			disabled: true
		}).css({
			maxWidth: "150px",
			maxHeight: "60px"
		});
		priceCell.append(priceInput);
		row.append(priceCell);

		// 초기 체크박스 상태에 따라 총 구매 예정 금액 계산
		if (checkbox.prop("checked")) {
			totalAmount += details.price * details.quantity;
		}

		table.append(row);
	});

	// 총 구매 예정 금액 열 추가
	var totalRow = $("<tr>");
	var totalCell = $("<td>").attr("colspan", "4").text("총 구매 예정 금액:");
	var totalAmountCell = $("<td>").attr("id", "totalAmount").text(totalAmount);
	totalRow.append(totalCell, totalAmountCell);
	table.append(totalRow);

	// 테이블을 cartList에 추가
	$("#cartList").append(table);

	// 장바구니 모달 열기
	$("#cartModal").modal("show");
}


function deleteSelectedItems() {
	var checkboxes = document.querySelectorAll("#cartList input[type='checkbox']");
	checkboxes.forEach(function(checkbox) {
		if (checkbox.checked) {
			delete cartItems[product];
		}
	});

	// 세션 스토리지에 장바구니 정보 저장
	sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
	// 장바구니 업데이트
	updateCart();
	// 총 구매 예정 금액 업데이트
	$("#totalAmount").text(totalAmount);
}


function buySelectedItems() {
	// 체크된 체크박스 요소들을 선택
	var checkedCheckboxes = $("#cartList input[type='checkbox']:checked");

	var selectedItems = [];
	// 각 체크된 체크박스에 대해 처리
	checkedCheckboxes.each(function() {
		// 체크된 체크박스의 부모 행을 선택하여 해당 상품의 정보를 가져옴
		var row = $(this).closest("tr");
		var itemId = row.find("input[name='selectId']").val(); // 상품 ID
		var itemQuantity = row.find("input[name='selectQuantity']").val(); // 상품 수량
		var itemAmount = row.find("input[name='amount']").val();
		var itemImageUrl = row.find("img[name='selectImageUrl']").attr('src');

		if (itemId != null && itemQuantity != null) {
			selectedItems.push({ id: itemId, quantity: itemQuantity, price: itemAmount, imageUrl: itemImageUrl });
			alert(itemQuantity)
		}
	});

	if (selectedItems.length > 0) {
		// 선택된 상품 정보를 세션 스토리지에 저장
		sessionStorage.setItem("selectedItems", JSON.stringify(selectedItems));

		// 결제 페이지로 이동
		window.location.href = "banchan?command=payment-form";
	} else {
		console.log("No selected items to send to the server");
	}
}



function clearCart() {
	// 세션 스토리지의 데이터 지우기
	sessionStorage.clear();
}


function updateTotalAmount() {
	var isSelectAllChecked = $("#selectAllCheckbox").prop("checked");
	var isFirstCheckbox = true;
	if (isSelectAllChecked) {
		$("#cartList input[type='checkbox']:checked").each(function() {
			if (!isFirstCheckbox) {
				var itemPrice = parseInt($(this).closest("tr").find("input[name='amount']").val());
				console.log(itemPrice);
				totalAmount += itemPrice;
			} else {
				isFirstCheckbox = false;
			}
		});
	} else {
		totalAmount = 0;
	}


	$("#totalAmount").text(totalAmount);
}


// 상품 수량 변경 함수
function changeQuantity(product, quantity) {
	// 장바구니의 해당 상품의 수량을 변경합니다.
	cartItems[product]["quantity"] = quantity;

	// 세션 스토리지에 장바구니 정보 저장
	sessionStorage.setItem('cartItems', JSON.stringify(cartItems));

	// 장바구니 업데이트
	updateCart();
}

// 선택된 상품 삭제 함수
function deleteSelectedItems() {
	var checkboxes = document.querySelectorAll("#cartList input[type='checkbox']");
	checkboxes.forEach(function(checkbox) {
		if (checkbox.checked) {
			var product = checkbox.value;
			delete cartItems[product];
		}
	});

	// 세션 스토리지에 장바구니 정보 저장
	sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
	// 장바구니 업데이트
	updateCart();
	updateTotalAmount();
}

/* top banner *//* topBanner 상단 배너 
	v0.01 : 240110 addEventListen활용 button을 click하면 topBanner영역 display: none  
	*/

function topBannerDisplayNone() {
	document.getElementById("topBanner").style.display = "none";
}

function handleCustomClick() {
	var linkToClick = document.getElementById("9"); // 클릭하고자 하는 링크를 가져옵니다.
	linkToClick.click(); // 링크를 클릭합니다.
}



/* 이벤트 */
function handleEnterKey(event) {
	if (event.key === "Enter") {
		let searchWord = document.getElementById("inputWord").value.trim();
		if (searchWord) {
			sendSearchForm(searchWord);
		} else
			alert("검색어를 입력하세요")
	}
}

function handleClickKey(event) {
	let searchWord = document.getElementById("inputWord").value.trim();
	if (searchWord) {
		sendSearchForm(searchWord);
	} else
		alert("검색어를 입력하세요")
}

function sendSearchForm(searchWord) {
	let formDTO = document.createElement("form");
	formDTO.setAttribute("method", "post");
	formDTO.setAttribute("action", "banchan?command=search");
	var input = document.createElement("input");
	input.setAttribute("type", "hidden");
	input.setAttribute("name", "searchWord");
	input.setAttribute("value", searchWord);
	formDTO.appendChild(input);
	document.body.appendChild(formDTO);
	formDTO.submit();
}

function goToDelivery() {
	window.location.href = "banchan?command=info";
}

function goToBuyInfo() {
	window.location.href = "banchan?command=buy-info";
}

function deletePayedItem() {
	var tdElements = document.querySelectorAll("td[name='id']");
	tdElements.forEach(function(td) {
		var id = td.innerText; // 혹은 td.innerHTML;
		alert(cartItems[id])
		delete cartItems[id]
		
		alert(cartItems[id])
	});
	
	sessionStorage.setItem('cartItems', JSON.stringify(cartItems));
}


