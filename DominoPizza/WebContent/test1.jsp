<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		alert("공백제거전 ::"+$("#trimtest").val());
		alert("공백제거후 ::"+$.trim($("#trimtest").val()));
	})
</script>
</head>
<body>
<input type="text" id="trimtest" value = "      a  b  c" />
</body>
</html>