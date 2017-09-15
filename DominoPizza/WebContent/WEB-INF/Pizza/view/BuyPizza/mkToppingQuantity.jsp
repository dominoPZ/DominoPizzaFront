<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- 2] CDN(Content Deliver Network)주소 사용 -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<script>
$(function () {
    $(".justOne").each(function () {
        var rows = $(".justOne:contains('" + $(this).text() + "')");
        if (rows.length > 1) {
            rows.eq(0).attr("rowspan", rows.length);
            rows.not(":eq(0)").remove(); 
        } 
    });
});
</script>


<!-- 토핑 정량 확인하기 표 팝업(s)) -->
<div class="pop_layer pop_type pop_mkToppingQuantity" id="mkToppingQuantity">
		<div class="pop_wrap" style="top: 630px;">
				<div class="pop_header">
					<h2>토핑 정량 확인하기</h2>
				</div>
				<div class="pop_content">
					<div class="allergy_guide">
					</div>

					<div class="allergy_table">
						<table class="tbl_type">
							<caption>유발성분 표</caption>
							<colgroup>
								<col width="25%">
								<col width="5%">
								<col width="20%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th>토핑</th>
									<th>사이즈</th>
									<th>그램(g)</th>
									<th>가격(원)</th>
								</tr>
							</thead>
							<tbody>
							                           
								<c:set value="false" var="one" />
								<c:forEach var="toppingList" items="${toppingList}" varStatus="loop">
									<c:if test="${(loop.count) % 2 == 0 }" var="is">
										<c:set value="bg_tr_gray" var="backColor" />
									</c:if>
									<c:if test="${!is}">
										<c:set value=" " var="backColor" />
									</c:if>
									
									<tr class="${backColor}">
									
										<td class="justOne">${toppingList.t_name}</td>
										<td>${toppingList.t_size}</td>
										<td>${toppingList.t_gram}</td>
										<td>${toppingList.t_price}</td>
									</tr>
									
								</c:forEach>																
							</tbody>
						</table>
					</div>
				</div>

				<a href="javascript:closeMkToppingQuantity();" class="btn_ico btn_close">닫기</a>
			</div>
<!-- //토핑 정량 확인하기 표 팝업(e) -->
</div>