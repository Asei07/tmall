<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>

<head>
    <script src="study/js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="study/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/fore/footer.css">
    <link rel="stylesheet" href="css/fore/topWithSimpleSearch.css">
    <style>
        .order {
            max-width: 1013px;
            margin: 100px auto 0px auto;
        }

        /* note
            the order of title */
        .orderTitle div {
            float: left;
            border-bottom: 2px solid #e8e8e8;
        }

        .orderTitle a {
            display: inline-block;
            border-right: 1px solid #e8e8e8;
            margin-bottom: 10px;
            padding: 0px 20px;
            color: black;
            font-weight: bold;
            font-size: 16px;
        }

        .lastOrderTitle {
            overflow: hidden;
            float: none !important;
        }

        .noRightLine {
            border-right: 0px !important;
        }

        .selectOrder {
            border-bottom: 2px solid #c40000 !important;
        }

        .selectOrder a {
            color: #c40000;
        }

        .orderListTitleTable {
            margin-top: 20px;
            width: 100%;
            background: #f5f5f5;
            height: 40px;
            text-align: center;
            font-size: 12px;
        }

        /* note
            the order of info */
        .orderListItem {
            margin: 20px 0px;
            /* border: 1px solid; */
        }

        .orderListItemTB {
            margin: 20px 0px;
            border: 2px solid #ececec;
            width: 100%;
            font-size: 12px;
        }

        .orderListItemTB td {
            /* border: 1px solid; */
            padding: 10px;
        }

        .orderItemFirstTR {
            background-color: #f1f1f1;
            /* border: 1px solid; */
        }

        .orderItemDelete {
            text-align: right;
            font-size: 14px;
            color: #999999;
        }

        .wwGif {
            display: inline-block;
            background-image: url(img/site/wangwang.gif);
            height: 22px;
            width: 70px;
            background-repeat: no-repeat;
            background-color: transparent;
            background-attachment: scroll;
        }

        .orderItemLinkDiv {
            position: relative;
            height: 80px;
        }

        .orderItemLink {
            color: black;
        }

        .orderItemLink:hover {
            color: #c40000;
            text-decoration: none;
        }

        .orderItemInsure {
            position: absolute;
            bottom: 0px;
        }

        .orderOriginalPrice {
            display: block;
            font-size: 14px;
            color: #999999;
        }

        .orderPromotePrice {
            font-size: 14px;
        }

        .orderItemNumber {
            display: block;
            text-align: center;
        }

        .orderTotalPrice {
            display: block;
            font-size: 14px;
            font-weight: bold;
            /* text-align: center; */
        }

        .orderItemTD {
            border: 1px solid #ececec;
            text-align: center;
        }

        .orderButtonReview {
            padding: 5px 10px;
            border: 1px solid #dcdcdc;
            background-color: white;
            color: black;
            font-weight: bold;
            outline: none;
            border-radius: 2px;
        }

        .orderButtonReview:hover {
            border: 1px solid #c40000;
            color: #c40000;
        }

        .orderButtonConfirm {
            border: 1px solid;
            color: white;
            background-color: #66b6ff;
            padding: 5px 10px;
            border-radius: 2px;
            font-weight: bold;
            outline: none;
        }

        .orderButtonConfirm:hover {
            background-color: #118adb;
        }
    </style>
    <script>
        $(function () {
            $("a[orderStatus]").click(function () {
                var status = $(this).attr("orderStatus");
                if (status == 'all') {
                    $("table[orderStatus]").show();
                } else {
                    $("table[orderStatus]").hide();
                    $("table[orderStatus=" + status + "]").show();
                }
                $(".orderTitle div").removeClass("selectOrder");
                $(this).parent("div").addClass("selectOrder");
            });
            
            $(".orderDeleteLink").click(function(){
                var page = "foredeleteOrder";
                var oid = $(this).attr("oid");
                $.post(
                    page,
                    {"oid":oid},
                    function(result){
                        if(result == "success"){
                            $(".orderListItemTB[oid="+oid+"]").hide();
                        }else{
                            location.href = "login.jsp";
                        }
                    }
                )
            });
        });

    </script>
</head>

<body>
    <!-- <img src="img/site/wangwang.gif" alt=""> -->
    <%@include file="include/topWithSimpleSearch.jsp">
    <div class="order">
        <div class="orderTitle">
            <div class="selectOrder"><a href="" orderStatus="all">所有订单</a></div>
            <div><a href="#nowhere" orderStatus="waitPay">待付款</a></div>
            <div><a href="#nowhere" orderStatus="waitDelivery">待发货</a></div>
            <div><a href="#nowhere" orderStatus="waitConfirm">待收货</a></div>
            <div><a href="#nowhere" class="noRightLine" orderStatus="waitReview">待评价</a></div>
            <div class="lastOrderTitle"><a href="" style="visibility: hidden">2</a></div>
        </div>
        <div style="clear:both"></div>
        <div class="orderListTitle">
            <table class="orderListTitleTable">
                <tbody>
                    <td>宝贝</td>
                    <td width="100">单价</td>
                    <td width="100">数量</td>
                    <td width="120">实付款</td>
                    <td width="100">交易操作</td>
                </tbody>
            </table>
        </div>
        <div class="orderListItem">
            <c:forEach items="${os}" var="o">
            <table class="orderListItemTB" orderStatus="${o.status}" oid="${o.id}">
                <tbody>
                    <tr class="orderItemFirstTR">
                        <td colspan="2">
                            <b>${o.createDate}</b>
                            <span>订单号: ${o.orderCode}</span>
                        </td>
                        <td colspan="2">
                            <img src="img/site/orderItemTmall.png" alt="" width="13px">
                            <span>天猫商场</span>
                        </td>
                        <td>
                            <a href="" class="wwLink"><span class="wwGif"></span></a>
                        </td>
                        <td class="orderItemDelete">
                            <a href="" class="orderDeleteLink" oid="${o.id}">
                                <span class="glyphicon glyphicon-trash orderItemDelete"></span>
                            </a>
                        </td>
                    </tr>
                    <c:forEach itmes="${o.orderItems}" var="oi" varStatus="st">
                    <tr class="orderItemInfo">
                        <td>
                            <img src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg" alt="" class="orderItemImg" height="80px"
                                width="80px">
                        </td>
                        <td>
                            <div class="orderItemLinkDiv">
                                <a href="foreproduct?pid=${oi.product.id}" class="orderItemLink">${oi.product.name}</a>
                                <div class="orderItemInsure">
                                    <img src="img/site/creditcard.png" alt="" title="支持信用卡支付">
                                    <img src="img/site/7day.png" alt="" title="消费者保障服务,承诺7天退货">
                                    <img src="img/site/promise.png" alt="" title="消费者保障服务,承诺如实描述">
                                </div>
                            </div>
                        </td>
                        <td width="100px">
                            <span class="orderOriginalPrice">￥${oi.product.orignalPrice}</span>
                            <span class="orderPromotePrice">￥${oi.product.promotePrice}</span>
                        </td>
                        <c:if test="${st.count == 1}">
                        <td width="100px" class="orderItemTD">
                            <span class="orderItemNumber">${o.totalNumber}</span>
                        </td>
                        <td width="120px" class="orderItemTD">
                            <span class="orderTotalPrice">￥${o.total}</span>
                            <span>(含运费：￥0.00)</span>
                        </td>
                            <c:if test="${o.status == 'waitConfirm'}">
                                <td width="100px" class="orderItemTD">
                                <a href="forereceive?oid=${o.id}"><button class="orderButtonConfirm">受取確認</button></a>
                                </td>
                            </c:if>
                            <c:if test="${o.status == 'waitPay'}">
                                <td width="100px" class="orderItemTD">
                                <a href="forepay?oid=${o.id}&total=${o.total}"><button class="orderButtonConfirm">支払い</button></a>
                                </td>
                            </c:if>
                            <c:if test="${o.status == 'waitDelivery'}">
                                <td width="100px" class="orderItemTD">
                                <a href=""><button class="orderButtonConfirm">配達待ち</button></a>
                                </td>
                            </c:if>
                            <c:if test="${o.status == 'waitReview'}">
                                <td width="100px" class="orderItemTD">
                                <a href="forereview?oid=${o.id}"><button class="orderButtonConfirm">評価</button></a>
                                </td>
                            </c:if>
                        </c:if>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            </c:forEach>
<!--             <table class="orderListItemTB" orderStatus="waitReview">
                <tbody>
                    <tr class="orderItemFirstTR">
                        <td colspan="2">
                            <b>2016-09-12 17:00:41</b>
                            <span>订单号: 20160912170041674794</span>
                        </td>
                        <td colspan="2">
                            <img src="img/site/orderItemTmall.png" alt="" width="13px">
                            <span>天猫商场</span>
                        </td>
                        <td>
                            <a href="" class="wwLink"><span class="wwGif"></span></a>
                        </td>
                        <td class="orderItemDelete">
                            <a href="" class="orderItemDeleteLink">
                                <span class="glyphicon glyphicon-trash orderItemDelete"></span>
                            </a>
                        </td>
                    </tr>
                    <tr class="orderItemInfo">
                        <td>
                            <img src="img/productSingle_middle/3796.jpg" alt="" class="orderItemImg" height="80px"
                                width="80px">
                        </td>
                        <td>
                            <div class="orderItemLinkDiv">
                                <a href="" class="orderItemLink">依然美佳欧式布艺沙发组合可拆洗新款实木雕花大户型奢华别墅家具</a>
                                <div class="orderItemInsure">
                                    <img src="img/site/creditcard.png" alt="" title="支持信用卡支付">
                                    <img src="img/site/7day.png" alt="" title="消费者保障服务,承诺7天退货">
                                    <img src="img/site/promise.png" alt="" title="消费者保障服务,承诺如实描述">
                                </div>
                            </div>
                        </td>
                        <td width="100px;">
                            <span class="orderOriginalPrice">￥10,012.00</span>
                            <span class="orderPromotePrice">￥7,008.40</span>
                        </td>
                        <td width="100px" class="orderItemTD">
                            <span class="orderItemNumber">1</span>
                        </td>
                        <td width="120px" class="orderItemTD">
                            <span class="orderTotalPrice">￥7,008.40</span>
                            <span style="text-align: center">(含运费：￥0.00)</span>
                        </td>
                        <td width="100px" class="orderItemTD">
                            <a href=""><button class="orderButtonReview">评价</button></a>
                        </td>
                    </tr>
                </tbody>
            </table> -->
        </div>
    </div>
    <%@include file="include/footer.jsp">
</body>

</html>
