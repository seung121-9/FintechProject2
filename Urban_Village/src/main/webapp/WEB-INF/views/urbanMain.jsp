<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>A</title>

<style>
body {
   font-family: sans-serif;
   margin: 0;
   padding: 0;
   display: flex;
   flex-direction: column;
   min-height: 100vh;
   /* Ensure body takes at least the full viewport height */
}

.container {
   width: 80%;
   margin: 0 auto;
   flex-grow: 1; /* Allow container to grow and push footer down */
}

.header {
   display: flex;
   justify-content: space-between;
   align-items: center;
   padding: 15px 20px;
   border-bottom: 1px solid #ddd;
}

.header .logo {
   font-size: 24px;
   font-weight: bold;
}

.header .user-links {
   display: flex;
   align-items: center;
}

.header .user-links a {
   text-decoration: none;
   color: #333;
   margin-left: 10px;
}

.search-bar {
   display: flex;
   align-items: center;
   border: 1px solid #ddd;
   border-radius: 5px;
   margin-left: auto; /* Push search bar to the right */
   padding: 5px;
}

.search-bar input[type="text"] {
   border: none;
   padding: 8px;
   margin-right: 5px;
   flex-grow: 1;
}

.search-bar button {
   background-color: #ff5a5f;
   color: white;
   border: none;
   padding: 8px 15px;
   border-radius: 5px;
   cursor: pointer;
}

.categories-container {
   margin-left: 100px;
   display: flex;
   align-items: center;
   padding: 10px 20px;
   margin-bottom: 20px;
   position: relative; /* 필터 버튼의 absolute 기준점 설정 */
}

.categories {
   display: flex;
   align-items: center;
   overflow-x: auto;
   margin-right: 80px; /* 필터 버튼이 차지할 공간 확보 */
}

.categories a {
   display: flex;
   flex-direction: column; /* 아이콘과 텍스트를 세로로 배치 */
   align-items: center; /* 가운데 정렬 */
   margin-right: 50px; /* 아이템 간 간격 */
   text-decoration: none;
   color: #333;
   white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 */
   padding: 0; /* 기존 padding 제거 */
   border: none; /* 기존 border 제거 */
   border-radius: 0; /* 기존 border-radius 제거 */
}

.categories a::before {
   content: ""; /* 가상 요소 생성 */
   display: block;
   width: 24px; /* 아이콘 크기 조절 */
   height: 24px; /* 아이콘 크기 조절 */
   margin-bottom: 5px; /* 아이콘과 텍스트 간 간격 */
   background-size: cover; /* 배경 이미지 크기 조절 */
   background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
   background-position: center; /* 배경 이미지 중앙 정렬 */
}

.categories a:nth-child(1)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/view.png');
   /* 최고의 전망 아이콘 */
}

.categories a:nth-child(2)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/star.png');
   /* 호잇 아이콘 */
}

.categories a:nth-child(3)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/water.png');
   /* 유량 아이콘 */
}

.categories a:nth-child(4)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/peace.png');
   /* 한적 아이콘 */
}

.categories a:nth-child(5)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/best.png');
   /* 최고 아이콘 */
}

.categories a:nth-child(6)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/park.png');
   /* 공원 아이콘 */
}

.categories a:nth-child(7)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/treehouse.png');
   /* 나무집 아이콘 */
}

.categories a:nth-child(8)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/smallhouse.png');
   /* 소형주택 아이콘 */
}

.categories a:nth-child(9)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/trending.png');
   /* 인기급상 아이콘 */
}

.categories a:nth-child(10)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/luxe.png');
   /* Luxe 아이콘 */
}

.categories a:nth-child(11)::before {
   background-image:
      url('${pageContext.request.contextPath}/resources/image/icons/private.png');
   /* 독채 아이콘 */
}

.categories a span {
   font-size: 0.9em; /* 텍스트 크기 조절 */
}

/* 필터 버튼 스타일 */
.filter-button {
   display: flex;
   align-items: center;
   background-color: #f8f8f8;
   color: #333;
   border: 1px solid #ddd;
   border-radius: 20px;
   padding: 8px 15px;
   cursor: pointer;
   position: absolute; /* 절대 위치 설정 */
   top: 50%; /* 세로 중앙 정렬 */
   right: 20px; /* 오른쪽 여백 */
   transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
}

.filter-button .arrow {
   margin-right: 5px;
   font-size: 0.8em;
}

.filter-button .filter-icon {
   margin-right: 5px;
   font-size: 1em;
}

.accommodations {
   display: flex;
   flex-wrap: wrap;
   justify-content: space-around;
}

.accommodation {
   width: 30%;
   margin: 20px;
   border: 1px solid #ddd;
   box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
   box-sizing: border-box;
   border-radius: 15px;
   position: relative;
   overflow: hidden;
}

.accommodation img {
   width: 100%;
   height: 200px;
   object-fit: cover;
   border-radius: 15px;
}

.details {
   padding: 10px;
}

.details h3 {
   margin-top: 0;
}

.details p {
   margin-bottom: 5px;
}

@media ( max-width : 768px) {
   .accommodation {
      width: 45%;
   }
}

@media ( max-width : 480px) {
   .accommodation {
      width: 100%;
   }
}

/* 하트 아이콘 스타일 */
.heart-icon {
   position: absolute;
   top: 15px;
   right: 15px;
   font-size: 24px;
   cursor: pointer;
   color: #ccc;
   transition: color 0.3s ease-in-out;
}

.heart-icon.liked {
   color: red;
}

/* Footer 스타일 */
.footer {
   background-color: #f8f8f8;
   padding: 20px;
   text-align: center;
   border-top: 1px solid #ddd;
   font-size: 0.8em;
   color: #777;
}

.footer-links {
   margin-bottom: 10px;
}

.footer-links a {
   color: #777;
   text-decoration: none;
   margin: 0 10px;
}

.footer-details {
   line-height: 1.5;
}
</style>
<script>
   function toggleHeart(icon) {
      if (icon.classList.contains("liked")) {
         icon.innerHTML = "&#9825;"; // 빈 하트
         icon.classList.remove("liked");
      } else {
         icon.innerHTML = "&#9829;"; // 채워진 하트
         icon.classList.add("liked");
      }
   }
</script>
</head>
<body>
   <div class="container">
      <div class="header">
         <div class="logo">
            Urban&Villiage
            <!-- <img
               src="/Urban_Village/resources/image/icons/bbb.jpg"
               alt="Urban&Villiage 로고" style="width: 350px; height: auto;"> -->
         </div>
         <div class="search-bar">
            <input type="text" placeholder="여행지를 검색하세요">
            <button>검색</button>
         </div>
         <div class="user-links">
            <a href="/Urban_Village/urban/member/loginForm">로그인</a>
            <a href="/Urban_Village/urban/joinForm">회원가입</a>
         </div>
      </div>
      <div class="categories-container">
         <div class="categories">
            <a href="#">최고의 전망</a> <a href="#">호잇</a> <a href="#">유량</a> <a
               href="#">한적</a> <a href="#">최고</a> <a href="#">공원</a> <a href="#">한옥</a>
            <a href="#">소형주택</a> <a href="#">인기급상</a> <a href="#">Luxe</a> <a
               href="#">독채</a>
         </div>
      </div>

      <div class="accommodations">
         <div class="accommodation">
            <span class="heart-icon" onclick="toggleHeart(this)">&#9825;</span>
            <img
               src="${pageContext.request.contextPath}/resources/image/image2.jpg"
               alt="숙소 이미지">
            <div class="details">
               <h3>한국 Gangha-myeon, Yangpy...</h3>
               <p>★ 5.0 한국 가평군</p>
               <p>4월 12일 - 18일</p>
               <p>₩ 183,729 / 박</p>
               <p>게스트 한마디: 정말 예쁘고 깔끔한 곳....</p>
            </div>
         </div>
         <div class="accommodation">
            <span class="heart-icon" onclick="toggleHeart(this)">&#9825;</span>
            <img
               src="${pageContext.request.contextPath}/resources/image/image1.jpg"
               alt="숙소 이미지">
            <div class="details">
               <h3>한국 Gangha-myeon, Yangpy...</h3>
               <p>★ 5.0 한국 가평군</p>
               <p>4월 12일 - 18일</p>
               <p>₩ 183,729 / 박</p>
               <p>게스트 한마디: 정말 예쁘고 깔끔한 곳....</p>
            </div>
         </div>
         <div class="accommodation">
            <span class="heart-icon" onclick="toggleHeart(this)">&#9825;</span>
            <img
               src="${pageContext.request.contextPath}/resources/image/image3.jpg"
               alt="숙소 이미지">
            <div class="details">
               <h3>한국 Gapyeong-eup, Gapyeo...</h3>
               <p>★ 4.6 한국 가평군</p>
               <p>4월 20일 - 25일</p>
               <p>₩ 303,553 / 박</p>
               <p>게스트 한마디: 장보고 바로 오기 편했어요...</p>
            </div>
         </div>
         <div class="accommodation">
            <span class="heart-icon" onclick="toggleHeart(this)">&#9825;</span>
            <img
               src="${pageContext.request.contextPath}/resources/image/image4.jpg"
               alt="숙소 이미지">
            <div class="details">
               <h3>한국 Okcheon-myeon, Yangp...</h3>
               <p>★ 4.86 한국 가평군</p>
               <p>5월 7일 - 12일</p>
               <p>₩ 184,871 / 박</p>
            </div>
         </div>
         <div class="accommodation">
            <span class="heart-icon" onclick="toggleHeart(this)">&#9825;</span>
            <img
               src="${pageContext.request.contextPath}/resources/image/image5.jpg"
               alt="숙소 이미지">
            <div class="details">
               <h3>한국 Gangha-myeon, Yangpy...</h3>
               <p>★ 4.95 한국 가평군</p>
               <p>6월 1일 - 6일</p>
               <p>₩ 155,376 / 박</p>
            </div>
         </div>
         <div class="accommodation">
            <span class="heart-icon" onclick="toggleHeart(this)">&#9825;</span>
            <img
               src="${pageContext.request.contextPath}/resources/image/image6.jpg"
               alt="숙소 이미지">
            <div class="details">
               <h3>한국 Gangha-myeon, Yangpy...</h3>
               <p>★ 4.95 한국 가평군</p>
               <p>4월 12일 - 17일</p>
               <p>₩ 183,729 / 박</p>
            </div>
         </div>
      </div>
   </div>

   <div class="footer">
      <div class="footer-links">
         <a href="#">© 2025 Urban&Villiage, Inc.</a> <a href="#">개인 정보 처리
            방침</a> <a href="#">쿠키 정책</a> <a href="#">이용 약관</a> <a href="#">사이트 맵</a>
         <a href="#">한국의 변경된 환불 정책</a> <a href="#">회사 세부 정보</a>
      </div>
      <div class="footer-details">
         웹사이트: Urban&Villiage Ireland UC, private unlimited company, 8 Hanover
         Quay, Dublin 2, D02 DP23 Ireland. (Dermot Clark, Allan Pättwell,
         Andrea Finnegan, VAT 번호: IE9827384L) <a href="mailto:naver.com">알아서
            찾아보쇼</a>. 사이트, 010-1111-1111. 호스팅 서비스 제공업체가 아닙니다. 본 서비스에서 이루어지는 숙박 계약의
         당사자가 아닙니다. 이용자에게 숙소를 제공하는 호스트에게 있습니다.
      </div>
   </div>
   
</body>
</html>