`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 상세 페이지</title>
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4144168e9f9cd514608615aac5e437e5"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">



<style>
.heart {
	font-size: 24px;
	cursor: pointer;
	color: #ccc;
}

.heart.active {
	color: red;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<header
		class="d-flex justify-content-between align-items-center p-3 border-bottom">
		<img
			src="https://upload.wikimedia.org/wikipedia/commons/6/69/Airbnb_Logo_Bélo.svg"
			alt="Airbnb 로고" width="120">
		<nav>
			<a href="#" class="me-3">어디든지</a> <a href="#" class="me-3">언제든
				일주일</a> <a href="#" class="me-3">게스트 추가</a>
		</nav>
		<a href="login.jsp" class="btn btn-outline-primary">로그인</a>
	</header>

	<main class="container mt-4">
		<div class="d-flex justify-content-between align-items-center">
			<h1 class="fw-bold">🌟 남양주 최고의 전망! 감성 숙소</h1>
			<span class="heart" onclick="toggleHeart()">❤️</span>
		</div>
		<p class="text-muted">Sudong-myeon, Namyangju-si, 한국의 별장 전체</p>

		<div class="container mt-4">
			<h3 class="fw-bold">숙소 이미지</h3>
			<div class="row">
				<div class="col-md-6">
					<img
						src="https://images.pexels.com/photos/271618/pexels-photo-271618.jpeg?auto=compress&cs=tinysrgb&w=800"
						class="img-fluid rounded mb-3" alt="숙소 이미지 1">
				</div>
				<div class="col-md-6">
					<img
						src="https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&w=800"
						class="img-fluid rounded mb-3" alt="숙소 이미지 2">
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-6">
				<h3 class="fw-bold">₩296,000 / 박</h3>
				<p>
					<strong>⭐ 4.93 후기 294개</strong>
				</p>
				<label>체크인:</label> <input type="date" id="checkin"
					class="form-control mb-2"> <label>체크아웃:</label> <input
					type="date" id="checkout" class="form-control mb-2"> <label>인원:</label>
				<select id="guests" class="form-control mb-2">
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
				</select>
				<p class="fw-bold">
					총 금액: <span id="totalPrice">₩0</span>
				</p>
				<button class="btn btn-danger w-100" onclick="calculatePrice()">예약하기</button>
			</div>

			<div class="col-md-6">
				<h3>편의시설</h3>
				<ul>
					<li>✅ WiFi</li>
					<li>✅ 무료 주차</li>
					<li>✅ 수영장</li>
					<li>✅ 에어컨</li>
				</ul>
				<h3>숙소 규칙</h3>
				<ul>
					<li>🚫 반려동물 금지</li>
					<li>🚫 금연</li>
					<li>🔇 밤 10시 이후 정숙</li>
				</ul>
			</div>
		</div>

		<h3 class="mt-4">위치</h3>
		<div id="map" style="width: 100%; height: 400px; background: #ddd;"></div>

		<h3 class="mt-4">📝 후기</h3>
		<div id="reviews">
			<div class="review">
				<p>
					<strong>김철수</strong> ⭐⭐⭐⭐⭐
				</p>
				<p>"경치도 좋고, 숙소가 깔끔해서 너무 만족했습니다!"</p>
			</div>
			<div class="review">
				<p>
					<strong>이영희</strong> ⭐⭐⭐⭐☆
				</p>
				<p>"사진보다 더 예쁘고, 조용한 분위기가 최고였어요!"</p>
			</div>
			<div class="review hidden">
				<p>
					<strong>박지훈</strong> ⭐⭐⭐⭐⭐
				</p>
				<p>"재방문 의사 100%! 너무 좋아요."</p>
			</div>
			<button class="btn btn-outline-secondary mt-2"
				onclick="toggleReviews()">후기 더보기</button>
		</div>
	</main>

	<div class="modal fade" id="agreementModal" tabindex="-1"
		aria-labelledby="agreementModalLabel" aria-hidden="true">
		     
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			       
			<div class="modal-content">
				           
				<div class="modal-header">
					             
					<h5 class="modal-title fw-bold" id="agreementModalLabel">숙박시설
						이용 약관 동의</h5>
					             
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					           
				</div>
				           
				<div class="modal-body">
					                           
					<div class="agreement-container">
						                 
						<h2 class="fw-bold">[숙박시설명] 이용 약관</h2>
						                 
						<h3>제1조 (목적)</h3>
						                 
						<p>본 약관은 숙소와 이용자 간의 숙박 계약 및 이용에 관한 권리, 의무 및 책임을 규정함을 목적으로 합니다.</p>
						                              
					</div>
					           
				</div>
				           
				<div class="modal-footer">
					             
					<div class="form-check me-3">
						                 <input type="checkbox" class="form-check-input"
							id="agreementCheckModal">                  <label
							class="form-check-label" for="agreementCheckModal">위 약관에
							동의합니다.</label>              
					</div>
					             
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					             
					<button type="button" class="btn btn-primary"
						id="confirmAgreementBtn" disabled>확인</button>
					           
				</div>
				       
			</div>
			     
		</div>
		   
	</div>

	   
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	   
	<script>
    // ... 기존 JavaScript 코드 ...

    // 예약하기 버튼 클릭 시 약관 동의 모달 표시
    document.querySelector('.btn-danger').addEventListener('click', function() {
        var agreementModal = new bootstrap.Modal(document.getElementById('agreementModal'));
        agreementModal.show();
    });

    // 모달 내 약관 동의 체크박스 이벤트
    document.getElementById('agreementCheckModal').addEventListener('change', function() {
        document.getElementById('confirmAgreementBtn').disabled = !this.checked;
    });

    // 모달 내 확인 버튼 클릭 시 (실제 예약 처리 로직 구현 필요)
    document.getElementById('confirmAgreementBtn').addEventListener('click', function() {
        if (document.getElementById('agreementCheckModal').checked) {
            alert('약관에 동의하고 예약이 진행됩니다.');
            // 실제 예약 처리 로직 (체크인, 체크아웃, 인원 정보 등 서버로 전송)
            calculatePrice(); // 기존 예약하기 기능 호출 (필요에 따라 수정)
            var agreementModal = bootstrap.Modal.getInstance(document.getElementById('agreementModal'));
            agreementModal.hide();
        } else {
            alert('약관에 동의해야 예약할 수 있습니다.');
        }
    });

    // 페이지 로드 시 지도 표시
    window.onload = initKakaoMap;
</script>


	<script>
    // 카카오맵 초기화 함수
    
    function initKakaoMap() {
        var container = document.getElementById('map'); // 지도 표시 영역
        var options = {
            center: new kakao.maps.LatLng(37.653, 127.236), // 남양주 좌표
            level: 5 // 확대 레벨 (낮을수록 더 확대)
        };

        var map = new kakao.maps.Map(container, options); // 지도 생성
        var marker = new kakao.maps.Marker({ 
            position: new kakao.maps.LatLng(37.653, 127.236), 
            map: map 
        });
    }

    // 찜하기(하트) 기능
    function toggleHeart() {
        let heart = document.querySelector(".heart");
        heart.classList.toggle("active");
        alert(heart.classList.contains("active") ? "찜 목록에 추가되었습니다!" : "찜 목록에서 제거되었습니다.");
    }

    // 총 숙박 금액 계산
    function calculatePrice() {
        let checkin = new Date(document.getElementById("checkin").value);
        let checkout = new Date(document.getElementById("checkout").value);
        let nights = (checkout - checkin) / (1000 * 60 * 60 * 24);
        let pricePerNight = 296000;
        
        if (nights > 0) {
            document.getElementById("totalPrice").innerText = "₩" + Number(nights * pricePerNight).toLocaleString();
        } else {
            alert("체크인과 체크아웃 날짜를 올바르게 선택하세요!");
        }
    }

    // 후기 더보기 기능
    function toggleReviews() {
        document.querySelectorAll(".review.hidden").forEach(el => el.classList.toggle("hidden"));
    }

    // 페이지 로드 시 지도 표시
    window.onload = initKakaoMap;
</script>

</body>
</html>
