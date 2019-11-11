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
            width: 220px;
            /* border: 1px solid red; */
            float: left;
            padding: 8px 0px;
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
	    $(".buyLink").click(function(){
	    	var page = "forecheckLogin";
		$.get(
			page,
			function(result){
				if(result == "success"){
					var num = $(".productNumberSetting").val();
					location.href = $(".buyLink").attr("href") + "&num" + num;
				}else{
					$(".loginModal").modal('show');
				}
			}
		)
		    return false;
	    });
	    $(".addLink").click(function(){
	    	var page = "forecheckLogin";
		$.get(
			page,
			function(result){
				if(result == "success"){
					var pid = ${p.id};
					var num = $(".productNumberSetting").val();
					var cartPage = "foreaddCart";
					$.get(
						cartPage,
						("pid":pid,"num":num),
						function(result){
							if(result == "success"){
								$(".addButton").html("カートに追加されました");
								$(".addButton").aatr("disabled","disabled");
								$(".addButton").css("background-color","lightgray");
								$(".addButton").css("border-color","lightgray");
								$(".addButton").css("color","black");
							}else{}
						}
					);
				}else{
					$(".loginModal").modal('show');
				}
			}
		);
		    return false;
	    });
            var stock = 66;
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
                    <span class="juhuasuan">聚划算</span><span>此商品即将参加聚划算,</span>
                    <span class="juhuasuanTime">1天19小时</span><span>后开始</span>
                </div>
                <div class="productPriceDiv">
                    <div class="gouwujuanDiv">
                        <img src="img/site/gouwujuan.png" alt="" height="16px">
                        <span>全天猫实物商品通用</span>
                    </div>
                    <div class="originalPriceDiv">
                        <span class="originalPriceDesc">价格</span>
                        <span class="originalPriceYuan">¥</span>
                        <span class="originalPrice">${p.orignalPrice } </span>
                    </div>
                    <div class="promotePriceDiv">
                        <span class="promotePriceDesc">促销价</span>
                        <span class="promotePriceYuan">¥</span>
                        <span class="promotePrice">${p.promotePrice }</span>
                    </div>
                </div>
            </div>
            <div class="saleAndReviewNumber">
                <span class="sale">销量<span class="saleNumber">${p.saleCount }</span></span>
                <span class="middleOfSaleAndReview">|</span>
                <span class="review">累计评价<span class="reviewNumber">${p.reviewCount }</span></span>
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
                <span class="stockNumber">库存${p.stock }件</span>
            </div>
            <div class="serviceCommit">
                <span class="commitDesc">服务承诺</span>
                <span class="commitLink">
                    <a href="">正品保证</a>
                    <a href="">极速退款</a>
                    <a href="">赠运费险</a>
                    <a href="">七天无理由退换</a>
                </span>
            </div>
            <div class="buyDiv">
                <a href="forebuyOne?pid=${p.id}" class="buyLink"><button class="buyButton">立即购买</button></a>
                <a href="foreaddToCart?pid=${p.id}" class="addLink"><button class="addButton"><span
                            class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="productDetailDiv">
        <div class="productDetailTop">
            <a href="#nowhere" class="detailLink">商品详情</a>
            <a href="#nowhere" class="reviewLink">累计评价<span class="detailReviewNumber">${p.reviewCount }</span></a>
        </div>
        <div class="productDetailPrame">
            <div class="detailPrame">产品参数：</div>
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
            <a href="#nowhere" class="reviewDetailLink">商品详情</a>
            <a href="#nowhere" class="reviewSelected">累计评价<span class="reviewSelectedNumber">18</span></a>
        </div>
        <div class="reviewContents">
        	<c:forEach items="${reviews }" var="r">
        		<div class="reviewItem">
                <div class="reviewContent">
                   	${r.content }
                    <div class="reviewData">${r.createDate }</div>
                </div>
                <div class="reviewName">${r.user.anonymousName }<span class="nameGray">（匿名）</span></div>
                <div style="clear: both"></div>
            </div>
        	</c:forEach>

            <div class="reviewItem">
                <div class="reviewContent">
                    不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错
                    <div class="reviewData">2016-08-10</div>
                </div>
                <div class="reviewName">哀****莉<span class="nameGray">（匿名）</span></div>
                <div style="clear: both"></div>
            </div>
            <div class="reviewItem">
                <div class="reviewContent">
                    不强烈推荐，我的天，质量也太好了，让我情何以堪，大爱啊。说说我的体格吧，162.105斤，腰围大概是22，
                    穿m码刚刚好。快递那么快，特地跟店家说10号要外出店家也尽心备注的很好。真的特别感动，
                    我收藏店铺了，下次还来你们家。衣服比雪纺舒服，薄薄的，现在穿刚好，我配了高跟鞋和小白鞋都很完美。店家还送了无痕肩带，真的太细心了，给一百个好评，赞。衣服我看了没有线头，薄薄的。不说了，我赶紧发给我姐让她看看。
                    <div class="reviewData">2016-08-10</div>
                </div>
                <div class="reviewName">孤*****爱<span class="nameGray">（匿名）</span></div>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>
  	<%@include file="include/footer.jsp" %>
</body>

</html>
