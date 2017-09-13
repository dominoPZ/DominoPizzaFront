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

	<script>
var pizzaList1, pizzaList2 = null;
$(document).ready(function() {
	$(".gnb_menu .menu04").addClass("on");
/* 
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "/goods/hnhAjax",
		success:function(data) {
			pizzaList1 = data.resultData;
		 	if(pizzaList1) {
		 		$.each(pizzaList1, function(k, v) {
		 			var isExist = false;
		 			$.each($("#pizza_select1 option"), function() {
		 				if(v.code_01 == $(this).val()) isExist = true;
		 			});
		 			if(!isExist)
		 				$("#pizza_select1").append("<option value='"+v.code_01+"' data-price='"+v.price+"' data-code='"+v.hnh_code+"'>"+v.name+"</option>");
		 		});
		 	}
		},
		error: function (xhr,status,error){
			if(xhr.status != "0") {
				alert("다시 시도해주세요."+xhr.status);
			}
		}
	});
 */
 

	//첫번째 피자 체인지 이벤트 발생시
	$("#pizza_select1").change(function() {
		$("#pizza_select2 option:gt(0)").remove();
		$(".half_right").removeClass("on");
			$.ajax({
				url: "<c:url value='/Pizza/BuyPizza/hnhSecondPizza.pz'/>",
				data: {choiceFstPizza : $(this).val()},
				type:"post",
				dataType:"json",
				success:function(data) {
					console.log("data : "+data);
 					$.each(data, function(i, item){
 						$("#pizza_select2").append("<option value='"+item["p_name"]+"'>"+item["p_name"]+"</option>");
					}); 
				},
				error:function(request,error){
						console.log("code:"+request.status) //200일경우 응답은 정상이라는 의미
						console.log("서버로부터 받은 데이타"+request.responseText);
						console.log("error:"+error);
					   }	
			});
					
			
			function successArrayCallback(data){
				console.log("서버로부터 받은 데이터 : "+data);
				/*JSON배열을 출력할때는 $.each(data,function(index,list){}); 
				사용]
				data:서버로부터 전송받은 데이타(JSON배열타입)
				index:JSON배열의 인덱스(0부터 시작)	
				list:JSON배열에서 하나씩 꺼내온거를 담은 인자
				each함수:JSON배열인 data에서 하나씩 꺼내서 list에 저장하는 기능
				예] [{키값1:값1,키값2:값2,...},{},{},{},.......]
				읽어올때] list.키값 혹은 list["키값"]*/
				var tableString ="<table style='border-spacing:1px;background-color:green'>";
				tableString+="<tr style='background-color:white'>";
				tableString+="<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>";
				tableString+="</tr>";
				$.each(data,function(index,record){//배열이기 때문에 인덱스와 그걸 꺼내서 담을 두번쨰 인자
					tableString+="<tr style='background-color:white'>";
					tableString+="<td>"+(index+1)+"</td><td>"+record.title+"</td><td>"+record.name+"</td><td>"+record["postdate"]+"</td>";
					tableString+="</tr>";			
				});
				
				tableString+="</table>";
				$("#list").html(tableString);
			}/////////////////////////successArrayCallback
			
			
/* 			
 		$.ajax({
			type: "POST",
			url: "<c:url value='/Pizza/BuyPizza/hnhSecondPizza.pz'/>",
			data: {choiceFstPizza : $(this).val()},
			success:function(data) {
				pizzaList2 = data.resultData;
			 	if(pizzaList2) {
			 		$.each(pizzaList2, function(k, v) {
			 			var isExist = false;
			 			$.each($("#pizza_select2 option"), function() {
			 				if(v.choiceFstPizza == $(this).val()) isExist = true;
			 			});
			 			if(!isExist) 
			 				$("#pizza_select2").append("<option value='"+v.choiceFstPizza+"'>"+v.name+"</option>");
			 		});
			 	}
			},
			error: function (error){
			 	alert("다시 시도해주세요.");
			 }
		});
 */
	//	setTotalAmt();
	}); 

 
	$("#pizza_select2").change(function() {
		$("#dough option:gt(0)").remove();
		$("#size option:gt(0)").remove();

		if($(this).val() != "") {
			$(".half_right").addClass("on");
			$(".half_right span").html('<img src="https://cdn.dominos.co.kr/admin/upload/hnh/'+$(this).val()+'.png" alt="선택한 두 번째 피자" />');
		} else {
			$(".half_right").removeClass("on");
			$(".half_right span").html("피자를 선택하세요.");
		}

		setDough();

	});



});

</script>
					<div class="halfandhalf_content">

						<div class="prd_selbox">
							<div class="option_title">피자를 선택하세요. </div>

							<div class="form_group">
								<div class="form_field">
										<div class="sel_box">
											<select id="pizza_select1">
												<option value="">첫 번째 피자 선택</option>
													<option value="직화 스테이크">직화 스테이크</option>
												
													<option value="킹프론 씨푸드">킹프론 씨푸드</option>
												
													<option value="와규 앤 비스테카">와규 앤 비스테카</option>
												
													<option value="브레이즈드 포크">브레이즈드 포크</option>
												
													<option value="꽃게 온더 피자">꽃게 온더 피자</option>
												
													<option value="치즈">치즈</option>
												
													<option value="페퍼로니">페퍼로니</option>
												
													<option value="불고기">불고기</option>
												
													<option value="베이컨체더치즈">베이컨체더치즈</option>
												
													<option value="슈퍼슈프림">슈퍼슈프림</option>
												
													<option value="슈퍼디럭스">슈퍼디럭스</option>
												
													<option value="포테이토">포테이토</option>
												
													<option value="리얼바비큐">리얼바비큐</option>
											
											</select>
										</div>
								</div>
								<div class="form_field">
									<div class="sel_box">
										<select id="pizza_select2">
													<option value="">두 번째 피자 선택</option>

										</select>
									</div>
								</div>
							</div>
							<!-- //form_group -->


						</div>
						<!-- //prd_selbox -->

</body>

</html>
