<%@page import="ga.dgmarket.gymshopping.domain.UsedProduct"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedProductExtend"%>
<%@page import="ga.dgmarket.gymshopping.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	//메인페이지 호출과 동시에 상품 받아오기 --도균--
	List<Product> productNewList =(List)request.getAttribute("productNewList");
	List<UsedProductExtend> UsedProductNewList = (List)request.getAttribute("UsedProductNewList");
	Member member=(Member)request.getAttribute("member");
	System.out.println("메인"+member);
	System.out.println("상품뉴리스트"+productNewList);
	System.out.println("사용자상품리스트"+UsedProductNewList);
%>
<!doctype html>
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

    <title>DGMarket</title>
</head>

<body>
	<!-- 헤더 시작 -->
    <div id="header" >
		<%@include file="../inc/top_navi.jsp" %>
	</div>
	<!-- 헤더 끝 -->
    <!-- 이미지 슬라이더 시작 -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 0px">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="/resources/img/img5.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>운동기구는!!</h5>
                    <p>무조건 많은게 좋아요!!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="/resources/img/img6.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>아령!!!</h5>
                    <p>본인에 맞는 아령을 구비하세요!!!</p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="/resources/img/img8.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>푸쉬업!</h5>
                    <p>더 하세요!!</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!-- 이미지 슬라이더 끝 -->


    <!-- 신상품 상품진열  -->
    <div class="product1">
        <div class="product-suggestion">따끈 따끈 신제품!!</div>
        <!-- Product DB에 있는 자료로 반복문 이용 상품카드 생성 -->
        <form>
        	<%for(Product product : productNewList){ %>
            <div class="card" style="width:300px">
                <img class="card-img-top" src="/resources/img/img1.jpg" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title"><%=product.getProduct_name() %></h4>
                    <input type="hidden" name="product_img" value="이미지">
                    <p class="card-text"><%=product.getPrice() %>원</p>
                    <a class="btn btn-primary" onclick="location.href='/member/product/detail?product_id=<%=product.getProduct_id()%>'">둘러보기</a>
                </div>
            </div>
			<%} %>      
        </form>
    </div>
    <!-- 신상품 상품진열 끝-->

    <!-- 인기상품 상품진열 -->
    <div class="product2">
        <div class="price-suggestion">놓치면 후회할 가격 ></div>
        <div class="card" style="width:300px">
            <img class="card-img-top" src="/resources/img/img13.jpg" alt="Card image">
            <div class="card-body">
                <h4 class="card-title">아령 2Set</h4>
                <p class="card-orginprice">43,000원</p>
                <p class="card-discountprice">34000원</p>
                <a href="#" class="btn btn-primary">둘러보기</a>
            </div>
        </div>
        <div class="card" style="width:300px">
            <img class="card-img-top" src="/resources/img/img17.jpg" alt="Card image">
            <div class="card-body">
                <h4 class="card-title">요가매트</h4>
                <p class="card-orginprice">23000원</p>
                <p class="card-discountprice">18000원</p>
                <a href="#" class="btn btn-primary">둘러보기</a>
            </div>
        </div>
        <div class="card" style="width:300px">
            <img class="card-img-top" src="/resources/img/img18.jpg" alt="Card image">
            <div class="card-body">
                <h4 class="card-title">자가발전기</h4>
                <p class="card-orginprice">120000원</p>
                <p class="card-discountprice">88000원</p>
                <a href="#" class="btn btn-primary">둘러보기</a>
            </div>
        </div>
        <div class="card" style="width:300px">
            <img class="card-img-top" src="/resources/img/img19.jpg" alt="Card image">
            <div class="card-body">
                <h4 class="card-title">벤치 프레스</h4>
                <p class="card-orginprice">230000원</p>
                <p class="card-discountprice">175000원</p>
                <a href="#" class="btn btn-primary">둘러보기</a>
            </div>
        </div>
    </div>
    <!-- 인기상품 상품진열 끝 -->



    <!-- 중고상품 상품진열 -->
    <div class="product1">
        <div class="product-suggestion">인기 중고</div>
        <%for(UsedProduct usedProduct : UsedProductNewList){ %>
            <div class="card" style="width:300px">
                <img class="card-img-top" src="/resources/img/img16.jpg" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title"><%=usedProduct.getUsed_product_name()%></h4>
                    <p class="card-text"><%=usedProduct.getUsed_product_price() %>원</p>
                    <a href="#" class="btn btn-primary">둘러보기</a>
                </div>
            </div>
		<%} %>  
    </div>
    <!-- 중고상품 상품진열 끝 -->
    
    <div id="footer">푸터 올 곳</div>
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>