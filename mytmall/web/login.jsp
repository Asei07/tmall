<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<head>

    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap/3.3.6/bootstrap.min.css">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/fore/footer.css">
    <style> 
    	body{
    		font-size:12px;
    	}
       .simpleLogo{
           padding:30px 0px;
       }
        .loginBackgroundImg{
            display: block;
            margin: auto;
        }
        .loginWindowDiv{
            height: 400px;
            width: 350px;
            background-color: white;
            position: absolute;
            top:180px;
            right:100px;
            padding: 60px 30px;
        }
        .loginText{
            font-size: 16px;
            font-weight: bold;
        }
        .loginInput{
            margin: 20px 0px;
            border: 1px solid #cbcbcb;
        }
        .loginIcon{
            display: inline-block;
            background-color: #cbcbcb;
            height: 40px;
            width: 40px;
        }
        .glyphicon{
            font-size: 22px;
            position: block;
            top: 8px;
            left: 8px;
            color:#606060;
        }
        .loginInput input{
            border: 0px;
            width: 235px;
            height: 30px;
            top: 3px;
            position: relative;
            outline: none;
        }
        .loginDiv a{
            color: #999;
        }
        .loginDiv a:hover{
            color: #c40000;
            text-decoration: none;
        }
        .loginButton{
            width: 290px;
            margin-top:20px;
            background-color: #c40000;
            color: white;
            border: 1px solid;
            border-radius: 5px;
            line-height: 30px;
            font-weight: bold;
        }
        .loginErrorMessage{
        	position:absolute;
			width:280px;
			top:20px;
			visibility:hidden;
        }
    </style>
    <script>
		$(function(){

			/* <c:if test="${!empty errorMessage}">
				$(".errorMessage").html("${errorMessage}");
				$(".loginErrorMessage").css("visibility","visible");
			</c:if> */

			<c:if test="${!empty errorMessage}">
		   	 $(".errorMessage").html("${errorMessage}");
		   	 $(".loginErrorMessage").css("visibility","visible");
		    </c:if>

			$(".loginForm").submit(function(){
				if($("#name").val().length == 0){
					$(".errorMessage").html("ユーザ名を入力してください");
					$(".loginErrorMessage").css("visibility","visible");
					return false;
				}
				if($("#password").val().length == 0){
					$(".errorMessage").html("パスワードを入力してください");
					$(".loginErrorMessage").css("visibility","visible");
					return false;
				}
				return true;
			});
		});
    </script>
</head>
<body>
    <div class="loginDiv">
        <div class="simpleLogo">
            <img src="img/site/simpleLogo.png" alt="">
        </div>
        <img src="img/site/loginBackground.png" alt="" class="loginBackgroundImg">
        <form action="forelogin" method="post" class="loginForm">
        <div class="loginWindowDiv">
        	<div class="loginErrorMessage">
        		<div class="alert alert-danger" style="padding:5px !important">
        			<span class="errorMessage"></span>
        		</div>
       		 </div>
            <div class="loginText">账户登陆</div>
            <div class="loginInput">
                <span class="loginIcon">
                    <span class="glyphicon glyphicon-user"></span>
                </span>
                <input type="text" name="name" id="name">
            </div>
            <div class="loginInput">
                <span class="loginIcon">
                    <span class="glyphicon glyphicon-lock"></span>
                </span>
                <input type="password" name="password" id="password">
            </div>
            <div>
            <a href="#nowhere">忘记登陆密码</a>
            <a href="register.jsp" class="pull-right">免费注册</a>
            </div>
            <div>
            <button class="loginButton">登陆</button>
            </div>
        </div>
        </form>
    </div>
   	<%@include file="include/footer.jsp" %>
</body>
</html>