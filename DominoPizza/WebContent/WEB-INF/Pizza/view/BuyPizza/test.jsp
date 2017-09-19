<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
ㅇㄹㄴㅇㄹㄴㅇㄹ
<c:forEach var="list" items="${list}" varStatus="loop">

${list.t_kind} : ${list.t_name} / ${list.t_size} / ${list.t_price} / ${list.t_gram} / ${list.t_img} <br/>
${list.t_kind} : ${list.t_name} / ${list.t_Ssize} / ${list.t_Sprice} / ${list.t_Msize} / ${list.t_Mprice} / ${list.t_Lsize} / ${list.t_Lprice} / ${list.t_img}<br/>  
</c:forEach>
<!-- 

<c:forEach var="list" items="${list}" varStatus="loop">
<c:choose>
	<c:when test="${(loop.first)}">
		<c:set var="t_Ssize" value="${list.t_size}"/>
		<c:set var="t_Sprice" value="${list.t_price}"/>
	</c:when>
	<c:when test="${!(loop.last)}">
			<c:set var="t_Msize" value="${list.t_size}"/>
		<c:set var="t_Mprice" value="${list.t_price}"/>
		
	</c:when>
	<c:when test="${loop.count % 3 == 0 }">
		<c:set var="t_kind" value="${list.t_kind}"/>
		<c:set var="t_name" value="${list.t_name}"/>
		<c:set var="t_img" value="${list.t_img}"/>
	</c:when>
	<c:otherwise>
		<c:set var="t_Lsize" value="${list.t_size}"/>
		<c:set var="t_Lprice" value="${list.t_price}"/>

	</c:otherwise>
</c:choose>

                        <li class="tab_main toppingli" style="">
                           <div class="img_topping">
                              <img src="<c:url value='/Pizza/Image/topping/'/>${fn:replace(t_img,' ', '')}" alt="${t_name}"
                                 onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
                              <span class="ico ico_or_chk"></span>
                           </div>
                           <p>
                              <strong>${t_name}</strong>
                              <span> (${t_Ssize}:<fmt:formatNumber value="${t_Sprice}"/>원)</span>
                           </p>
                               
                           <div class="sel_box">
                              <select name="toppingCode" class="select toppingselect" style="">
                                 <option value="">선택</option>
                                 <option value="${t_name}" data-price="${t_Sprice}" data-name="${t_name}" data-weight="${t_Ssize}">
									${t_Ssize}:<fmt:formatNumber value="${t_Sprice}"/>원
								 </option>
                                 <option value="${t_name}" data-price="${t_Mprice}" data-name="${t_name}" data-weight="${t_Msize}">
									${t_Msize}:<fmt:formatNumber value="${t_Mprice}"/>원
								 </option>
                                 <option value="${t_name}" data-price="${t_Lprice}" data-name="${t_name}" data-weight="${t_Lsize}">
									${t_Lsize}:<fmt:formatNumber value="${t_Lprice}"/>원
								 </option>								 								 
                              </select>
                           </div>
                        </li>
</c:forEach>
 -->
</body>
</html>