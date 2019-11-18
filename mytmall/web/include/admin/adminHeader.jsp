<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/back/style.css" rel="stylesheet">

<script>
		function checkEmpty(id,name){
			var value = $("#"+id).val();
			if(value.length == 0){
				if(id == "name"){
					alert(name + "入力してください");
				}else{
					alert(name + "選択してください");
				}
				return false;
			}
			return true;
		};

	/* 	$(function(){
			$("a").click(function(){
				var deletelink = $(this).attr("deletelink");
				if(deletelink == "true"){
					var comfirmDelete = confirm("削除確認");
					if(comfirmDelete)
						return true;
					return false;
				}
			});
		}); */
</script>

</head>

<body>
</body>
</html>