<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="study/js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="study/css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/topWithSimpleSearch.css">
    <style>
        /* note
            upper half of receive info */
        .receiveInfo {
            max-width: 1013px;
            margin: 100px auto 0px auto;
            /* border: 1px solid; */
        }

        .receiveImg {
            /* border: 1px solid; */
            width: 900px;
            margin: 20px auto 80px auto;
            position: relative;
        }

        .receiveImg div {
            color: #999999;
        }

        .time1 {
            position: absolute;
            top: 100px;
        }

        .time2 {
            position: absolute;
            left: 200px;
            top: 100px;
        }

        .time3 {
            position: absolute;
            top: 100px;
            left: 400px;
        }

        .receiveText {
            font-size: 16px;
            font-weight: bold;
            margin-left: 5px;
            border-bottom: 1px solid #adcbe6;
            padding-bottom: 15px;
            /* margin: 0px auto; */
            /* border: 1px solid; */
            /* width: 500px; */
            /* text-align: center; */
        }

        .receiveItemText {
            display: block;
            margin: 15px 15px;
            font-size: 14px;
        }

        .receiveItemTB {
            border: 1px solid #dddddd;
            width: 98%;
            margin: 0px auto;
        }

        .receiveItemTB thead {
            border: 1px solid #dddddd;
            background-color: #e8f2ff;
        }

        .receiveItemTB th {
            /* border: 1px solid; */
            font-size: 15px;
            text-align: center;
            width: 120px;
            height: 30px;
        }

        .receiveItemTB td {
            padding: 20px 20px;
            text-align: center;
        }

        .receiveAllPrice {
            float: right;
            margin: 20px 20px;
            font-size: 14px;
        }

        .receiveItemAllPrice {
            font-weight: bold;
            font-size: 18px;
            color: #666666;
        }

        .receiveAllPriceDigit {
            color: #c40000;
        }

        a {
            color: #999;
        }

        .receiveItemLink a:hover {
            color: #c40000;
            text-decoration: none;
        }

        /* note
           seconde half of receive info  */
        .receiveAddressTB {
            width: 95%;
            border-top: 1px solid #dddddd;
            margin: 0px auto;
        }

        .receiveAddressTB td {
            padding: 8px;
        }

        .receiveConfirm {
            margin-top: 40px;
            border: 1px solid #f58b0f;
            height: 120px;
            margin: 10px;
        }

        .wwIcon {
            display: inline-block;
            background-image: url(img/site/wangwang.gif);
            height: 20px;
            width: 70px;
            background-repeat: none;
            background-color: transparent;
        }

        .receiveConfirmText {
            padding: 20px 60px;
            font-size: 16px;
            color: red;
            font-weight: bold;
        }

        .receiveConfirmButton {
            border: 1px solid #e67c00;
            margin: 10px 60px;
            color: white;
            background-color: #f4a21d;
            border-radius: 4px;
            /* line-height: 20px; */
            padding: 5px;
            font-size: 12px;
            /* outline: none; */
        }

        .receiveConfirmButton:hover {
            background-color: #f6ae30;
        }
    </style>
</head>

<body>
    <nav class="top">
        <a href="${contextPath}">
            <span class="glyphicon glyphicon-home redColor"></span>
            ホームページ
        </a>
        <span>Tmallへようこそ</span>
        <a href="">ログイン</a>
        <a href="">無料登録</a>
        <span class="pull-right">
            <a href="">
                オーダー</a>
            <a href="">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                ショッピングカート<strong>0</strong>件
            </a>
        </span>
    </nav>
    <div>
        <a href="#nowhere"><img class="smallLogo" src="img/site/simpleLogo.png" alt=""></a>
        <form method="POST">
            <div class="simpleSearch">
                <div class="pull-right smallSearch">
                    <input type="text" placeholder="キーワードから捜す"">
                    <button class="" type=" submit" value="搜索">検索</button>
                    <div class="smallSearchBelow">
                        <a href="">冷蔵庫</a><span>|</span>
                        <a href="">本</a><span>|</span>
                        <a href="">スマホ</a><span>|</span>
                        <a href="">PC</a>
                    </div>
                </div>
            </div>
        </form>

    </div>
    <div class="receiveInfo">
        <div class="receiveImg">
            <img src="img/site/comformPayFlow.png" alt="">
            <div class="time1">2016-09-14 11:14:45</div>
            <div class="time2">2016-09-14 11:14:47</div>
            <div class="time3">yyyy-MM-dd HH:mm:ss</div>
        </div>
        <div class="receiveText">我已收到货，同意支付宝付款</div>
        <span class="receiveItemText">订单信息</span>
        <div class="receiveItemTBDiv">
            <table class="receiveItemTB">
                <thead>
                    <tr>
                        <th colspan="2">宝贝</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>商品总价</th>
                        <th>运费</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <img src="img/productSingle_middle/5848.jpg"" alt="" width=" 45px">
                        </td>
                        <td class="receiveItemLink">
                            <a href="">罗宾 钢带女表 女士腕表 水钻夜光防水石英表 潮流时尚复古手表女</a>
                        </td>
                        <td>￥990.00</td>
                        <td>1</td>
                        <td class="receiveItemAllPrice">￥792.00</td>
                        <td>快递 ： 0.00</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="receiveAllPrice">实付款：<span class="receiveAllPriceDigit">￥7,008.40</span></div>
        <div style="clear: both"></div>
        <div>
            <table class="receiveAddressTB">
                <tbody>
                    <tr>
                        <td>订单编号：</td>
                        <td>
                            201609141114454899001
                            <img src="img/site/confirmOrderTmall.png" alt="" width="23px">
                        </td>
                    </tr>
                    <tr>
                        <td>卖家昵称：</td>
                        <td>
                            天猫商铺
                            <a href="#nowhere"><span class="wwIcon"></span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>天猫商铺 </td>
                        <td>北京市 朝阳区 天安门 4栋二单元 490，朝阳群众， 15800000000，10000</td>
                    </tr>
                    <tr>
                        <td>成交时间：</td>
                        <td>2016-09-14 11:14:45</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="receiveConfirm">
            <div class="receiveConfirmText">请收到货后，再确认收货！否则您可能钱货两空！</div>
            <button class="receiveConfirmButton">确认支付</button>
        </div>
    </div>
    <div class="footer">
        <div class="ensureImg"><a href=""><img src="img/site/ensure.png" alt=""></a></div>
        <div class="footerColumn">
            <div class="column">
                <span>買い物ガイド</span>
                <a href="">無料登録</a>
                <a href="">PayPay申請</a>
                <a href="">PayPayチャージ</a>
            </div>
            <div class="column">
                <span>Tmall保証</span>
                <a href="">請求書保証</a>
                <a href="">アフターサービス</a>
                <a href="">在庫切れ補償</a>
            </div>
            <div class="column">
                <span>支払方法</span>
                <a href="">すぐ払い</a>
                <a href="">クレジットカード</a>
                <a href="">PayPay</a>
                <a href="">代金引換</a>
            </div>
            <div class="column">
                <span>ビジネスサービス</span>
                <a href="">Tmallルール</a>
                <a href="">ビジネスプレースメント</a>
                <a href="">ビジネスセンター</a>
                <a href="">Tmallシンクタンク</a>
                <a href="">物流サービス</a>
                <a href="">運用サービス</a>
            </div>
            <div class="column">
                <span>携帯Tmall</span>
                <a href=""><img src="img/site/ma.png" alt=""></a>
            </div>
        </div>
        <img class="catEar" src="img/site/cateye.png" alt="">
        <div class="copyright">
            <div class="whiteLink">
                <a href="#nowhere">Tmallについて</a>
                <a href="#nowhere">ヘルプセンター</a>
                <a href="#nowhere">オープンプラットフォーム</a>
                <a href="#nowhere">採用情報</a>
                <a href="#nowhere">問い合わせ</a>
                <a href="#nowhere">サイト協力</a>
                <a href="#nowhere">法的通知</a>
                <a href="#nowhere">知的財産権</a>
                <a href="#nowhere">プライバシーポリシー</a>
            </div>
            <div class="whiteLink">
                <a href="#nowhere">Alibaba Group</a><span class="slash">|</span>
                <a href="#nowhere">Taobao</a><span class="slash">|</span>
                <a href="#nowhere">Tmall </a><span class="slash">|</span>
                <a href="#nowhere">セール</a><span class="slash">|</span>
                <a href="#nowhere">グローバルAliExpress</a><span class="slash">|</span>
                <a href="#nowhere">アリババ国際市場</a><span class="slash">|</span>
                <a href="#nowhere">1688</a><span class="slash">|</span>
                <a href="#nowhere">アリママ</a><span class="slash">|</span>
                <a href="#nowhere">Ali Travel・Go</a><span class="slash">|</span>
                <a href="#nowhere">Alibaba Cloud</a><span class="slash">|</span>
                <a href="#nowhere">Ali Communications</a><span class="slash">|</span>
                <a href="#nowhere"> YunOS </a><span class="slash">|</span>
                <a href="#nowhere"> Wanwang </a><span class="slash">|</span>
                <a href="#nowhere"> ゴールド </a><span class="slash">|</span>
                <a href="#nowhere"> ビジョン </a><span class="slash">|</span>
                <a href="#nowhere"> 連携 </a><span class="slash">|</span>
                <a href="#nowhere"> エビ音楽 </a><span class="slash">|</span>
                <a href="#nowhere"> 毎日リスリング </a><span class="slash">|</span>
                <a href="#nowhere"> 旅行 </a><span class="slash">|</span>
                <a href="#nowhere"> ネイル </a><span class="slash">|</span>
                <a href="#nowhere"> アリペイ </a>
            </div>
            <div class="license">
                <span>付加価値通信ビジネスライセンス： 浙B2-20110446</span>
                <span>ネットワーク文化ビジネスライセンス：浙ネット[2015]0295-065号</span>
                <span>インターネットヘルスケア情報サービス レビュー同意書 セキュリティネットワークレビュー[2018] No. 6 </span>
                <span>インターネット医薬品情報サービス資格証明書番号：浙-（经营性）-2012-0005</span>
                <div class="copyRightYear">© 2003-2016 TMALL.COM 著作権</div>
                <div>
                    <img src="img/site/copyRight1.jpg">
                    <img src="img/site/copyRight2.jpg">
                </div>
            </div>
        </div>
    </div>
</body>

</html>