<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>



	<meta charset="euc-kr">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>도미노피자</title>
	<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
	<meta http-equiv='cache-control' content='no-cache'>
	<meta http-equiv='expires' content='0'>
	<meta http-equiv='pragma' content='no-cache'>
	<link rel="shortcut icon" href="<c:url value='/Pizza/Image/favicon.ico'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css'/>">
	<!-- https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css / /Pizza/css/layout.css -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js'/>"></script><!-- js 수정함. -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js'/>"></script>
	<%-- <script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js'/>"></script> --%> <!-- 오류 부분 -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js'/>"></script>
	
	<!-- 2] CDN(Content Deliver Network)주소 사용 -->
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
	<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
	<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
	
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	
	
</script>

</head>
<body>

<div class="pop_layer pop_type topping" id="topping_info_pop"><!-- 마이 키친 토핑 선택팝업(s) -->
<div class="bg"></div>
<div class="pop_wrap" style="top: 430px;">
	<div class="pop_header">
		<h2>토핑 선택</h2>
	</div>
	<div class="pop_content">
		<p class="txt_topping">- 피자한판당 5개까지 토핑추가 가능</p>
		<a href="javascript:showLayer('toppingAllergic');" class="btn_allergy_info"><span class="ico ico_ex_mark"></span>토핑 알레르기 유발성분</a>
		<div class="tab tab_type2">
			<ul class="btn_tab">
				<li class="active"><a href="#" id="T0100">메인</a></li>
				<li><a href="#" id="T0300">치즈</a></li>
				<li><a href="#" id="T0400">애프터</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="lst_topping_wrap">
						<ul> <!-- class="bg_lst_gray" -->
						<li class="T0100 toppingli" id="RTP183HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP183.jpg" alt="칼라마리 큐브 32g(8ea)" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>칼라마리 큐브 32g(8ea)</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP183HL toppingselect" data-nm="칼라마리 큐브 32g(8ea)" data-code="RTP183HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP184HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP184.jpg" alt="꽃게살 25g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>꽃게살 25g</strong> <span>3,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP184HL toppingselect" data-nm="꽃게살 25g" data-code="RTP184HL" data-price="3500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0300 toppingli" id="RTP164HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP164.jpg" alt="프로볼로네 치즈 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>프로볼로네 치즈 20g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP164HL toppingselect" data-nm="프로볼로네 치즈 20g" data-code="RTP164HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP165HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP165.jpg" alt="직화 스테이크 60g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>직화 스테이크 60g</strong> <span>5,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP165HL toppingselect" data-nm="직화 스테이크 60g" data-code="RTP165HL" data-price="5000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP173HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP173.jpg" alt="단호박빠스 30g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>단호박빠스 30g</strong> <span>1,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP173HL toppingselect" data-nm="단호박빠스 30g" data-code="RTP173HL" data-price="1500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP174HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP174.jpg" alt="와규 크럼블  40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>와규 크럼블  40g</strong> <span>2,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP174HL toppingselect" data-nm="와규 크럼블  40g" data-code="RTP174HL" data-price="2500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP175HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP175.jpg" alt="비스테카 스테이크  50g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>비스테카 스테이크  50g</strong> <span>4,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP175HL toppingselect" data-nm="비스테카 스테이크  50g" data-code="RTP175HL" data-price="4000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0300 toppingli" id="RTP153HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP153.jpg" alt="보코치니 4개/20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>보코치니 4개/20g</strong> <span>2,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP153HL toppingselect" data-nm="보코치니 4개/20g" data-code="RTP153HL" data-price="2000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP178HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP178.jpg" alt="브레이즈드 포크 40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>브레이즈드 포크 40g</strong> <span>2,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP178HL toppingselect" data-nm="브레이즈드 포크 40g" data-code="RTP178HL" data-price="2000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0400 toppingli" id="RTP171HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP171.jpg" alt="만체고 치즈 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>만체고 치즈 20g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP171HL toppingselect" data-nm="만체고 치즈 20g" data-code="RTP171HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP172HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP172.jpg" alt="새송이 버섯  40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>새송이 버섯  40g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP172HL toppingselect" data-nm="새송이 버섯  40g" data-code="RTP172HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP169HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP169.jpg" alt="킹 프론 4개" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>킹 프론 4개</strong> <span>5,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP169HL toppingselect" data-nm="킹 프론 4개" data-code="RTP169HL" data-price="5000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP170HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP170.jpg" alt="칼라마리 40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>칼라마리 40g</strong> <span>1,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP170HL toppingselect" data-nm="칼라마리 40g" data-code="RTP170HL" data-price="1500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0400 toppingli" id="RTP158HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP158.jpg" alt="파르메산 치즈 5g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>파르메산 치즈 5g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP158HL toppingselect" data-nm="파르메산 치즈 5g" data-code="RTP158HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0300 toppingli" id="RTP179HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP179.jpg" alt="생 모차렐라&amp;그뤼에르멜팅치즈 6개" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>생 모차렐라&amp;그뤼에르멜팅치즈 6개</strong> <span>6,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP179HL toppingselect" data-nm="생 모차렐라&amp;그뤼에르멜팅치즈 6개" data-code="RTP179HL" data-price="6000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP135HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP135.jpg" alt="프리미엄불고기 70g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>프리미엄불고기 70g</strong> <span>4,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP135HL toppingselect" data-nm="프리미엄불고기 70g" data-code="RTP135HL" data-price="4000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP136HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP136.jpg" alt="적양파(레드어니언) 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>적양파(레드어니언) 20g</strong> <span>500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP136HL toppingselect" data-nm="적양파(레드어니언) 20g" data-code="RTP136HL" data-price="500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP147HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP147.jpg" alt="선드라이토마토 5개/15g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>선드라이토마토 5개/15g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP147HL toppingselect" data-nm="선드라이토마토 5개/15g" data-code="RTP147HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP051HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP051.jpg" alt="파인애플 8개/40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>파인애플 8개/40g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP051HL toppingselect" data-nm="파인애플 8개/40g" data-code="RTP051HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP059HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP059.jpg" alt="올리브 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>올리브 20g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP059HL toppingselect" data-nm="올리브 20g" data-code="RTP059HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0300 toppingli" id="RTP036HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP036.jpg" alt="도미노치즈 100g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>도미노치즈 100g</strong> <span>2,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP036HL toppingselect" data-nm="도미노치즈 100g" data-code="RTP036HL" data-price="2500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP042HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP042.jpg" alt="베이컨 8개/24g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>베이컨 8개/24g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP042HL toppingselect" data-nm="베이컨 8개/24g" data-code="RTP042HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP054HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP054.jpg" alt="버섯 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>버섯 20g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP054HL toppingselect" data-nm="버섯 20g" data-code="RTP054HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP045HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP045.jpg" alt="페퍼로니  8개/20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>페퍼로니  8개/20g</strong> <span>500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP045HL toppingselect" data-nm="페퍼로니  8개/20g" data-code="RTP045HL" data-price="500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP049HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP049.jpg" alt="감자 8개/80g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>감자 8개/80g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP049HL toppingselect" data-nm="감자 8개/80g" data-code="RTP049HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP044HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP044.jpg" alt="햄 8개/28g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>햄 8개/28g</strong> <span>500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP044HL toppingselect" data-nm="햄 8개/28g" data-code="RTP044HL" data-price="500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP151HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP151.jpg" alt="마요네즈 30g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>마요네즈 30g</strong> <span>500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP151HL toppingselect" data-nm="마요네즈 30g" data-code="RTP151HL" data-price="500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP130HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP130.jpg" alt="케이준 새우살 8개/62g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>케이준 새우살 8개/62g</strong> <span>4,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP130HL toppingselect" data-nm="케이준 새우살 8개/62g" data-code="RTP130HL" data-price="4000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0400 toppingli" id="RTP099HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP099.jpg" alt="호스래디시소스 30g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>호스래디시소스 30g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP099HL toppingselect" data-nm="호스래디시소스 30g" data-code="RTP099HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP048HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP048.jpg" alt="불고기 40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>불고기 40g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP048HL toppingselect" data-nm="불고기 40g" data-code="RTP048HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0300 toppingli" id="RTP037HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP037.jpg" alt="체더치즈 40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>체더치즈 40g</strong> <span>1,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP037HL toppingselect" data-nm="체더치즈 40g" data-code="RTP037HL" data-price="1500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0300 toppingli" id="RTP040HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP040.jpg" alt="카망베르 크림치즈 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>카망베르 크림치즈 20g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP040HL toppingselect" data-nm="카망베르 크림치즈 20g" data-code="RTP040HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP050HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP050.jpg" alt="홍파프리카 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>홍파프리카 20g</strong> <span>1,000 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP050HL toppingselect" data-nm="홍파프리카 20g" data-code="RTP050HL" data-price="1000" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP053HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP053.jpg" alt="피망 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>피망 20g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP053HL toppingselect" data-nm="피망 20g" data-code="RTP053HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP056HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP056.jpg" alt="옥수수 40g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>옥수수 40g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP056HL toppingselect" data-nm="옥수수 40g" data-code="RTP056HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP057HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP057.jpg" alt="양파 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>양파 20g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP057HL toppingselect" data-nm="양파 20g" data-code="RTP057HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP063HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP063.jpg" alt="로스트 포테이토 70g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>로스트 포테이토 70g</strong> <span>1,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP063HL toppingselect" data-nm="로스트 포테이토 70g" data-code="RTP063HL" data-price="1500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0500 toppingli" id="RTP116HL" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP116.jpg" alt="베이컨칩 30g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>베이컨칩 30g</strong> <span>1,500 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP116HL toppingselect" data-nm="베이컨칩 30g" data-code="RTP116HL" data-price="1500" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						<li class="T0100 toppingli" id="RTP047HL" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP047.jpg" alt="포크 20g" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>포크 20g</strong> <span>300 원</span></p>
								<div class="sel_box">
									<select name="toppingQty" class="RTP047HL toppingselect" data-nm="포크 20g" data-code="RTP047HL" data-price="300" title="topping">
									<option value="0">0</option>
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    </select>
								</div>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="btn_wrap topping_tatal">
			<div class="btn_fix_lft">
				<a href="javascript:toppingReset();" class="btn"><span class="btn_txt">초기화</span></a>
			</div>
			<div class="btn_fix_rgt">
				<p><strong>토핑금액 : </strong><span id="toppingTotalAmount">총 0원</span></p>
			</div>
		</div>
		<a href="javascript:setToppingCheck();" class="btn btn_mdle btn_red btn_block"><span class="btn_txt">토핑 추가하기 <span id="toppingTotalCnt"></span></span></a>

	</div>
	<a href="javascript:closeLayer();" class="btn_ico btn_close">닫기</a>
</div>
<!-- //마이 키친 토핑 선택팝업(e) -->

<div class="pop_layer pop_type pop_toppingAllergic" id="allergy_info"></div>
<script>
$(".T0100").show();

$(".tab .btn_tab li a").click(function(e) {
	e.preventDefault();
	$(".toppingli").hide();
	$(".btn_tab li").removeClass("active");
	$(this).parent().addClass("active");
	$("."+$(this).attr("id")).show();
});

if($("#toppingList").val() != "") { // 토핑 초기 셋팅
	var toppingArr = $("#toppingList").val().split(",");
	$.each(toppingArr, function(i, v) {
		var toppingMap = v.split(":");
		$("#"+toppingMap[0]).addClass("active");
		$("."+toppingMap[0]).val(toppingMap[1]);
	});

	setToppingTotalCnt();
}

$(".toppingselect").change(function() {
	if($(this).val() > 0) {
		$("#"+$(this).data("code")).addClass("active");
	} else {
		$("#"+$(this).data("code")).removeClass("active");
	}

	setToppingTotalCnt($(this));
});

var toppingReset = function() {
	$(".toppingselect").each(function() {
		$("#"+$(this).data("code")).removeClass("active");
		$(this).val("0");
	});
	setToppingTotalCnt();
};

var toppingTotalAmount = 0;
var setToppingTotalCnt = function(obj) {
	var toppingTotalCnt = 0;
	toppingTotalAmount = 0
	$(".toppingselect").each(function() {
		if($(this).val() != "0") {
			toppingTotalCnt += parseInt($(this).val());
			toppingTotalAmount += parseInt($(this).val()) * parseInt($(this).data("price"));
		}
	});

	if(toppingTotalCnt > 5) {
		alert("추가 토핑은 한 판당 최대 5개까지 선택 가능합니다.");
		obj.val("0");
		$("#"+obj.data("code")).removeClass("active");
		setToppingTotalCnt();
		return;
	}
	if(toppingTotalCnt == 0) {
		$("#toppingTotalCnt").text("");
		$("#toppingTotalAmount").html("총 0원");
	} else {
		$("#toppingTotalCnt").text("("+toppingTotalCnt+")");
		$("#toppingTotalAmount").text("총 "+toppingTotalAmount.cvtNumber()+"원");
	}

};

var setToppingCheck = function() {
	var toppingList = "";

	$(".toppingselect").each(function() {
		if($(this).val() != "0") {
			if(toppingList != "") {
				toppingList += ",";
			}
			toppingList += $(this).data("code") + ":" + $(this).val();
		}
	});

	$.ajax({
		type: "POST",
		url: "/goods/pauseCheck",
		data: { 'topping': toppingList },
		success:function(data) {
			if(data.resultData.result == "success") {
				setTopping();
			} else {
				alert(data.resultData.result);
				return;
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};

var setTopping = function() {
	var toppingList = "";
	var totalAmt = 0;
	var toppingNmList = "";
	var toppingTotalCnt = 0;
	$(".toppingselect").each(function() {
		if($(this).val() != "0") {
			if(toppingList != "") {
				toppingList += ",";
				toppingNmList += ",";
			}
			toppingTotalCnt += parseInt($(this).val());
			toppingList += $(this).data("code") + ":" + $(this).val();
			toppingNmList += $(this).data("nm") + " (" + $(this).val() + ")";
			totalAmt += parseInt($(this).data("price")) * parseInt($(this).val());
		}
	});

	if(toppingTotalCnt > 5) {
		alert("추가 토핑은 한 판당 최대 5개까지 선택 가능합니다.");
		return;
	}


	$("#toppingList").val(toppingList);
	$("#toppingTotalAmt").val(totalAmt);
	$("#toppingNmList").val(toppingNmList);

	if(toppingList != "") {
		var totalAmtStr = totalAmt.cvtNumber();
		var toppingSumHtml = toppingTotalCnt+"개 선택 : <strong>"+totalAmtStr+"원<span class='pizzaQty'>";

		if($("#qty").val() != "" && $("#qty").val() != "1") toppingSumHtml += " X 피자("+$("#qty").val()+")";
		$(".toppingSum").html(toppingSumHtml+"</span></strong>");
		//$(".balloon_wrap").show();

	} else {
		//$(".balloon_wrap").hide();
		$(".toppingSum").html("내맘대로 토핑을 추가해보세요.");
	}

	closeLayer();
	//총액 반영
	setTotalAmt();
};

var showLayer = function(layerNm) {
	$.ajax({
		type: "GET",
		url: "/contents/"+layerNm,
		success:function(data) {
			$(".pop_"+layerNm).html(data);
			$(".pop_"+layerNm).addClass("open");
			var top = $(window).scrollTop();
			$(".pop_"+layerNm).find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시시도해주세요.");
		}
	});
};
</script>
</div>

<div style="background-color: pink"></div>



</body>

</html>
