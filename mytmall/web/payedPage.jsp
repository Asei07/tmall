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
        body {
            font-size: 12px;
        }

        .payedDiv {
            border: 1px solid #d4d4d4;
            max-width: 1013px;
            margin: 100px auto 0px auto;
        }

        .payedTextInfo {
            background-color: #ecffdc;
            padding: 18px 20px;
        }

        .payedText {
            font-size: 14px;
            font-weight: bold;
            margin-left: 10px;
        }

        .payedAddressInfo {
            padding: 25px 20px;
        }

        .payedPrice {
            color: #c40000;
            font-weight: bold;
            font-size: 14px;
        }

        .payedLink {
            margin-left: 30px;
        }

        .payedSplitLine {
            border-top: 1px dotted #d4d4d4;
            margin: 0px 40px;
        }

        .payedWarnInfo {
            margin: 20px 30px 20px 30px;
        }

        .payedWarn {
            color: #c40000;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <nav class="top">
        <a href="${contextPath}">
            <span class="glyphicon glyphicon-home redColor"></span>
            天猫首页
        </a>
        <span>欢迎来天猫</span>
        <a href="">请登录</a>
        <a href="">免费注册</a>
        <span class="pull-right">
            <a href="">
                オーダー</a>
            <a href="">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                ショッピングカート<strong>0</strong>件
            </a>
        </span>
    </nav>
    <div class="simpleSearch">
        <a href=""><img class="smallLogo" src="img/site/simpleLogo.png" alt=""></a>
        <div class="pull-right smallSearch">
            <input type="text" placeholder="平衡车 原汁机">
            <button class="" type="submit" value="搜索">搜索</button>
            <div class="smallSearchBelow">
                <a href="">冰箱</a><span>|</span>
                <a href="">空调</a><span>|</span>
                <a href="">女表</a><span>|</span>
                <a href="">男表</a>
            </div>
        </div>
    </div>
    <div class="payedDiv">
        <div class="payedTextInfo">
            <img src="img/site/paySuccess.png" alt="">
            <span class="payedText">您已成功付款</span>
        </div>
        <div class="payedAddressInfo">
            <ul class="payedAddress">
                <li>收货地址： ${o.address} ${o.receiver} ${o.mobile}</li>
                <li>实付款：<span class="payedPrice">￥${total}</span></li>
                <li>预计08月08日送达</li>
            </ul>
            <div class="payedLink">
                <span>您可以</span>
                <a href="forebought">查看已买到的宝贝</a>
                <a href="forebought">查看交易详情</a>
            </div>
        </div>
        <div class="payedSplitLine"></div>
        <div class="payedWarnInfo">
            <img src="img/site/warning.png" alt="">
            <b>安全提醒:</b>
            <span>
                下单后，<span class="payedWarn">用QQ给您发送链接办理退款的都是骗子！</span> 天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
            </span>
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
