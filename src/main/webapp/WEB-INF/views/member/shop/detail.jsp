<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Product product = (Product)request.getAttribute("product");
	System.out.println(product);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->

<!-- Favicon  -->
<link rel="icon" href="/resources/img/reallogo.png">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/resources/css/core-style.css">
<link rel="stylesheet" href="/resources/style.css">
<!-- 폰트어썸 -->
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<!-- Responsive CSS -->
<link href="/resources/css/responsive.css" rel="stylesheet">
<!-- Popper js -->
<script src="/resources/js/popper.min.js"></script>
<!-- Plugins js -->
<script src="/resources/js/plugins.js"></script>
<!-- Active js -->
<script src="/resources/js/active.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="/resources/css/style.css">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
    href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&family=Nanum+Pen+Script&family=Single+Day&display=swap"
    rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
<!--     
    font-family: 'Black Han Sans', sans-serif;
    font-family: 'Jua', sans-serif;
    font-family: 'Nanum Pen Script', cursive;
    font-family: 'Single Day', cursive; 
    font-family: 'Nanum Gothic Coding', monospace;  -->
    <title>상세보기</title>
</head>
<body>
    <div id="header">헤더 올 곳</div>
    <div class="row">
        <div class="col-sm-2" ></div>
        <div class="col-sm-8" id="product-detail">
            <!-- 상세보기 설명 시작-->
            <div class="row" id="product-desc">
                <div class="col-sm-5" id="product-img"> 
                    <img class="img-fluid" src="/resources/img/img15.jpg" alt="Chania">
                </div>
                <div class="col-sm-7" id="product-choice">
                    <hr class="top-line">
                    <div class="product-name">
                        <h2 style="margin-left: 20px; margin-bottom: 15px;">득근 덤벨 세트 <span class="badge badge-secondary">Hot</span></h2>
                    </div>
                    <hr style="background-color: rgb(186, 186, 186); height: 2/1px; margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4" id="product-price">판매가</div>
                        <div class="col-sm-6" id="product-price" style="font-weight: bold; color: rgb(214, 6, 208);">18000원</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">배송비</div>
                        <div class="col-sm-6">5000원</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">적립금</div>
                        <div class="col-sm-6">180원</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">제조사</div>
                        <div class="col-sm-6">득근컴퍼니</div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row" style="background: rgb(221, 221, 221); margin-left: 0%; margin-right: 0%;">
                        <div class="col-sm-4">상품선택</div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <select class="form-control select2 select2-danger" data-dropdown-css-class="select2-danger" style="width: 100%;">
                                  <option selected="selected">(필수)옵션을 선택해주세요</option>
                                  <option>아령 5kg X 2 기본 세트(+0)</option>
                                  <option>아령 10kg X 2, 5kg X 2 세트(+5000) </option>
                                  <option>아령 10kg X 2, 5kg X 2, 3kg X 2 세트(+8000)</option>
                                  <option>바벨 10kg X 2, 5kg X 2 기본 세트(+15000)</option>
                                  <option>바벨 20kg X 2, 10kg X 2, 5kg X 2 세트(+20000)</option>
                                </select>
                              </div>
                        </div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    
                    <div class="row" style="width: 100%;">
                        <div class="col-md-6" style=" margin-left: 30px;">상품명</div>
                        <div class="col-md-2" id="product-number">상품수</div>
                        <div class="col-md-3" >가격</div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row" style="background: rgb(221, 221, 221); margin-left: 0%; margin-right: 0%;">
                        <div class="col-md-6" >아령 5kg X 2 기본 세트(+0)</div>
                        <div class="col-md-3">
                            <form class="cart clearfix mb-50 d-flex" method="post">
                                <div class="quantity">
                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">
                                    <i class="fas fa-times-circle"></i>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3">18000원</div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row">
                        <div class="col-md-4" style=" margin-left: 15px;"></div>
                        <div class="col-md-4" style="font-size: 25px; height: 50px; margin-top: 20px;" >총 상품 금액</div>
                        <div class="col-md-2" style="font-size: 25px; margin-left: 80px;">원</div>
                    </div>

                </div>
            </div>
            <!-- 상세보기 설명 끝 -->

            <!-- 상세보기 장바구니 시작-->
            <div class="row" id="product-cart">
                <div class="col-sm-5" id="product-block"></div>
                <div class="col-sm-7" id="product-cart">
                    <div class="row">
                        <div class="col-sm-4" style="padding: 5px;"><button type="button" class="btn btn-dark" id="detail-bt">바로 구매하기</button></div>
                        <div class="col-sm-4" style="padding: 5px;"><button type="button" class="btn btn-light"  id="detail-bt">장바구니</button></div>
                        <div class="col-sm-4" style="padding: 5px;"><button type="button" class="btn btn-light"  id="detail-bt">관심상품</button></div>
                    </div>
                </div>
            </div>
            <!-- 상세보기 장바구니 끝 -->


        </div>
        <div class="col-sm-2" ></div>
    </div>
    <!-- <div id="footer">푸터 올 곳</div> -->
<script>

</script>
</body>
</html>