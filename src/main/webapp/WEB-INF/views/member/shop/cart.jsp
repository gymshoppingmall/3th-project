<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<!-- Favicon  -->
<link rel="icon" href="/resources/img/reallogo.png">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/resources/css/core-style.css">
<link rel="stylesheet" href="/resources/style.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- Responsive CSS -->
<link href="/resources/css/responsive.css" rel="stylesheet">
<!-- Popper js -->
<script src="/resources/js/popper.min.js"></script>
<!-- Plugins js -->
<script src="/resources/js/plugins.js"></script>
<!-- Active js -->
<script src="/resources/js/active.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/cart.css">

<!-- 커스텀 js -->
<script src="/resources/js/cart.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">
<!--     
    font-family: 'Black Han Sans', sans-serif;
    font-family: 'Jua', sans-serif;
    font-family: 'Nanum Pen Script', cursive;
    font-family: 'Single Day', cursive; 
    font-family: 'Nanum Gothic Coding', monospace;  -->
<title>장바구니</title>

<!-- Favicon  -->
<link rel="icon" href="img/reallogo.png">
</head>
<body>
	<!-- 헤더 시작 -->
	<div id="header">
		<%@include file="../inc/top_navi.jsp"%>
	</div>
	<!-- 헤더 끝 -->
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="cart-title">장바구니</div>

			<!-- 장바구니 왼쪽 섹션 시작 -->
			<div class="row">
				<div>
					<i class="fas fa-check-circle"
						style="margin-left: 30px; font-size: 25px; color: purple;"></i>
				</div>
				<div class="col-sm-1+1/2" style="margin-left: 1%;">전체선택(1/1)</div>
				<div class="" style="color: rgb(157, 157, 157); font-weight: bold;">&nbsp;&nbsp;&nbsp;I</div>
				<div class="col-sm-1" style="padding-left: 0px;">&nbsp;&nbsp;선택삭제</div>
			</div>
			<hr id="cart-line"
				style="background-color: rgb(186, 186, 186); height: 1px; width: 75%;">
			<div class="row" id="cart-main">
				<div class="col-sm-9">
					<form name="orderform" id="orderform" method="post"
						class="orderform" action="/Page" onsubmit="return false;">

						<input type="hidden" name="cmd" value="order">
						<div class="basketdiv" id="basket">
							<div class="row head">
								<div class="subdiv">
									<div class="check">선택</div>
									<div class="img">이미지</div>
									<div class="pname">상품명</div>
								</div>
								<div class="subdiv">
									<div class="basketprice">가격</div>
									<div class="num">수량</div>
									<div class="sum">합계</div>
								</div>
								<div class="subdiv">

									<div class="basketcmd">삭제</div>
								</div>
								<div class="split"></div>
							</div>

							<div class="row data" style="height: 100px">
								<div class="subdiv">
									<div class="check">
										<input type="checkbox" name="buy" value="260" checked=""
											onclick="javascript:basket.checkItem();">&nbsp;
									</div>
									<div class="img">
										<img src="./img/basket1.jpg" width="60">
									</div>
									<div class="pname">
										<span>찜마마(XJ-92214/3)</span>
									</div>
								</div>
								<div class="subdiv">
									<div class="basketprice">
										<input type="hidden" name="p_price" id="p_price1"
											class="p_price" value="20000">50,000원
									</div>
									<div class="num">
										<div class="updown">
											<input type="text" name="p_num1" id="p_num1" size="2"
												maxlength="4" class="p_num" value="2"
												onkeyup="javascript:basket.changePNum(1);"> <span
												onclick="javascript:basket.changePNum(1);"><i
												class="fas fa-arrow-alt-circle-up up"></i></span> <span
												onclick="javascript:basket.changePNum(1);"><i
												class="fas fa-arrow-alt-circle-down down"></i></span>
										</div>
									</div>
									<div class="sum">40,000원</div>
								</div>
								<div class="subdiv">
									<div class="basketcmd">
										<a href="javascript:void(0)" class="abutton"
											onclick="javascript:basket.delItem();">삭제</a>
									</div>
								</div>
							</div>
						</div>

						<div class="right-align basketrowcmd">
							<a href="javascript:void(0)" class="abutton"
								onclick="javascript:basket.delCheckedItem();">선택상품삭제</a> <a
								href="javascript:void(0)" class="abutton"
								onclick="javascript:basket.delAllItem();">장바구니비우기</a>
						</div>

						<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:
							4개</div>
						<div class="bigtext right-align box blue summoney"
							id="sum_p_price">합계금액: 74,200원</div>

						<div id="goorder" class="">
							<div class="clear"></div>
						</div>
					</form>
				</div>
				<!-- 장바구니 왼쪽 섹션 끝-->
				<!-- 장바구니 오른쪽 섹션 시작 -->
				<div class="col-sm-3" style="border: 1px solid rgb(214, 214, 214);">
					<div
						style="margin-top: 20px; font-size: 30px; height: 70px; color: rgb(126, 126, 126);">
						<i class="fas fa-map-marker-alt"></i> 배송지
					</div>
					<div style="height: 100px;">서울 송파구 올림픽로 300</div>
					<div id="location">
						<button type="button" class="btn btn-outline-success">배송지
							변경</button>
					</div>
					<div class="row"
						style="height: 140px; padding-top: 20px; margin-top: 50px; background: rgb(240, 240, 240);">
						<div class="col-sm-7"
							style="font-size: 15px; line-height: 30px; padding-left: 50px;">상품금액</div>
						<div class="col-sm-5" style="font-size: 20px; text-align: right;">55,000원</div>
						<div class="col-sm-7"
							style="font-size: 15px; line-height: 30px; padding-left: 50px;">상품할인금액(첫주문)</div>
						<div class="col-sm-5" style="font-size: 20px; text-align: right;">-2,000원</div>
						<div class="col-sm-7"
							style="font-size: 15px; line-height: 30px; padding-left: 50px;">배송비</div>
						<div class="col-sm-5" style="font-size: 20px; text-align: right;">5,000원</div>
					</div>
					<hr style="width: 100%; padding: 0%; margin-left: 0%">
					<div id="product-order">
						<button type="button" class="btn btn-success">주문하기</button>
					</div>
				</div>
				<!-- 장바구니 오른쪽 섹션 끝-->
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<div id="footer">푸터 올 곳</div>
</body>
</html>