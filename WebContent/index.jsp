<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
    <script src="javascripts/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script>
        $(function(){
            $('header').hide();
            
            $(window).scroll(function(){
                var height =$(window).scrollTop();
                if(height>0){
                    $('header').show();
                    $('header').addClass('sticky')
                }else{
                    $('header').removeClass('sticky');
                    $('header').hide();
                }
            })

            $('.slider').slick({
                arrows:false,
                dots: true,
                centerMode: true,
                centerPadding: 0,
                slidesToShow: 4,
                slidesToScroll: 3,
                autoplaySpeed: 2000,
                responsive: [
                    {
                    breakpoint: 1300,
                    settings: {
                        arrows: true,
                        centerMode: true,
                        centerPadding: 0,
                        slidesToShow: 3
                    }
                    },{
                    breakpoint: 910,
                    settings: {
                        arrows: true,
                        centerMode: true,
                        centerPadding: 0,
                        slidesToShow: 2
                    }
                    },
                    {
                    breakpoint: 850,
                    settings: {
                        arrows: true,
                        centerMode: true,
                        centerPadding:0,
                        slidesToShow: 2
                    }
                    },
                    {
                    breakpoint: 680,
                    settings: {
                        arrows: true,
                        centerMode: true,
                        centerPadding: 0,
                        slidesToShow: 1
                    }
                    }
                ]
            })
     
        })
    </script>
</head>
<body>
    <header>
        <a href="#" class="logo">Animal</a>
        <ul class="navigation">
            <a href="login.jsp"><li>登入</li></a>
            <a href="register.jsp"><li>註冊</li></a>
        </ul>
    </header>
    <section class="banner" id="banner" style="background-image: url(thum.jpg) ;">
        <div class="content">
            <h2>Always by Your Side</h2>
            <p>可以打一些網站介紹但是還沒想到所以當<br>做測試隨便打幾句dfefkaoijfiajkdlsjfeiajf</p>
            <a class="btn-action" href="goforum"><button class="btn">前往討論版<i class="fa fa-angle-double-right" ></i></button></a><br>
            <a class="btn-action" href="getAllProduct"><button class="btn">寵物用品<i class="fa fa-angle-double-right" ></i></button></a><br>
            <a class="btn-action" href="gomap"><button class="btn">地圖查詢<i class="fa fa-angle-double-right" ></i></button></a><br>
            <a class="btn-action" href="login.jsp"><button class="btn" id="login">登入/註冊<i class="fa fa-angle-double-right" ></i></button></a>
        </div>
    </section>
   
    <!-- 討論版 -->
    <div class="discuss-area">
        <h2 class="title">熱門討論</h2>
        <div>
            <ul class="articleList">
                <a href="">
                <li>
                    <div class="eachArticle">
                        <h3 class="artTitle">請問貓咪會咬人嗎 我好困擾</h3>
                        <p>我家的貓很喜歡拿我磨牙，雖然很可愛啦但是有時候真的承受不了</p>
                        <small>2020-01-30</small>
                    </div>
                </li>
                </a>
                <a href="">
                    <li>
                        <div class="eachArticle">
                            <h3 class="artTitle">鱷魚走丟了QAQQQQ</h3>
                            <p>剛養的鱷魚離家出走了T-T可能是昨天籠子沒有關好牠就跑出去了。怎麼辦啊牠是不是不喜歡我</p>
                            <small>2020-01-30</small>
                        </div>
                    </li>
                </a>
                <a href="">
                    <li>
                        <div class="eachArticle">
                            <h3 class="artTitle">鱷魚走丟了QAQQQQ</h3>
                            <p>剛養的鱷魚離家出走了T-T可能是昨天籠子沒有關好牠就跑出去了。怎麼辦啊牠是不是不喜歡我</p>
                            <small>2020-01-30</small>
                        </div>
                    </li>
                </a>
                <a href="">
                    <li>
                        <div class="eachArticle">
                            <h3 class="artTitle">鱷魚走丟了QAQQQQ</h3>
                            <p>剛養的鱷魚離家出走了T-T可能是昨天籠子沒有關好牠就跑出去了。怎麼辦啊牠是不是不喜歡我</p>
                            <small>2020-01-30</small>
                        </div>
                    </li>
                </a>
            </ul>
        </div>
        <div class="gotochat"><a href="goforum"><button>查看更多</button></a></div>
    </div>
    <!-- 商品 -->
    <div class="product-area">
        <h2 class="title">本月熱銷</h2>

        <div class="product-p1 product-page slider">
           <a>
                <div class="eachproduct">
                    <div class="pimg-container">
                        <img src="3db4c6c0-042b-4a7e-9a0e-2f96d0ade7b4.jpg">
                    </div>
                    <p>測試用因為商品名稱很長所以打一長串看起來應該是部會超過吧糟糕</p>
               </div>
            </a> 
            <a>
                <div class="eachproduct">
                    <div class="pimg-container">
                        <img src="7d188998-ee4d-4d4d-b787-8ff7c83838a6.jpg">
                    </div>
                    <p>Product Name</p>
                </div>
            </a>
            <a>
                <div class="eachproduct">
                    <div class="pimg-container">
                        <img src="1e1e93aa-1bfd-401f-a6dd-3de1711b2b12.jpg">
                    </div>
                    <p>Product Name</p>
                </div>
            </a>
            <a>
                <div class="eachproduct">
                    <div class="pimg-container">
                        <img src="2a6eb7c3-c240-4323-bce1-e216a13cf138.jpg">
                    </div>
                    <p>Product Name</p>
                </div>
            </a>

            <a>
                <div class="eachproduct">
                    <div class="pimg-container">
                        <img src="2a6eb7c3-c240-4323-bce1-e216a13cf138.jpg">
                    </div>
                    <p>Product Name</p>
                </div>
            </a>
        </div>


        <div class="gotoShop"><a href="getAllProduct"><button>去購物</button></a></div>
    </div>

    <!-- 地圖查詢 -->
    <div class="map-area">
        <div class="map-title" style="background-image: url(map.jpg);">
            <h2>地圖查詢</h2>
        </div>
        <div class="map-container">
        <div class="map-cato">
            <div class="box-background" style="background-image: url(dog.jpg);"></div>
            <div class="content">
                <div class="logo"><i class="fa fa-hospital-o"></i></div>
                <div class="gobtn"><a href=""><button id="hbtn">醫療資源</button></a></div>
            </div>
        </div>

        <div class="map-cato">
            <div class="box-background" style="background-image: url(20200929001326.jpg);"></div>
            <div class="content">
                <div class="logo"><i class="fa fa-shower"></i></div>
                <div class="gobtn"><a href=""><button id="sbtn">寵物美容</button></a></div>
            </div>
        </div>
        </div>

    </div>

    <!-- footer -->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>聯絡我們</h3>
                    <p>我們會用最快的速度回應您的需求</p>
                </div>
            </div>
            <hr>
            <p class="footer-bottom"> &copy; Animal.com | Alawys by Your Side</p>
        </div>
    </div>

</body>
</html>



<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<c:url value="/css/login.css"/>">
</head>
<body>
Hello world 
	<%= SecurityContextHolder.getContext().getAuthentication().getName() %>	<!-- 取得登入的帳號 -->
	<c:url value="/perform_logout" var="logoutUrl" />
	<form method="post" action="${logoutUrl}">
		<input value="Logout" type="submit"> 
		<a href="productPage.jsp">購物</a>
		<a href="select_member">會員專區</a>	<!-- "select_member"    member.jsp-->
		<a href="login.jsp">登入</a>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
<div class="container">
<c:url value="perform_login" var="loginUrl" />
<form method="post" action="${loginUrl }">
<!-- <form method="post" action="login"> -->
 <h2>Login</h2>
 			
            <input type="text" name="account"  placeholder="Account" class="account" autocomplete="off" />${errors.account}
            <br>
            <br>
            <input type="password" name="password" placeholder="Password" class="password" />${errors.password}
            <br>
            <br>
            <input type="submit" id="btn-submit" value="submit"/><a href="register.jsp">註冊</a>
            <br>
            <br>
            <a href="forgetpwd.jsp">忘記密碼?</a>
            <span id="warning">${errors.error}<br></span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>

</body>
</html> --%>