<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Product product = (Product)request.getAttribute("product");
	Member member = (Member)session.getAttribute("member");
	System.out.print("상세보기"+member);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
    <!-- 헤더 시작 -->
    <div id="header" >
		<%@include file="../inc/top_navi.jsp" %>
	</div>
	<!-- 헤더 끝 -->
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
                        <h2 style="margin-left: 20px; margin-bottom: 15px;"><%=product.getProduct_name()%> <span class="badge badge-secondary">Hot</span></h2>
                    </div>
                    <hr style="background-color: rgb(186, 186, 186); height: 2/1px; margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4" id="product-price">판매가</div>
                        <div class="col-sm-6" id="product-price" style="font-weight: bold; color: rgb(214, 6, 208);"><%=product.getPrice()%>원</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">배송비</div>
                        <div class="col-sm-6" id="ship-cost">5000</div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">적립금</div>
                        <div class="col-sm-6"><%=Math.round(product.getPrice()*0.01)%></div>
                    </div>
                    <hr style="margin: 0%;">
                    <div class="row">
                        <div class="col-sm-4">제조사</div>
                        <div class="col-sm-6"><%=product.getBrand() %></div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row" style="background: rgb(221, 221, 221); margin-left: 0%; margin-right: 0%;">
                        <!-- <div class="col-sm-4">상품선택</div>
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
                        </div> -->
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">

                    <div class="row" style="width: 100%;">
                        <div class="col-md-6" style=" margin-left: 30px;">상품명</div>
                        <div class="col-md-2" id="product-number">&nbsp&nbsp상품수</div>
                        <div class="col-md-3" style="margin-left: 30px; padding-left: 40px;"> 가격</div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
                    <div class="row" style="background: rgb(221, 221, 221); margin-left: 0%; margin-right: 0%;">
                        <div class="col-md-6" >&nbsp&nbsp<%=product.getProduct_name()%></div>
                        <div class="col-md-3">
                            <form class="cart clearfix mb-50 d-flex" method="post" >
                                <div class="quantity" ondragstart="false" id="detail-form">
                                	<input type="hidden" name="product_id" value="<%=product.getProduct_id()%>">
                                    <input type="hidden" name="member_id" value="<%=1%>">
                                	<span class="qty-minus" ondragstart="false" style="cursor: pointer;" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false; "><i class="fa fa-minus" aria-hidden="true" onclick="changePrice(-1);"></i></span>
                                    <input type="number" ondragstart="false" class="qty-text" id="qty" step="1" min="1" max="12" name="ea" value="1">
                                    <span class="qty-plus" ondragstart="false" style="cursor: pointer;"onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false; "><i class="fa fa-plus" aria-hidden="true" onclick="changePrice(1);"></i></span>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-3" id="total-price"><%=product.getPrice()%></div>
                    </div>
                    <hr style="margin: 0%; background: rgb(112, 112, 112);">
<%--                     <div class="row">
                        <div class="col-md-2" style=" margin-left: 15px;"></div>
                        <div class="col-md-4" style="font-size: 25px; height: 50px;padding-left: 80px; margin-top: 20px;" >총 상품 금액</div>
                        <div class="col-md-4" style="font-size: 25px; margin-left: 100px; margin-top: 20px;" id="total-price-with-shipping"><%=product.getPrice()*1%>원</div>
                    </div> --%>

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

/* 수량 변경시 가격변경과 장바구니에 담기 */
function changePrice(a){
	//수량 int형으로 변환
	var ea= $("#detail-form input[type='number']").val() 
	ea=ea*1+a;
	
	if(ea==0){
		return
	}
		
	var product_price=<%=product.getPrice()%> //상품금액
	var tag=ea*product_price;//상품금액*수량
	var price = document.getElementById("total-price");
	price.innerHTML= tag;
}





</script>
</body>
</html>







