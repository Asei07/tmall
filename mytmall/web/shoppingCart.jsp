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
        /* note
            top and foot of cart */
        body {
            font-size: 12px;
            font-family: Arial;
            color: black;
        }

        .cartDiv {
            max-width: 1013px;
            margin: 100px auto 0px auto;
        }

        .cartTopPrice {
            color: #c40000;
            font-weight: bold;
            font-size: 14px;
        }

        .orderButton {
            background-color: rgb(170, 170, 170);
            /* font-size: 14px; */
            color: white;
            border: none;
            width: 53px;
            height: 25px;
            border-radius: 2px;
        }

        .cartFoot {
            background-color: #e5e5e5;
            line-height: 50px;
            padding-left: 20px;
            margin-top: 20px;
        }

        .cartFootRight button {
            background-color: rgb(170, 170, 170);
            color: white;
            border: none;
            width: 120px;
            height: 50px;
            font-size: 20px;
            border-radius: 2px;
        }

        .cartProductNumber {
            color: #c40000;
            font-size: 16px;
            font-weight: bold;
        }

        .cartFootPrice {
            color: #c40000;
            font-size: 20px;
            font-weight: bold;
        }

        /* note
            item of cart */
        .cartItem {
            /* border: 1px solid;  */
            margin: 10px auto;
        }

        .cartItemTable {
            width: 100%;
        }

        .cartItemTable th {
            /* margin: 20px; */
            padding: 20px;
            font-weight: normal;
            color: #3c3c3c;
            /* border: 1px solid; */
        }

        .eachCartItem {
            border: 1px solid #cccccc;
        }

        .eachCartItem td {
            /* border: 1px solid #eeeeee; */
            padding: 20px;

        }

        .cartItemImg {
            padding: 1px;
            border: 1px solid #eeeeee;
            width: 80px;
            height: 80px;
        }

        .cartItemLinkDiv {
            /* border: 1px solid; */
            /* margin-top: -35px; */
            position: relative;
            height: 80px;
        }

        .cartItemInsure {
            position: absolute;
            bottom: 0px;
        }

        .cartOriginalPrice {
            display: block;
            color: #9c9c9c;
            text-decoration: line-through;
            font-size: 14px;
            font-weight: bold;
        }

        .cartPromotePrice {
            color: #c40000;
            font-size: 14px;
            font-weight: bold;
        }

        .cartChangeNumber {
            border: 1px solid #e5e5e5;
            width: 80px
        }

        .cartChangeNumber a {
            display: inline-block;
            width: 14px;
            text-align: center;
            color: black;
        }

        .cartNumberSet {
            width: 42px;
            border: 1px solid #aaaaaa;
            /* display: inline-block;   */
        }

        .cartItemPrice {
            color: #c40000;
            font-size: 14px;
            font-weight: bold;
        }

        .cartItemDelete {
            color: #aaaaaa;
        }

        .cartItemLink {
            color: black;
        }

        .cartDiv a:hover {
            text-decoration: none;
            color: #c40000;
        }

        .cartItemSelect,
        .selectAll {
            cursor: pointer;
        }

      
    </style>
    <script>
        function formatMoney(num) {
            num = num.toString().replace(/\$|\,/g, '');
            if (isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
         num = Math.floor(num * 100 + 0.50000000001); 
            cents = num % 100;
            num = Math.floor(num / 100).toString();

            if (cents < 10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
                num = num.substring(0, num.length - (4 * i + 3)) + ',' +
                    num.substring(num.length - (4 * i + 3));
            return (((sign) ? '' : '-') + num + '.' + cents);
        }
        //背景色変更と決算ボダンを変更
        function syncOrderButton() {
            var selectAny = false;
            $(".cartItemSelect").each(function () {
                if ($(this).attr("select") == "selected")
                    selectAny = true;
            });
            if (selectAny) {
                $(".orderButton").css("background-color", "#c40000");
                $(".orderButton").removeAttr("disabled");
            } else {
                $(".orderButton").css("background-color", "#aaaaaa");
                $(".orderButton").attr("disabled", "disabled");
            }
        }
      //全選択チェックボックス変更
        function syncSelect() {
            var select = true;
            $(".cartItemSelect").each(function () {
                if ($(this).attr("select") == "false")
                    select = false;
            });
            if (select) {
                $(".selectAll").attr("src", "img/site/cartSelected.png");
                $(".selectAll").attr("select", "selected");
            } else {
                $(".selectAll").attr("src", "img/site/cartNotSelected.png");
                $(".selectAll").attr("select", "false");
            }
        }
        //総額と数設定
        function cartPriceAndNumber() {
            var sum = 0;
            var totalNumber = 0;
            $(".cartItemSelect[select = 'selected']").each(function () {
                var oiid = $(this).attr("oiid");
                var price = $(".cartItemPrice[oiid=" + oiid + "]").text();
                price = price.replace(/,/g, "");
                price = price.replace(/￥/g, "");
                // price = price.replace(/./g,"");
                sum += new Number(price);
                var num = $(".cartNumberSet[oiid=" + oiid + "]").val();
                totalNumber += new Number(num);
            });
            $(".cartTopPrice").html("￥"  +  formatMoney(sum));
            $(".cartFootPrice").html("￥"  + formatMoney(sum));
            $(".cartProductNumber").html(totalNumber);
        }
        function syncPrice(pid, num, price,oiid) {
            var itemPrice = formatMoney(num * price);
            $(".cartNumberSet[pid=" + pid + "]").val(num);
            $(".cartItemPrice[pid=" + pid + "]").html("￥" + itemPrice);
            cartPriceAndNumber();
            var page = "forechangeOrderItem";
            $.post(
                page,
                {"oiid":oiid, "num":num},
                function(result){
                    if(result != "seccess"){
                         location.href = "login.jsp"; 
                    }
                }
            )
        }

        $(function () {
            $(".cartItemSelect").click(function () {
                var isSelected = $(this).attr("select");
                if (isSelected == "selected") {
                    $(this).attr("src", "img/site/cartNotSelected.png");
                    $(this).attr("select", "false");
                    $(this).parents("tr.eachCartItem").css("background-color", "#fff");
                } else {
                    $(this).attr("src", "img/site/cartSelected.png");
                    $(this).attr("select", "selected");
                    $(this).parents("tr.eachCartItem").css("background-color", "#fff8e1");
                }
                syncOrderButton();
                syncSelect();
                cartPriceAndNumber();
            });

            $("img.selectAll").click(function () {
                var isSelected = $(this).attr("select");
                if (isSelected == "false") {
                    $(this).attr("select", "selected");
                    $(this).attr("src", "img/site/cartSelected.png");
                    $(".cartItemSelect").each(function () {
                        $(this).attr("select", "selected");
                        $(this).attr("src", "img/site/cartSelected.png");
                        $(this).parents(".eachCartItem").css("background-color", "#fff8e1");
                    })
                } else {
                    $(this).attr("select", "false");
                    $(this).attr("src", "img/site/cartNotSelected.png");
                    $(".cartItemSelect").each(function () {
                        $(this).attr("select", "false");
                        $(this).attr("src", "img/site/cartNotSelected.png");
                        $(this).parents(".eachCartItem").css("background-color", "#fff");
                    });
                }
                syncOrderButton();
                cartPriceAndNumber();
            });
            
            $(".cartNumberIncrease").click(function () {
                var oiid = $(this).attr("oiid");
                var pid = $(this).attr("pid");
                var num = $(".cartNumberSet[pid=" + pid + "]").val();
                var stock = $(".productStock[pid=" + pid + "]").text();
                var price = $(".productPromotePrice[pid=" + pid + "]").text();
                num++;
                if (num > stock)
                    num = stock;
                syncPrice(pid, num, price,oiid);
            });
            
            $(".cartNumberDecrease").click(function () {
                var oiid = $(this).attr("oiid");
                var pid = $(this).attr("pid");
                var num = $(".cartNumberSet[pid=" + pid + "]").val();
                var stock = $(".productStock[pid=" + pid + "]").text();
                var price = $(".productPromotePrice[pid=" + pid + "]").text();
                num--;
                if (num < 1)
                    num = 1;
                syncPrice(pid, num, price,oiid);
            });
            
            $(".cartNumberSet").keyup(function () {
                var num = $(this).val();
                var pid = $(this).attr("pid");
                var oiid = $(this).attr("oiid");
                var stock = $(".productStock[pid=" + pid + "]").text();
                var price = $(".productPromotePrice[pid=" + pid + "]").text();
                num = parseInt(num);
                if (num > stock) {
                    num = stock;
                    alert("在庫切れ");
                }
                if (num < 1 || isNaN(num))
                    num = 1;
                syncPrice(pid, num, price,oiid);
            });

            $(".cartItemDelete").click(function () {
                var r = confirm("削除しますか？");
                var oiid = $(this).attr("oiid");
                var page = "foredeleteOrderItem";
                if (r) {
                    $.post(
                        page,
                        {"oiid":oiid},
                        function(result){
                        	if(result == "success"){
                        		$(".eachCartItem[oiid="+oiid+"]").remove();
                              /*   $(".cartItemSelect[oiid=" + oiid + "]").attr("select", "false");
                                cartPriceAndNumber();	 */
                        	}
                        }
                    )         
                }          
            });
            
            $(".orderButton").click(function(){
                   var params = "";
                   $(".cartItemSelect").each(function(){
                        if($(this).attr("select") == "selected"){
                            var oiid = $(this).attr("oiid");
                            params += "&oiid=" + oiid; 
                        } 
                   })
                    params = params.substring(1);
                    location.href = "forebuy?" + params;
              });
            
        });
    </script>
</head>

<body>
    <%@include file="include/topWithSimpleSearch.jsp"%>
    <div class="cartDiv">
        <div class="cartTop" style="float: right">
            <span>選択したアイテム (送料は含まれていません) </span>
            <span class="cartTopPrice">￥0.00</span>
            <button class="orderButton" disabled="disabled">決　算</button>
        </div>
        <div style="clear: both"></div>
        <div class="cartItem">
            <table class="cartItemTable">
                <thead>
                    <tr>
                        <th> <img src="img/site/cartNotSelected.png" alt="" class="selectAll" select="false"> すべて選択</th>
                        <th>商品情報</th>
                        <th>単価</th>
                        <th>数量</th>
                        <th>金額</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ois}" var="oi" >
                    <c:if test="${oi.order.id == 0 }">
                    <tr class="eachCartItem"  oiid=${oi.id }>
                        <td width="150px">
                            <img src="img/site/cartNotSelected.png" alt="" select="false" class="cartItemSelect"
                                oiid="${oi.id}">
                            <img src="img/productSingle_middle/${oi.product.firstProductImage.id }.jpg" alt="" class="cartItemImg" width="40px">
                        </td>
                        <td>
                            <div class="cartItemLinkDiv">
                                <a href="foreproduct?pid=${oi.product.id}" class="cartItemLink">${oi.product.name}</a>
                                <div class="cartItemInsure">
                                    <img src="img/site/creditcard.png" alt="" title="支持信用卡支付">
                                    <img src="img/site/7day.png" alt="" title="消费者保障服务,承诺7天退货">
                                    <img src="img/site/promise.png" alt="" title="消费者保障服务,承诺如实描述">
                                </div>
                            </div>
                        </td>
                        <td width="150px">
                            <span class="cartOriginalPrice">￥
                            <fmt:formatNumber value="${oi.product.orignalPrice}"  minFractionDigits="2"/>
                            </span>
                            <span class="cartPromotePrice">￥
                            <fmt:formatNumber value="${oi.product.promotePrice}"  minFractionDigits="2"/>
                            </span>
                        </td>
                        <td>
                            <div class="cartChangeNumber">
                                <span class="productStock hidden" pid="${oi.product.id}">${oi.product.stock}</span>
                                <span class="productPromotePrice hidden" pid="${oi.product.id}">${oi.product.promotePrice}</span>
                                <a href="#nowhere" class="cartNumberDecrease" pid="${oi.product.id}" oiid="${oi.id }">-</a>
                                <input type="text" class="cartNumberSet" value="${oi.number}" oiid="${oi.id}" pid="${oi.product.id}">
                                <a href="#nowhere" class="cartNumberIncrease" pid="${oi.product.id}" oiid="${oi.id }">+</a>
                            </div>
                        </td>
                        <td width="150px">
                            <span class="cartItemPrice" oiid="${oi.id}" pid="${oi.product.id}">￥
                            	<fmt:formatNumber value="${oi.product.promotePrice * oi.number}"  minFractionDigits="2"/>
                            </span>
                        </td>
                        <td width="70px">
                            <a href="#nowhere" class="cartItemDelete" oiid="${oi.id}">削除</a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="cartFoot">
            <img src="img/site/cartNotSelected.png" alt="" class="selectAll"  select="false">
            <span>すべて選択</span>
            <div class="cartFootRight" style="float:right">
                <span>選択したアイテム <span class="cartProductNumber">0</span> 件 決算 (送料は含まれていません): </span>
                <span class="cartFootPrice">￥0.00</span>
                <button class="orderButton" disabled="disabled">结 算</button>
            </div>
        </div>
    </div>
    <%@include file="include/footer.jsp"%>
</body>

</html>
