<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedTag"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedProductImg"%>
<%@page import="java.util.List"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedFavorites"%>
<%@page import="ga.dgmarket.gymshopping.domain.UsedProductExtend"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Map map = (HashMap)request.getAttribute("map");
	UsedProductExtend productExtend = (UsedProductExtend)map.get("usedProductExtend");
	UsedFavorites favorites = (UsedFavorites)map.get("usedFavorites");
	List<UsedProductImg> imgList = (List)map.get("imgList");
	List<UsedTag> tagList = (List)map.get("tagList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 상세보기</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" alt></script>
<style>
    .wrapper{
        width: 60%;
        margin: auto;
    }

    .tag_container{
        padding-top: 35px;
    }

    .content_container{
        width: 100%;
        margin-top: 35px;
    }

    .button_container{
        border: 1px solid black;
        border-radius : 5px;
        width : 98%;
        position : absolute;
        bottom : 0px;
        right : 0px;
        left : 0px;
    }

    hr{
        border: 0px;
        height: 3px;
        background: black;
    }

    .carousel-inner img {
        width: 100%;
        height: 600px;
        object-fit: cover;
        border: 3px solid black;
    }
    
    </style>
<script>


</script>
</head>
<body>
    <div class="wrapper">
        <!-- 상품의 태그를 보여줄 박스 -->
        <div class="tag_container">
            <h3>Hash TAG</h3>
            <!-- 실제 태그 꺼내서 반복문 돌리기 -->
            <%for(UsedTag usedTag : tagList){%>
            	<span style="padding-right: 15px;"><a href="#">#<%=usedTag.getTag_name() %></a></span>
            <%} %>
        </div>
        <hr>

        <!-- 상품의 정보와 추천 상품을 보여줄 컨테이너 -->
        <div class="content_container">
            <!-- 상품 정보를 담는 컨테이너 -->
            <div class="product_container">
                <div class="row">
                    
                    <!-- 제품 이미지 넣기 -->
                    <div class="col-sm-6">
                        <!-- 제품의 이미지를 여러 개 등록 했을 때  -->
                        <div id="demo" class="carousel slide" data-ride="carousel">

                            <!-- 이미지의 링크를 담당! 반복문 돌려야함-->
                            <ul class="carousel-indicators">
                            	<%for(int i = 0; i < imgList.size(); i++){ %>
                            		<%if(i == 0) {%>
	                                	<li data-target="#demo" data-slide-to="<%=i %>" class="active"></li>                            		
                            		<%} else{%>
	                                	<li data-target="#demo" data-slide-to="<%=i%>"></li>
	                                <%} %>
                                <%} %>
                            </ul>

                            <!-- 등록한 이미지만큼! 반복문 돌려야 함 -->
                            <div class="carousel-inner">
                            	<%for(int i = 0; i < imgList.size(); i++){ %>
                            		<%UsedProductImg productImg = imgList.get(i); %>
	                                <%if(i==0){ %>
		                                <div class="carousel-item active">
		                                    <img src="/resources/data/used/product/img/<%= productImg.getUsed_img()%>" alt="Los Angeles">
		                                </div>
	                                <%} else {%>
		                                <div class="carousel-item">
		                                    <img src="/resources/data/used/product/img/<%= productImg.getUsed_img()%>" alt="Los Angeles">
		                                </div>
	                                <% } %>
                                <%} %>
                            </div>
                        </div>
                    </div>
                    <!-- 상품의 이름, 가격, 설명을 담는 컨테이너 -->
                    <div class="col-sm-6">
                        <!-- 제품명 넣기 -->
                        <p><h3><strong>고양이 포토카드 3장</strong></h3></p>
                        <!-- 가격 넣기 -->
                        <p><h1><strong>9,000원</strong></h1></p>
                        <br>
                        <p><h5><strong>제품 설명</strong></h5></p>
                        <hr style="border: 0px; height: 3px; background: black;">
                        <!-- 제품 설명 넣기 -->
                        <p><h5><strong>
                            고양이 사진 장 당 3,000원에 판매 하겠습니다.<br>
                            직접 키우는 고양이들은 아니고 어디서 퍼온겁니다ㅋㄷ<br>
                            사진은 택배거래가 어려우니 직거래 희망합니다.
                        </strong></h5></p>
                        <br>
                        <br>
                        <br>
                        <div class="button_container text-center" >
                            <p><h5><strong>판매자 : <a href="#">[조성일]</a></strong></h5></p> 
                            <div class="btn-group" style="width : 100%;">
                                <!-- 찜 갯수 넣기 사용자가 찜을 했는지 안했는지에 따라 버튼과 뱃지 색 바꾸기 -->
                                <button type="button" class="btn btn-success" onclick="location.href='#'">찜하기 <span class="badge badge-danger">7</span></button>
                                <button type="button" class="btn btn-success" onclick="location.href='#'">연락하기</button>
                            </div>
                        </div>
                    </div>
            
                </div>
            </div>
            <hr style="margin-top: 35px;">
            <!-- 보고 있는 상품과 유사한 상품을 추천하는 컨테이너 -->
            <div class="other_container">
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                <!-- 이미지 블럭 추가하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
            </div>
        </div>

    </div>
</body>
</html>