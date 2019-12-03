<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/fore/footer.css">
    <link rel="stylesheet" href="css/fore/topWithSimpleSearch.css">
    <link rel="stylesheet" href="css/fore/style.css">

    <style>
        body {
            font-size: 12px;
        }

        /* note
            productImg */
        .productImgAndInfo {
            max-width: 1013px;
            margin: 100px auto 0px auto;
            /* margin: 40px 20px; */
        }

        .productImg {
            width: 400px;
            float: left;

        }

        .bigImg {
            width: 400px;
            padding: 20px;
            border: 1px solid #f2f2f2;
            /* height: 400px; */
        }

        .smallImgDiv {
            /* border: 1px solid black; */
            width: 80%;
            margin: 20px auto;
        }

        .smallImg {
            border: 2px solid white;
        }

        .smallImg:hover {
            border: 2px solid black;
        }

        /* note
            productInfo */
        .productInfo {
            /* border: 1px solid black; */
            padding-left: 25px;
            overflow: hidden;
            width: 550px;
        }

        .productTitle {
            padding-left: 5px;
            font-weight: bold;
            font-size: 16px;
        }

        .productSubtitle {
            padding-left: 5px;
            color: #c40000;
        }

        .juhuasuanDiv {
            margin-top: 10px;
            background-color: #2da771;
            line-height: 40px;
            color: white;
            text-align: center;
        }

        .juhuasuan {
            font-size: 18px;
            font-weight: bold;
        }

        .juhuasuanTime {
            color: #ffc057;
            font-weight: bold;
        }

        .productPriceDiv {
            background-image: url(img/site/priceBackground.png);
            height: 102px;
            padding: 10px;
            color: #666666;
        }

        .originalPriceDiv {
            margin-top: 5px;
        }

        .originalPriceDesc {
            color: #999999;
            display: inline-block;
            width: 68px;
        }

        .originalPrice {
            color: #333333;
            text-decoration: line-through;
        }

        /* .promotePriceDiv {
             margin-top: 5px;
        } */

        .promotePriceDesc {
            position: relative;
            bottom: 10px;
            color: #999999;
            display: inline-block;
            width: 68px;
        }

        .promotePriceYuan {
            font-size: 18px;
            color: #c40000;
        }

        .promotePrice {
            font-weight: bold;
            font-size: 30px;
            color: #c40000;
        }

        .saleAndReviewNumber {
            margin: 20px 0px 20px 0px;
            border-top-width: 1px;
            border-top-style: dotted;
            border-top-color: #c9c9c9;
            border-bottom-width: 1px;
            border-bottom-style: dotted;
            border-bottom-color: #c9c9c9;
        }

        .sale {
            display: inline-block;
            line-height: 40px;
            width: 250px;
            text-align: center;
        }

        .review {
            display: inline-block;
            width: 250px;
            text-align: center;
        }

        .reviewNumber,
        .saleNumber {
            margin-left: 3px;
            color: #c40000;
            font-weight: bold;
        }

        .middleOfSaleAndReview {
            font-size: 18px;
            color: #e5dfda;
        }



        .buyNumber {
            color: #999999;
        }

        .productNumberSetting {
            border: 1px solid;
            width: 40px;
            height: 30px;
        }

        .updown {
            display: block;
            border: 1px solid #999;
            width: 20px;
            text-align: center;
            height: 14px;
        }

        .updown img {
            margin-bottom: 6px;
        }

        .updownMiddle {
            display: block;
            height: 4px;
        }

        .arrow {
            display: inline-block;
            vertical-align: top;
            width: 25px;
        }

        .serviceCommit {
            margin: 20px 0px 20px 0px;
        }

        .commitDesc {
            color: #999999;
        }

        .commitLink a {
            color: #666666;
            text-decoration: none;
        }

        .commitLink a:hover {
            color: #c40000;
        }

        .buyDiv {
            text-align: center;
            /* margin: 0px auto; */
        }

        .buyDiv button {
            margin: 0px 10px;
            width: 180px;
            height: 40px;
        }

        .buyButton {
            border: 1px solid #c40000;
            background-color: #ffeded;
            font-size: 16px;
            color: #c40000;
        }

        .addButton {
            border: 1px solid #c40000;
            background-color: #c40000;
            color: white;
            font-size: 16px;
        }

        .glyphicon-shopping-cart {
            font-size: 12px;
            margin-right: 5px;
        }

        /* note
            productDetail  */
        .productDetailDiv {
            max-width: 790px;
            margin: 40px auto;
            /* border: 1px solid black; */
        }

        .productDetailTop {
            border: 1px solid #dfdfdf;
            border-left-width: 0px;
        }

        .detailLink {
            display: inline-block;
            border-left: 1px solid #cfbfb1;
            border-right: 1px solid #cfbfb1;
            line-height: 46px;
            width: 90px;
            text-align: center;
            font-weight: bold;
            color: #b10000;
            /* position: relative; */
        }

        .detailLink:before {
            content: "";
            display: block;
            border: 1px solid #b00000;
            /* position: absolute;
           width: 77px;
           height: 0px; */
        }

        .detailLink:after {
            content: "";
            display: block;
            position: absolute;
            border: 5px solid;
            /* width: 0px;
           height: 0px; */
            border-color: #b00000 transparent transparent;
            /* left: 50%; */
            margin-left: 42px;
            margin-top: -48px;
        }

        .reviewLink {
            padding: 0px 18px;
            border-right: 1px dotted #d2d2d2;
            color: #333333;
        }

        .detailReviewNumber {
            color: #3355b9;
        }

        .productDetailPrame {
            border: 1px solid #dfdfdf;
            padding: 40px;
        }

        .detailPrame {
            margin-bottom: 20px;
            color: #999999;
            font-weight: bold;
        }

        .prameList span {
            /* display: block; */
            width: 225px;
            /* border: 1px solid red; */
            float: left;
            padding: 8px 1px;
            color: #666666;
        }

        .productDetailImg img {
            display: block;
            padding: 20px 0px;
            width: 790px;
        }

        /* note
            product review  */
        .productReviewDiv {
            width: 790px;
            margin: 40px auto;
        }

        .reviewTop {
            border: 1px solid #dfdfdf;
        }

        .reviewDetailLink {
            display: inline-block;
            /* border-left: 1px solid #cfbfb1; */
            /* border-right: 1px solid #cfbfb1; */
            line-height: 46px;
            width: 90px;
            text-align: center;
            /* font-weight: bold; */
            color: #333333;

        }

        .reviewSelected {
            display: inline-block;
            border-left: 1px solid #cfbfb1;
            border-right: 1px solid #cfbfb1;
            line-height: 46px;
            width: 90px;
            text-align: center;
            color: #b10000;
            font-weight: bold;
            position: relative;
            text-decoration: none;
        }

        .reviewSelected:before {
            content: "";
            border: 1px solid;
            display: block;

        }

        .reviewSelected:after {
            content: "";
            display: block;
            border: 5px solid;
            border-color: #b1000b transparent transparent;
            position: absolute;
            left: 48%;
            top: 0px;
        }

        .reviewContents {
            /* border: 1px solid red; */
            margin-top: 40px;
        }

        .reviewItem {
            border-bottom: 1px solid #dfdfdf;
            /* border: 1px solid; */
        }

        .reviewContent {
            margin-top: 10px;
            margin-right: 30px;
            margin-left: 20px;
            /* border: 1px solid; */
            width: 80%;
            float: left;
        }

        .reviewName {
            padding-top: 20px;
            margin-left: px;
            /* border: 1px solid red; */

        }

        .reviewData {
            margin-top: 15px;
            color: #cccccc;
        }

        a:hover {
            color: #c40000;
            text-decoration: none;
        }
      
    </style>
    <script>
        $(function () {
            $(".smallImg").mouseenter(function () {
                var url = $(this).attr("bigImageUrl");
                $(".bigImg").attr("src", url);
            });
            // $(".bigImg").load(function () {
            //     $(".smallImg").each(function () {
            //         var bigimgUrl = $(this).attr("bigImageUrl");
            //         var img = new Image();
            //         img.src = bigimgUrl;
            //         img.onload = function () {
            //             console.log(bigimgUrl);
            //             $(".imgLoad").append($(img));
            //         }
            //     });
            // });

            var stock = ${p.stock};
            $(".increaseNumber").click(function () {
                var num = $(".productNumberSetting").val();
                num++;
                if (num > stock)
                    num = stock;
                $(".productNumberSetting").val(num);
            })
            $(".decreaseNumber").click(function () {
                var num = $(".productNumberSetting").val();
                num--;
                if (num < 1)
                    num = 1;
                $(".productNumberSetting").val(num);
            })
            $(".productNumberSetting").keyup(function () {
                var num = $(".productNumberSetting").val();
                if (isNaN(num))
                    num = 1;
                if (num > stock)
                    num = stock;
                // if (num < 1)
                //     num = 1;
                if (num.length == 0)
                    num = null;
                $(".productNumberSetting").val(num);
            })
            $(".productNumberSetting").mouseout(function () {
                var num = $(".productNumberSetting").val();
                if (num.length == 0)
                    $(".productNumberSetting").val(1);
            })

            $(".reviewLink").click(function () {
                $(".productDetailDiv").hide();
                $(".productReviewDiv").show();
            })
            $(".reviewDetailLink").click(function () {
                $(".productDetailDiv").show();
                $(".productReviewDiv").hide();
            })
    		$(".addButton").click(function(){
       	 		var page = "forecheckLogin";
       			 $.get(
               		 page,
               		 function(result){
                    	if("success"==result){
                        var pid = ${p.id};
                        var num= $(".productNumberSetting").val();
                        var addCartpage = "foreaddCart";
                        $.get(
                                addCartpage,
                                {"pid":pid,"num":num},
                                function(result){
                                    if("success"==result){
                                        $(".addButton").html("追加されました");
                                        $(".addButton").attr("disabled","disabled");
                                        $(".addButton").css("background-color","lightgray")
                                        $(".addButton").css("border-color","lightgray")
                                        $(".addButton").css("color","black")
                                          
                                    }
                                    else{
                                          
                                    }
                                }
                        );                         
                    }
                    else{
                        $("#loginModal").modal('show');                    
                    }
                }
        );     
        return false;
    });
            $(".buyLink").click(function(){
                var page = "forecheckLogin";
                $.get(
                        page,
                        function(result){
                            if("success"==result){
                                var num = $(".productNumberSetting").val();
                                location.href= $(".buyLink").attr("href")+"&num="+num;
                            }
                            else{
                                $("#loginModal").modal('show');                    
                            }
                        }
                );     
             return false;
            });
            /*model login  */
		    
            $("button.loginSubmitButton").click(function(){
            	var name = $("#name").val();
            	var password = $("#password").val();
            	if(name.length==0){
            		$("span.errorMessage").html("ユーザ名を入力してください");
            		$("div.loginErrorMessageDiv").show();			
            		return false;
            	}
            	if(password.length==0){
            		$("span.errorMessage").html("パスワードを入力してください");
            		$("div.loginErrorMessageDiv").show();	
            		return false;
            	}
            	var page = "foreloginAjax";
            	$.get(
                        page,
                        {"name":name,"password":password},
                        function(result){
                        	if(result=="success"){
                        		location.reload();
                        	}
                        	else{
                        		$("span.errorMessage").html("ユーザ名かパスワードが見つかりません");
                        		$("div.loginErrorMessageDiv").show();	            		
                        	}
                        }
            	);			
            	return true;
            });
        });
    </script>
</head>

<body>
	<%@include file="include/topWithSimpleSearch.jsp" %>

    <div class="productImgAndInfo">
        <div class="productImg">
            <div class="bigImgDiv"><img src="img/productSingle/${p.firstProductImage.id }.jpg" alt="" class="bigImg" width="100px"></div>
            <div class="smallImgDiv">
            	<c:forEach items="${p.productSingleImages }" var="pi">
                <img src="img/productSingle_small/${pi.id }.jpg" alt="" class="smallImg"
                    bigImageUrl="img/productSingle/${pi.id }.jpg">
                </c:forEach>
            </div>
            <div class="imgLoad hidden"></div>
        </div>
        <div class="productInfo">
            <div class="productTitle">${p.name }</div>
            <div class="productSubtitle">${p.subTitle }</div>
            <div class="productPrice">
                <div class="juhuasuanDiv">
                    <span class="juhuasuan">
	激安通販</span><span>この製品はもうすぐ激安通販開始</span>
                    <span class="juhuasuanTime">1日1時間</span><span>後開始</span>
                </div>
                <div class="productPriceDiv">
                    <div class="gouwujuanDiv">
                        <img src="img/site/gouwujuan.png" alt="" height="16px">
                        <span>すべてのTmall商品に通用</span>
                    </div>
                    <div class="originalPriceDiv">
                        <span class="originalPriceDesc">価格</span>
                        <span class="originalPriceYuan">¥</span>
                        <span class="originalPrice">
                        	<fmt:formatNumber type="number" value="${p.orignalPrice}" minFractionDigits="2"/>
                        </span>
                    </div>
                    <div class="promotePriceDiv">
                        <span class="promotePriceDesc">割引価格</span>
                        <span class="promotePriceYuan">¥</span>
                        <span class="promotePrice">
                        	<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
                        </span>
                    </div>
                </div>
            </div>
            <div class="saleAndReviewNumber">
                <span class="sale">売上<span class="saleNumber">${p.saleCount }</span></span>
                <span class="middleOfSaleAndReview">|</span>
                <span class="review">累計評価<span class="reviewNumber">${p.reviewCount }</span></span>
            </div>
            <div class="buyNumber">
                <span>数量</span>
                <span>
                    <input type="text" value="1" class="productNumberSetting">
                    <span class="arrow">
                        <a href="#nowhere" class="increaseNumber">
                            <span class="updown"><img src="img/site/increase.png" alt=""></span>
                        </a>
                        <span class="updownMiddle"></span>
                        <a href="#nowhere" class="decreaseNumber"">
                            <span class=" updown"><img src="img/site/decrease.png" alt=""></span>
                    </a>
                </span>件
                </span>
                <span class="stockNumber">在庫${p.stock }件</span>
            </div>
            <div class="serviceCommit">
                <span class="commitDesc">サービス誓約</span>
                <span class="commitLink">
                    <a href="">本物保証</a>
                    <a href="">迅速な払戻し</a>
                    <a href="">無料貨物保険</a>
                    <a href="">7日以内に自由返品</a>
                </span>
            </div>
            <div class="buyDiv">
                <a href="forebuyOne?pid=${p.id}" class="buyLink"><button class="buyButton">すぐ購入</button></a>
                <a href="" class="addLink"><button class="addButton"><span
                            class="glyphicon glyphicon-shopping-cart"></span>カートに追加</button></a>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="productDetailDiv">
        <div class="productDetailTop">
            <a href="#nowhere" class="detailLink">商品詳細</a>
            <a href="#nowhere" class="reviewLink">累計評価<span class="detailReviewNumber">${p.reviewCount }</span></a>
        </div>
        <div class="productDetailPrame">
            <div class="detailPrame">製品パラメーター：</div>
            <div class="prameList">
            	<c:forEach items="${pvs }" var="pv">
            		<span>${pv.property.name }:${fn:substring(pv.value,0,10) }</span>
            	</c:forEach>
            </div>
            <div style="clear: both"></div>
        </div>
        <div class="productDetailImg">
        	<c:forEach items="${p.productDetailImages }" var="pi">
        		<img src="img/productDetail/${pi.id }.jpg" alt="">
        	</c:forEach>
            <img src="img/productDetail/8626.jpg" alt="">
        </div>
    </div>
    <div class="productReviewDiv" style="display: none;">
        <div class="reviewTop">
            <a href="#nowhere" class="reviewDetailLink">商品詳細</a>
            <a href="#nowhere" class="reviewSelected">累計評価<span class="reviewSelectedNumber"></span></a>
        </div>
        <div class="reviewContents">
        	<c:forEach items="${reviews }" var="r">
        		<div class="reviewItem">
                <div class="reviewContent">
                   	${r.content }
                    <div class="reviewData">
                    	<fmt:formatDate value="${r.createDate }"  pattern="yyyy-MM-dd HH:ss:mm"/>
                    </div>
                </div>
                <div class="reviewName">${r.user.anonymousName }<span class="nameGray">（匿名）</span></div>
                <div style="clear: both"></div>
            </div>
        	</c:forEach>
        </div>
    </div>
    
  	<%@include file="include/footer.jsp" %>
  
  	<div class="modal " id="loginModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog loginDivInProductPageModalDiv">
	        <div class="modal-content">
					<div class="loginDivInProductPage">
						<div class="loginErrorMessageDiv">
							<div class="alert alert-danger" >
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
							  	<span class="errorMessage"></span>
							</div>
						</div>
						<div class="login_acount_text">ユーザログイン</div>
						<div class="loginInput " >
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-user"></span>
							</span>
							<input id="name" name="name" placeholder="携帯/ユーザ名/メールアドレス" type="text">			
						</div>
						
						<div class="loginInput " >
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-lock"></span>
							</span>
							<input id="password" name="password"  type="password" placeholder="パスワード" type="text">			
						</div>
								
						<div>
							<a href="#nowhere">パスワードを忘れました</a> 
							<a href="register.jsp" class="pull-right">無料登録</a> 
						</div>
						<div style="margin-top:20px">
							<button class="btn btn-block redButton loginSubmitButton" type="submit">ログイン</button>
						</div>
					</div>	
	      </div>
	</div>
</div>

</div>
</body>

</html>