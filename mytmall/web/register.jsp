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
    <link rel="stylesheet" href="css/fore/register.css">
    <title>Document</title>
	<script>
		$(function(){

			<c:if test="${!empty errorMessage}">
		    $(".errorMessage").html("${errorMessage}");
		    $(".registerErrorMessage").css("visibility","visible");
		    </c:if>

			$(".registerForm").submit(function(){
				if($("#name").val().length == 0){
					$(".errorMessage").html("ユーザー名を入力してください");
					$(".registerErrorMessage").css("visibility","visible");
					return false;
				}
				if($("#password").val().length == 0){
					$(".errorMessage").html("パスワードを入力してください");
					$(".registerErrorMessage").css("visibilitey","visible");
					return false;
				}
				if($("#confirmPassword").val().length == 0){
					$(".errorMessage").html("確認パスワードを入力してください");
					$(".registerErrorMessage").css("visibilitey","visible");
					return false;
				}
				if($("#password").val() != $("#confirmPassword").val()){
					$(".errorMessage").html("同じパスワードを入力してください");
					$(".registerErrorMessage").css("visibilitey","visible");
					return false;
				}
				return true;
			});
		});

	</script>

</head>

<body>
	<%@include file="include/topWithSimpleSearch.jsp" %>

	<form action="foreregister" method="post" class="registerForm">
    <div class="registerDiv" >
    	<div class="registerErrorMessage" >
    		<div class="alert alert-danger"  >
				<span class="errorMessage" ></span>
    		</div>
    	</div>
        <table class="registerTB">
            <tbody>
                <tr>
                    <td class="registerText">设置会员名</td>
                </tr>
                <tr>
                    <td class="registerRightText">登录名</td>
                    <td><input type="text" name="name" id="name"></td>
                </tr>
                <tr>
                    <td class="registerText">设置登陆密码</td>
                    <td>登陆时验证，保护账号信息</td>
                </tr>
                <tr>
                    <td class="registerRightText">登陆密码</td>
                    <td><input type="password" name="password" id="password"></td>
                </tr>
                <tr>
                    <td class="registerRightText">密码确认</td>
                    <td><input type="password" id="confirmPassword"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button class="registerButton">提交</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
	<%@include file="include/footer.jsp" %>
</body>

</html>
