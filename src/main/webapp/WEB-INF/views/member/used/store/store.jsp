<%@page import="ga.dgmarket.gymshopping.domain.Member"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=member.getName() %></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" alt></script>
<!-- 아이콘 처리 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- bootbox cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
<style>
body{
    margin: 0px;
}

.wrapper{
    margin: auto;
    width: 60%;
    border-left: 2px solid black;
    border-right: 2px solid black;
}

.user_container{
    border: 2px solid black;
    width : 40%;
    margin : auto;
    border-radius: 7px;
}

.content_container{
    width : 90%;
    margin-top: 50px;
    padding-left : 35px;
    padding-right: 35px;
    margin : auto;
}

.card img{
    width: 100%;
    height: 200px;
}

</style>
<script>

function copyLink(){
    var linkText = document.getElementById("link");
    linkText.setAttribute("type" , "text");
    linkText.select();
    document.execCommand("copy");
    linkText.setAttribute("type" , "hidden");
    bootbox.alert("상점-ID 복사를 완료했습니다.", function(){});
}
</script>
</head>
<body>
    <!-- 상점의 주소를 복사할 수 있는 주소 링크를 담아놓는 곳 -->
    <!-- session을 조회해서 상점ID 넣기 currTime으로 주소 구하면 될 듯 -->
    <input type="hidden" id="link" value="상점의 주소가 복사되게 만들기">
    <div class="wrapper text-center" style="padding-top: 50px;">
        <!-- 상점 주인의 정보를 나타내는 박스 -->
        <div class="user_container">
            <!-- 회원가입을 할 때 등록한 사진이 들어올 곳 -->
            <img src="http://www.econovill.com/news/photo/201906/365696_262215_221.jpg" 
            class="rounded-circle" style="margin-top: 25px;" alt="Cinque Terre" width="304" height="236"> 
            <div class="alert alert-success" style="width: 100%; margin: auto; margin-top: 25px;">
                <!-- 상점명이 들어올 곳! -->
                <strong>[조성일]님의 상점<a href="javascript:copyLink();"><i class="far fa-copy" style="margin-left: 5px;"></i></a></a></strong> 
            </div>
        </div>

        <!-- 개인상점에서 카테고리를 선택할 수 있는 네비 -->
        <div class="category_container" style="margin: auto; width: 100%; margin-top: 20px; margin-bottom: 20px;">
            <ul class="nav justify-content-center">
                <!-- if(session.멤버아이디 == 현재 보고 있는 상점.멤버아이디가 같다면) {
                <li class="nav-item">
                    <a class="nav-link" href="#"><h5>정보수정</h5></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><h5>판매목록</h5></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><h5>채팅목록</h5></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><h5>찜목록</h5></a>
                </li>
                }-->

                <!-- else{ 세션에과 상점의 멤버 아이디가 다르다면 -->
                <li class="nav-item">
                    <a class="nav-link" href="#"><h5>1 : 1 대화하기</h5></a>
                </li>
                <!-- } -->
            </ul>
        </div>

        <hr>

        <!-- 내가 등록한 상품과 찜한 상품, 상품 후기를 볼 수 있는 박스 -->
        <div class="content_container" style="padding-top: 30px;">
            <!-- 내가 등록한 제품 미리보기 박스 -->
            <div class="product_box">
                <!-- 더보기 글씨 넣기 -->
                <div class="row text-left">
                    <div class="col-sm-10"><h4>[조성일]님의 판매 상품</h4></div>
                    <div class="col-sm-2"><h5><a href="#">더보기+</a></h5></div>
                </div>
                
                <div class="row text-center">
                    <!--하나의 상품을 나타낼 박스-->
                    <div class="col-sm-4">
                        <div class="card">
                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_jp93K1VrrZ75YLmUvil0cgjPc05Is6gneA&usqp=CAU"
                            style="border-radius: 5px; border: solid 3px black;"
                            onclick="location.href='#'" alt="">
                        </div>            
                    </div>
                    <!--하나의 상품을 나타낼 박스-->
                    <div class="col-sm-4">
                        <div class="card">
                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
                            <img src="https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525023300360gnuh.jpg"
                            style="border-radius: 5px; border: solid 3px black;"
                            onclick="location.href='#'" alt="">
                        </div>            
                    </div>
                    <!--하나의 상품을 나타낼 박스-->
                    <div class="col-sm-4">
                        <div class="card">
                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzVP9eK4VpUOVgno4ercuUDpXhZptkW-fTcA&usqp=CAU"
                            style="border-radius: 5px; border: solid 3px black;"
                            onclick="location.href='#'" alt="">
                        </div>            
                    </div>
                </div>
            </div>

            <!-- if(세션의 멤버 아이디와 현재 페이지가 같아야 보여질 찜){} -->
            <!-- 내가 찜한 제품 미리보기 박스 -->
            <div class="favorites_container" style="margin-top: 60px;">
                <!-- 더보기 글씨 넣기 -->
                <div class="row text-left">
                    <div class="col-sm-10"><h4>[조성일]님이 찜한 상품</h4></div>
                    <div class="col-sm-2"><h5><a href="#">더보기+</a></h5></div>
                </div>

                <div class="row text-center">
                    <!--하나의 상품을 나타낼 박스-->
                    <div class="col-sm-4">
                        <div class="card">
                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
                            <img src="https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/25/holapet/20210525023300360gnuh.jpg"
                            style="border-radius: 5px; border: solid 3px black;"
                            onclick="location.href='#'" alt="">
                        </div>            
                    </div>
                    <!--하나의 상품을 나타낼 박스-->
                    <div class="col-sm-4">
                        <div class="card">
                        <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_jp93K1VrrZ75YLmUvil0cgjPc05Is6gneA&usqp=CAU"
                        style="border-radius: 5px; border: solid 3px black;"
                        onclick="location.href='#'" alt="">
                        </div>            
                    </div>
                    <!--하나의 상품을 나타낼 박스-->
                    <div class="col-sm-4">
                        <div class="card">
                            <!-- 상품 이미지가 올 곳 + 이미지 클릭 시 상품 상세보기 이동 -->
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpTznB5afqQAobcjfPq7MyE4XsIB6xU5xMqQ&usqp=CAU"
                            style="border-radius: 5px; border: solid 3px black;"
                            onclick="location.href='#'" alt="">
                        </div>            
                    </div>
                </div>
            </div>
            <!-- 상품 후기를 미리볼 수 있는 컨테이너 -->
            <div class="review_container" style="margin-top: 60px;">
                <div class="row text-left">
                    <div class="col-sm-10"><h4>[조성일]님 상점 이용 후기</h4></div>
                    <div class="col-sm-2"><h5><a href="#">더보기+</a></h5></div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>후기</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>늦은 시간임에도 친절하심</td>
                            <td>중고왕조성일</td>
                            <td>2021/07/20</td>
                        </tr>
                        <tr>
                            <td>친절하신데 연락이 느림..</td>
                            <td>르브론제임스</td>
                            <td>2016/11/10</td>
                        </tr>
                        <tr>
                            <td>거래 감사합니다.</td>
                            <td>거래응애</td>
                            <td>2012/02/22</td>
                        </tr>
                        <tr>
                            <td>물건이 좀 구리네요;</td>
                            <td>성일친척</td>
                            <td>2012/01/20</td>
                        </tr>
                        <tr>
                            <td>거래 감사합니다.</td>
                            <td>거래응애</td>
                            <td>2002/12/07</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>