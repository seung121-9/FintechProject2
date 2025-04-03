<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>확인 및 결제</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
        }
        .left-section {
            width: 55%;
        }
        .right-section {
            width: 40%;
            background: #f8f9fa;
            padding: 15px;
            border-radius: 10px;
        }
        .total-price {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .small-text {
            font-size: 0.9rem;
            color: gray;
        }
        .logo {
            color: #FF385C;
            font-size: 24px;
            font-weight: bold;
            position: absolute;
            top: 20px;
            left: 20px;
        }
    </style>
</head>
<body>
    <div class="logo">Airbnb</div>
    <div class="container">
        <div class="left-section">
            <h2 class="text-center mb-4">확인 및 결제</h2>
            
            <!-- 예약 정보 -->
            <div class="mb-3">
                <h5>예약 정보</h5>
                <label for="checkin" class="form-label">체크인 날짜</label>
                <input type="date" class="form-control" id="checkin" value="2025-04-13">
                
                <label for="checkout" class="form-label">체크아웃 날짜</label>
                <input type="date" class="form-control" id="checkout" value="2025-04-18">
                
                <label for="guests" class="form-label">게스트 수</label>
                <input type="number" class="form-control" id="guests" value="1" min="1">
            </div>
            
            <!-- 결제 수단 -->
            <div class="mb-3">
                <h5>결제 수단</h5>
                <select class="form-select" id="payment-method" required>
                    <option value="card">신용카드 또는 체크카드</option>
                    <option value="bank">계좌이체</option>
                </select>
            </div>
            
            <!-- 기본 규칙 -->
            <div class="mb-3">
                <h5>기본 규칙</h5>
                <ul>
                    <li>체크인: 오후 3시 이후</li>
                    <li>체크아웃: 오전 11시까지</li>
                    <li>흡연 금지, 반려동물 금지</li>
                    <li>파티 및 이벤트 금지</li>
                </ul>
            </div>
            
            <!-- 확인 및 결제 버튼 -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100">확인 및 결제</button>
            </div>
        </div>
        
        <div class="right-section">
            <h4>[New채이네] 에어비앤비 최고의 전망 No1. 파고라 리뉴얼 감성불멍 bar new open</h4>
            <p><strong>별장 전체</strong></p>
            <p>⭐⭐⭐⭐⭐ 4.93 (후기 294개) • 슈퍼호스트</p>
            
            <h5>요금 세부정보</h5>
            <p>₩296,000 x <span id="nights">5</span>박 = ₩<span id="room-price">1,480,000</span></p>
            <p>에어비앤비 서비스 수수료: ₩229,836</p>
            
            <div class="mb-3 total-price">
                <h5>총액</h5>
                <p>₩<span id="total-price">1,709,836</span> (KRW)</p>
                <p class="small-text">해외에서 결제가 처리되기 때문에 카드 발행사에서 추가 수수료를 부과할 수 있습니다.</p>
            </div>
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            function updatePrice() {
                let checkin = new Date($('#checkin').val());
                let checkout = new Date($('#checkout').val());
                let nights = (checkout - checkin) / (1000 * 60 * 60 * 24);
                nights = nights > 0 ? nights : 1;
                
                let pricePerNight = 296000;
                let totalRoomPrice = pricePerNight * nights;
                let serviceFee = 229836;
                let totalPrice = totalRoomPrice + serviceFee;
                
                $('#nights').text(nights);
                $('#room-price').text(totalRoomPrice.toLocaleString());
                $('#total-price').text(totalPrice.toLocaleString());
            }
            
            $('#checkin, #checkout, #guests').on('change', updatePrice);
            updatePrice();
        });
    </script>
</body>
</html>
