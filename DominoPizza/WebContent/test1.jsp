<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 2] CDN(Content Deliver Network)주소 사용 -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
<!-- <script src="<c:url value='/JS/jquery-migrate-1.4.1.min.js'/>" type="text/javascript"></script> -->
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
		<script>
		$(function(){
			
			<img src="<c:url value='/Pizza/Image/pizzalist/'+$(this).val()+'H.png/>'" alt="선택한 첫 번째 피자" />
		$("#pizza_select1").change(function() {
			alert("들어오니");
			
		});
		
		
		
		});
		</script>
		
										<div class="form_group">
										<div class="form_field">
											<div class="sel_box">
												<select id="pizza_select1">
													<option value="">첫 번째 피자 선택</option>
														<option value="123">sdfsdf</option>
														<option value="123">sdfhsdfg</option>
														<option value="123">fgdsgh</option>
												</select>
											</div>
										</div>
										<div class="form_field">
											<div class="sel_box">
												<select id="pizza_select2">
													<option value="">두 번째 피자 선택</option>
													<c:forEach items="${pizzaList}" var="pizza">
														<option value="${pizza.p_name}">${pizza.p_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
</body>
</html>