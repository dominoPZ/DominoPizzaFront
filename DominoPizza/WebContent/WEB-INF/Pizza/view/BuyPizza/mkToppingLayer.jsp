<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 2] CDN(Content Deliver Network)주소 사용 -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Deprecated된 함수 사용시 아래 라이브러리 임베드 -->
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js"></script>
<style>
.btn_allergy_info{
	position: absolute;
    top: 25px;
    right: 40px;
    padding-left: 10px;
    padding-right: 10px;
    border: 2px solid #ef6618;
    font-size: 14px;
    color: #f06418;
    line-height: 34px;}
.ico_ex_mark{width:19px;height:19px;background-position:-320px -610px;}
.ico {
    display: inline-block;
    vertical-align: middle;
}
</style>
<!-- 마이 키친 토핑 추가 레이어 -->
<div class="pop_layer pop_type topping open" id="topping_info_pop2"><!-- 마이 키친 토핑 선택팝업(s) -->
<div class="bg"></div>
<div class="pop_wrap" style="top: 630px;">
	<div class="pop_header">
		<h2>마이 키친 토핑 선택 하기</h2>
	</div>
	<div class="pop_content">
		
		<p class="txt_topping" style="margin-top:30px">- 토핑은 최대 7개 선택 가능</p><p class="txt_topping">- 기본으로 모차렐라 치즈가 추가됩니다. (슈퍼스프림 피자 정량 기준)</p>
		<a href="javascript:showLayer('toppingAllergic');" class="btn_allergy_info" style="right:210px"><span class="ico ico_ex_mark"></span>토핑 알레르기 유발성분</a>
		<!-- 토핑 정량 확인하기 a태그의 클래스 topping_check 변경 -->
		<a href="javascript:showLayer('mkToppingQuantity');" class="btn_allergy_info"><span class="ico ico_ex_mark"></span>토핑 정량 확인하기</a>
		<!-- 위 a태그 2개는 topppingLayer에서 이동함. 자스 showLayer()의 인자로 -->
		
<div class="tab tab_type2">
			<ul class="btn_tab">
				<li class="active"><a href="javascript:;" id="tab_main">메인</a></li>
				<li><a href="javascript:;" id="tab_cheese">치즈</a></li>
				<li><a href="javascript:;" id="tab_after">애프터</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="lst_topping_wrap">
						<ul> <!-- class="bg_lst_gray" -->
<!-- 토핑리스트 시작 ========================================================================================================== -->   
<!-- 토핑 하나의 li태그 시작 -->
								<c:forEach var="list" items="${list}" varStatus="loop">
									<c:choose>
										<c:when test="${list.t_kind == '메인'}">
											<c:set value="tab_main" var="tabMenu" />
										</c:when>
										<c:when test="${list.t_kind == '치즈'}">
											<c:set value="tab_cheese" var="tabMenu" />
										</c:when>
										<c:otherwise>
											<c:set value="tab_after" var="tabMenu" />
										</c:otherwise>
									</c:choose>
									<li class="${tabMenu} toppingli" style="">
										<div class="img_topping">
											<img
												src="<c:url value='/Pizza/Image/topping/'/>${fn:replace(list.t_img,' ', '')}"
												alt="${list.t_name}"
												onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
											<span class="ico ico_or_chk"></span>
										</div>
										<p>
											<strong>${list.t_name}</strong> <span>
												(${list.t_Ssize}:<fmt:formatNumber value="${list.t_Sprice}" />원)
											</span>
										</p>

										<div class="sel_box">
											<select name="toppingCode" class="select toppingselect"
												style="">
												<option value="">선택</option>
												<option value="${list.t_name}" data-price="${list.t_Sprice}"
													data-name="${list.t_name}" data-weight="${list.t_Ssize}">
									${list.t_Ssize}:<fmt:formatNumber value="${list.t_Sprice}"/>원
								 </option>
												<option value="${list.t_name}" data-price="${list.t_Mprice}"
													data-name="${list.t_name}" data-weight="${list.t_Msize}">
									${list.t_Msize}:<fmt:formatNumber value="${list.t_Mprice}"/>원
								 </option>
												<option value="${list.t_name}" data-price="${list.t_Lprice}"
													data-name="${list.t_name}" data-weight="${list.t_Lsize}">
									${list.t_Lsize}:<fmt:formatNumber value="${list.t_Lprice}"/>원
								 </option>
											</select>
										</div>
									</li>
								</c:forEach>
								<!-- 토핑 하나의 li태그 끝 -->
								
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
				<p><strong>토핑금액 : </strong><span id="toppingTotalAmount">총 0 원</span></p>
			</div>
		</div>
			<a href="javascript:setToppingCheck();" class="btn btn_mdle btn_red btn_block">
			<span class="btn_txt">
				토핑 추가하기<span id="toppingTotalCnt"></span>
			</span>
			</a>

		</div>
	<a href="javascript:closeLayer();" class="btn_ico btn_close">닫기</a>
</div>
<!-- //마이 키친 토핑 선택팝업(e) -->

<!-- 토핑 알레르기 유발성분 표 팝업(s) -->
	<div class="pop_layer pop_type pop_toppingAllergic" id="allergy_info">
		<script>
			function closeAllergic(){
				$(".pop_toppingAllergic").removeClass("open");
			}
		</script>
	</div>
<!-- //토핑 알레르기 유발성분 표 팝업(e) -->

<!-- 토핑 정량 확인하기 표 팝업(s)) -->
	<div class="pop_layer pop_type pop_mkToppingQuantity" id="mkToppingQuantity">
		<script>
			function closeMkToppingQuantity(){
				$(".pop_mkToppingQuantity").removeClass("open");
			}
		</script>
	</div>
<!-- //토핑 정량 확인하기 표 팝업(e) -->
				

</div>



<script>
//$(".tab_main").show(); //처음에 메인 토핑리스트부터 보이게 설정.
$(".tab_cheese").hide();
$(".tab_after").hide();


$(".tab .btn_tab li a").click(function(e) {
	e.preventDefault();
	$(".toppingli").hide();
	$(".btn_tab li").removeClass("active");
	$(this).parent().addClass("active");
	$("."+$(this).attr("id")).show();
	return;
});

if($("#toppingList").val() != "") { // 토핑 초기 셋팅
	var toppingArr = $("#toppingList").val().split(",");
	//alert("4. toppingArr:"+toppingArr);
	//옵션의 value값이 넘어옴.
	$.each($(".toppingselect"), function() {
		$.each($(this).find("option"), function() {
			var code = $(this).attr("value");
			var obj = $(this);
			$.each(toppingArr, function(i, v) {
				if(code == v) {
					obj.attr("selected", "selected");
					obj.parent().parent().parent().addClass("active");
				}
			});
		});
	});


	setToppingTotalCnt();
}

$(".toppingselect").change(function() {
	if($(this).val() != "") {
		$(this).parent().parent().addClass("active");
	} else {
		$(this).parent().parent().removeClass("active");
	}
	setToppingTotalCnt($(this));
});

var toppingReset = function() {
	$(".toppingselect").val("");
	$(".toppingli").removeClass("active");
	setToppingTotalCnt();
};

var toppingTotalAmount = 0;
var setToppingTotalCnt = function(obj) {
	var toppingTotalCnt = 0;
	toppingTotalAmount = 0;
	$(".toppingselect").each(function() {
		if($(this).val() != "") {
			toppingTotalCnt++;
			toppingTotalAmount += parseInt($(this).find("option:selected").data("price"));
		}
	});

	var reset = false;
	if(toppingTotalCnt > 7) {
		alert("추가 토핑은 최대 7개까지 선택 가능합니다.");
		reset = true;
	}
	
	if(reset) {
		obj.val("");
		obj.parent().parent().find(".ico_or_chk").hide();
		setToppingTotalCnt();
		return;
	}

	if(toppingTotalCnt == 0) {
		$("#toppingTotalCnt").text("");
		$("#toppingTotalAmount").html("총 0 원");
		$("#toppingDisplayList").hide();
	} else {
		$("#toppingTotalCnt").text("("+toppingTotalCnt+")");
		$("#toppingTotalAmount").text("총 "+toppingTotalAmount.cvtNumber()+" 원");
		$("#toppingDisplayList").show();
	}

};

var setToppingCheck = function() {
	var toppingList = "";

	$(".toppingselect").each(function() {
		if($(this).val() != "") {
			if(toppingList != "") {
				toppingList += ",";
			}
			toppingList += $(this).val();
		}
	});

		
		setTopping();
	
	/* 	$.ajax({
			type: "POST",
			//url: "<c:url value='/Pizza/BuyPizza/choice.pz'/>",
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
		}); */
	};



var setTopping = function() {
	var toppingList = "";
	var totalAmt = 0;
	var toppingNmList = "";
	var toppingTotalCnt = 0;
	var html = "";
	$(".toppingselect").each(function() {
		if($(this).val() != "") {
			if(toppingList != "") {
				toppingList += ",";
			}
			toppingTotalCnt++;
			toppingList += $(this).val();
			totalAmt += parseInt($(this).find("option:selected").data("price"));
			 
			html += '<li id="'+$(this).val()+'">'
				+	'	<p class="topping_name">'+$(this).find("option:selected").data("name")+' ' + $(this).find("option:selected").data("weight") +'</p>'
				+	'	<span class="bill_price">'+(parseInt($(this).find("option:selected").data("price"))).cvtNumber()+'</span>'
				+	'	<a href="javascript:;" onclick="$(this).parent().remove();setToppingPrice();" class="btn_ico btn_delete">삭제하기</a>'
				+	'</li>';

		}
	});


	
		if(toppingTotalCnt > 7) {
			alert("추가 토핑은 최대 7개까지 선택 가능합니다.");
			return;
		}

	$("#toppingList").val(toppingList);
	$("#toppingTotalAmt").text(totalAmt.cvtNumber() + " 원");
	$("#toppingDisplayList").html(html);
	if(toppingList != "") {
		var totalAmtStr = totalAmt.cvtNumber();
		var toppingSumHtml = toppingTotalCnt+"개 선택</strong>";
		$("#toppingSum").html(toppingSumHtml);
		$(".balloon_wrap").show();

	} else {
		$(".balloon_wrap").hide();
		$("#toppingSum").html("");
	}

	closeLayer();
	//총액 반영
	setTotalAmt();
};


var showLayer = function(layerNm) {
	$.ajax({
		type: "GET",
		url: "<c:url value='/Pizza/BuyPizza/'/>"+layerNm+".pz", 
		success:function(data) {
			$(".pop_"+layerNm).html(data);
			$(".pop_"+layerNm).addClass("open");
			var top = $(window).scrollTop();
			$(".pop_"+layerNm).find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시시도해주세요.mktoppinglayer안");
		}
	});
};
</script>
</div>