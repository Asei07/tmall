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
    <link rel="stylesheet" href="css/footer.css">
    <style>
        body {
            font-size: 12px;
            min-width: 1013px;
        }

        .confirmDiv {
            max-width: 1013px;
            margin: 20px auto;
        }

        /* note
            address */
        .address {
            margin: 20px 10px;
            /* text-align: left; */
        }

        .addressTip,
        .confirmText {
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 16px;
        }

        .addressTB {
            margin: 20px 20px;
            /* border: 1px solid; */
            width: 600px;
            font-size: 12px;
        }

        .addressTB td {
            padding: 5px 0px;
            vertical-align: top;

        }

        .addressTB textarea {
            width: 400px;
            border: 1px solid #afafaf;
        }

        .addressTB input {
            width: 200px;
            border: 1px solid #afafaf;
        }

        .redStar {
            font-size: 8px;
            color: #c40000;
        }

        /* note
            confirm info of order  */
        .confirmOrderDiv {
            margin: 30px 10px;
        }

        .confirmOrderTB {
            width: 100%;
        }

        .confirmOrderTB th {
            text-align: center;
            padding-bottom: 5px;
            color: #999999;
            font-weight: normal;
            /* border: 1px solid; */
        }

        .confirmOrderTB td {
            /* border: 1px solid; */
            text-align: center;
            /* margin: 10px; */
        }

        .confirmItemTr td {
            border-bottom: 1px solid #e5e5e5;
        }

        .orderFirstTd,
        .orderLastTd {
            border-bottom: none !important;
        }

        .firstTh {
            text-align: left !important;
        }

        .blueLine td {
            background-color: #b2d1ff;
            border-right: 2px solid white;
            height: 3px;
        }

        .wwGif {
            display: inline-block;
            background-image: url(img/site/wangwang.gif);
            width: 20px;
            height: 20px;
            background-position: -82px 0px;
            position: relative;
            top: 2px;
        }

        .confirmOrderImg {
            width: 60px;
            padding: 5px 0px;
        }

        .confirmImgTd,
        .confirmOrderItem {
            text-align: left !important;
        }

        .orderItemLink {
            display: block;
            color: black;
        }

        .confirmItemPrice {
            color: #c40000;
            font-weight: bold;
        }

        .confirmOrderFoot {
            background-color: #f2f6ff;
            margin-top: 10px;
            border-top: 2px solid #b4d0ff;
            /* height: 50px; */
        }

        .confirmOrderFoot span {
            display: inline-block;
            margin: 20px;
            color: #999999;
            clear: both;
        }
        .leaveMessageText{
            float: left;
        }
        .leaveMessageTextArea{
            resize: none;
            width:250px;
            height: 60px;
            border: 1px solid #ffad35;
        }
        .confirmPrice {
            margin: 20px;
            overflow: hidden;
            color: #999999;
        }

        .confirmPriceDigit {
            color: #c40000;
            font-weight: bold;
            font-size: 20px;
        }

        .confirmButton {
            background-color: #c40000;
            color: white;
            border-radius: 2px;
            border: 1px solid;
            width: 180px;
            height: 40px;
            font-size: 14px;
            font-weight: 700;

        }

        a {
            color: black;
        }

        a:hover {
            text-decoration: none;
            color: #c40000;
        }
    </style>
    <script>
        $(function(){
            $(".leaveMessageImg").click(function(){
                $(this).hide();
                $(".leaveMessage").show();
            });
        });
    </script>
</head>

<body>
    <%@include file="include/top.jsp">
    <div class="confirmDiv">
        <form action="forecreateOrder" method="post">
        <div class="confirmFlow">
            <img src="img/site/simpleLogo.png" alt="" class="pull-left">
            <img src="img/site/buyflow.png" alt="" class="pull-right">
        </div>
        <div style="clear: both"></div>
        <div class="address">
            <div class="addressTip">输入收货地址</div>
            <table class="addressTB">
                <tbody>
                    <tr>
                        <td>详细地址<span class="redStar">*</span></td>
                        <td><textarea name="address" id=""></textarea></td>
                    </tr>
                    <tr>
                        <td>邮政编码<span class="redStar">*</span></td>
                        <td><input type="text" placeholder="" name="post"></td>
                    </tr>
                    <tr>
                        <td>收货人姓名<span class="redStar">*</span></td>
                        <td><input type="text" placeholder="" name="name"></td>
                    </tr>
                    <tr>
                        <td>手机号码<span class="redStar">*</span></td>
                        <td><input type="text" placeholder="" name="mobile"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="confirmOrderDiv">
            <div class="confirmText">确认订单信息</div>
            <div class="confirmOrderInfo">
                <table class="confirmOrderTB">
                    <thead>
                        <tr>
                            <th colspan="2" class="firstTh">
                                <img src="img/site/tmallbuy.png" alt="" class="tmallImg" width="15px">
                                <a href="">店铺：天猫店铺</a>
                                <a href=""><span class="wwGif"></span></a>
                            </th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>小计</th>
                            <th>配送方式</th>
                        </tr>
                        <tr class="blueLine">
                            <td colspan="2"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach itmes="${ois}" var="oi" varStatus="st">
                                <tr class="confirmItemTr">
                                        <td class="confirmImgTd orderFirstTd"><img src="img/productSingle_middle/${oi.prouct.firstProductImage.id}.jpg" alt=""
                                                class="confirmOrderImg"></td>
                                        <td class="confirmOrderItem">
                                            <a href="" class="orderItemLink">${oi.product.name}</a>
                                            <img src="img/site/creditcard.png" alt="">
                                            <img src="img/site/7day.png" alt="">
                                            <img src="img/site/promise.png" alt="">
                                        </td>
                                        <td>${oi.product.promotePrice}</td>
                                        <td>${oi.number}</td>
                                        <td class="confirmItemPrice">${oi.product.promotePrice * oi.number}</td>
                                        <c:if test="${st.count == 1}">
                                        <td rowspan="10" class="orderLastTd">
                                            <input type="radio" checked>
                                            普通配送
                                            <select class="distributionMethod">
                                                <option value="">快递 免邮费</option>
                                            </select>
                                        </td>
                                        </c:if>
                                    </tr>                           
                        </c:forEach>      
                    </tbody>
                </table>
            </div>
            <div class="confirmOrderFoot">
                <div class="pull-left">
                    <span class="leaveMessageText">给卖家留言:</span>
                    <span class="leaveMessageImg"><img src="img/site/leaveMessage.png" alt=""></span>
                    <span class="leaveMessage" style="display: none;">
                        <textarea name="message" id=""  class="leaveMessageTextArea"></textarea>
                        <div class="typeText">还可输入200字符</div>
                    </span>
                </div>
                <div class="pull-right"> <span>店铺合计(含运费): ￥${total}</span></div>
                <div style="clear: both"></div>
            </div>
            <div class="confirmPrice">
                <div class="pull-right">
                    <span>实付款：</span>
                    <span class="confirmPriceDigit">￥${total} </span>
                </div>
            </div>
            <div style="clear: both"></div>
            <div><button class="confirmButton pull-right">提交订单</button></div>
        </div>
        </form>
    </div>
    <div style="clear: both;"></div>
    <%@include file="include/footer.jsp">
</body>

</html>
