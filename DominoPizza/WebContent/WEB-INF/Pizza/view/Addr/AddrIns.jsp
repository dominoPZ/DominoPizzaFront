<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/resources/css/font.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
<script type="text/javascript" src="/resources/js/jquery1.11.1.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="/resources/js/selectbox.js"></script><!-- js 수정함. -->
	<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
	<script type="text/javascript" src="/resources/js/Cookie.js"></script>
	<script type="text/javascript" src="/resources/js/basket_w.js"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	$(document).ready(function() {
		$.ajaxSetup({cache:false});

		setBasketCnt();

		// 마이쿠폰 정보 조회(가입회원)
		
			$.ajax({
				type: "POST",
				url: "/mypage/mainMyCouponInfoAjax",
				dataType : "json",
				success:function(data) {
				 	if (data.resultData.status == "success") {
				 		$('#myMonth').text(data.resultData.myMonth+'월');
				 		$('#myLevel').text(data.resultData.myLevel);
				 		if(data.resultData.myCouponCnt > 0) {
				 			$(".none_coupon").hide();
					 		$(".exist_coupon").show();
					 		$('#myCouponCnt').html(data.resultData.myCouponCnt+"<span>개</span>");
					 		$('#gnbCoupon').text("("+data.resultData.myCouponCnt+")");
				 		}
					} else {
// 						console.log("마이쿠폰 정보 가져오기 실패");
					}
				}
			});
			

		// 주문&주문트레커 조회(가입회원/인증회원)
		
				$.ajax({
					type: "POST",
					url: "/mypage/leftMyOrderInfoAjax",
					dataType : "json",
					success:function(data) {
					 	if (data.resultData.status == "success") {
					 		// 현재 주문 진행중인건이 있으면
					 		if(data.resultData.ingOrderCnt > 0){
					 			var stateCode = data.resultData.state_code;
					 			$('#ingOrderInfo').show();
						 		$('#gnbOrderCnt').text("("+data.resultData.ingOrderCnt+")");
						 		$('#tracker_order_no').val(data.resultData.order_no);

						 		if(stateCode == '1' || stateCode == '2'){
						 			$(".tracker_step").parent().addClass("active");  // 접수완료
						 		}else if(stateCode == '3'){
						 			$(".tracker_step2").parent().addClass("active"); // 요리중
						 		}else if(stateCode == '4'){
						 			$(".tracker_step3").parent().addClass("active"); // 배달중
						 		}else if(stateCode == '5'){
						 			$(".tracker_step4").parent().addClass("active"); // 배달완료
						 		}else{
// 						 			console.log("Left 주문내역 가져오기 실패");
						 		}
					 		}
						} else {
// 							console.log("Left 주문내역 가져오기 실패");
						}
					}
				});
			
	});

	function setBasketCnt() {
		var basketCnt = cookieManager.getCookie("BASKETCNT");
		var basket = cookieManager.getCookie("BASKET");
		var finish_basket = cookieManager.getCookie("FINISH_BASKET");

		if(basketCnt == "") basketCnt = "0";
		else if(basket != "" && basket == finish_basket) basketCnt = "0";
		if(basketCnt != "0")
			$(".cart_count").text(basketCnt);
	}

	var goCart = function() {
		location.href="/basket/detail";
	};

	var doLogin = function() {
		location.href="/global/login";
	};

	var myOrderDetail = function() {
		var order_no = $('#tracker_order_no').val();
		location.href="/mypage/myOrderView?order_no="+order_no+"&pageNo=1"
	};

</script>
<!-- Naver Anlytics 공통-->
<script>
var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
</script>
<!-- // Naver Anlytics 공통-->

<!-- 카이젠 공통-->
<script data-kz-key="7944084e2b522564"
data-kz-namespace="kzs"
src="//cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8">
</script> 
<!-- 카이젠 공통-->

</head>
<body>
	<!-- top_event_bnr -->
	<div class="top_bnr top_event" id="lineBanner">
		<div class="top_event_wrap">
			<a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
		</div>
	</div>
	<!-- //top_event_bnr -->

	<!-- wrap  -->
	<div id="wrap">
		<!-- header -->
		<div id="header">
			<div class="header_top">
				<div class="logo_area">
					<div class="util_left">
						<a href="javascript:;" class="btn_ico btn_menu">GNB</a>
						<ul class="util_menu">
							<li><a href="/main?locale=en">English</a></li>
							<li style=""><a href="/mypage/myCoupon">쿠폰 <span id="gnbCoupon"></span></a></li>
							<li><a href="/mypage/myOrderList">주문조회 <span id="gnbOrderCnt"></span></a></li>
						</ul>
					</div>
					<h1 class="logo"><a href="/main"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/logo.png" alt="Domino"></a></h1>
					<div class="util_right">
						<ul class="util_menu">
						<li><a href="/global/logout">로그아웃</a></li>
							<li><a href="/mypage/myLevel">나의정보</a></li>
							</ul>
						<a href="javascript:goCart();" class="btn_ico btn_cart"><span class="cart_count"></span>장바구니</a>
					</div>
				</div>
			</div>
			<div class="menu_area">
				<ul class="gnb_menu">
					<li>
						<a href="/goods/list?dsp_ctgr=C0101" class="menu01">피자</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0101">곡물도우</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0102">프리미엄</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0104">클래식</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/goods/list?dsp_ctgr=C0201" class="menu02">사이드디시</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0201">사이드디시</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0202">음료</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0203">피클&소스</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/event/list?gubun=E0100" class="menu03">특가제품</a>
						<!--div class="depth2">
							<ul class="list_depth2">
								<li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li>
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
							</ul>
						</div-->
					</li>
					<li>
						<a href="/goods/hnh" class="menu04">내맘대로 피자</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/goods/hnh">하프&하프</a></li>
								<li><a href="/goods/mykitchen">마이 키친</a></li>
								<li><a href="/goods/topping">추가 토핑 안내</a></li>
							</ul>
						</div>
					</li>


					<li>
						<a href="/event/list?gubun=E0200" class="menu05">이벤트&할인</a>
						<div class="depth2">
							<ul class="list_depth2">
								<!-- li><a href="/event/list?gubun=E0100">오늘의 핫딜</a></li-->
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
<!-- 								<li><a href="/event/pizzaSchoolView">피자교실</a></li> -->
							</ul>
						</div>
					</li>
					<li>
						<a href="/ecoupon/index" class="menu06">E-쿠폰&상품권</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/ecoupon/index">E-쿠폰</a></li>
								<li><a href="/ecoupon/giftCard">상품권</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="/contents/present" class="menu07">선물하기</a>
						<div class="depth2">
							<ul class="list_depth2">
								<li><a href="/contents/present">전체</a></li>
								<li><a href="/voucher/list?gubun=J">지류상품권</a></li>
								<li><a href="/voucher/list?gubun=M">모바일상품권</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<div class="whole_menu_area">
				<div class="whole_menu_wrap">
					<ul class="whole_menu">
						<li>
							<a href="/goods/list?dsp_ctgr=C0101">피자</a>
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0101">곡물도우</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0102">프리미엄</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0104">클래식</a></li>
							</ul>
						</li>
						<li>
							<a href="/goods/list?dsp_ctgr=C0201">사이드디시</a>
							<ul class="list_depth2">
								<li><a href="/goods/list?dsp_ctgr=C0201">사이드디시</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0202">음료</a></li>
								<li><a href="/goods/list?dsp_ctgr=C0203">피클&소스</a></li>
							</ul>
						</li>
						<li>
							<a href="/event/list?gubun=E0100">특가제품</a>
							<ul class="list_depth2">
								<li><a href="/event/list?gubun=E0100">특가제품</a></li>
							</ul>
						</li>
						<li>
							<a href="/goods/hnh">내맘대로 피자</a>
							<ul class="list_depth2">
								<li><a href="/goods/hnh">하프&하프</a></li>
								<li><a href="/goods/mykitchen">마이 키친</a></li>
								<li><a href="/goods/topping">추가 토핑 안내</a></li>
							</ul>
						</li>
						<li>
							<a href="/event/list?gubun=E0200">이벤트&할인</a>
							<ul class="list_depth2">
								<!-- li><a href="#">오늘의 핫딜</a></li-->
								<li><a href="/event/list?gubun=E0200">오늘의 이벤트</a></li>
								<li><a href="/event/mania">매니아 혜택</a></li>
								<li><a href="/event/discount">할인&제휴</a></li>
							</ul>
						</li>
						<li>
							<a href="/ecoupon/index">E-쿠폰&상품권</a>
							<ul class="list_depth2">
								<li><a href="/ecoupon/index">E-쿠폰</a></li>
								<li><a href="/ecoupon/giftCard">상품권</a></li>
							</ul>
						</li>
						<li>
							<a href="/contents/present">선물하기</a>
							<ul class="list_depth2">
								<li><a href="/contents/present">전체</a></li>
								<li><a href="/voucher/list?gubun=J">지류상품권</a></li>
								<li><a href="/voucher/list?gubun=M">모바일상품권</a></li>
							</ul>


						</li>
						<li>
							<a href="/branch">매장찾기</a>
							<ul class="list_depth2">
								<li><a href="/branch">매장찾기</a></li>
							</ul>
						</li>
						<li>
							<a href="/quickOrder/index">퀵 오더</a>
							<ul class="list_depth2">
								<li><a href="/quickOrder/index">퀵 오더 설정</a></li>
							</ul>
						</li>

						<li>
							<a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a>
							<ul class="list_depth2">
								<li>
									<a href="/bbs/faqList?view_gubun=W&bbs_cd=online">FAQ</a>
									<ul class="list_depth3">
										<li><a href="/bbs/faqList?bbs_cd=online9">단체주문</a></li>
									</ul>
								</li>
								<li><a href="/bbs/qnaForm">온라인 신문고</a></li>
							</ul>
						</li>
						<li>
							<a href="/bbs/newsList?type=N">공지사항</a>
							<ul class="list_depth2">
								<li><a href="/bbs/newsList?type=N">도미노 뉴스</a></li>
								<li><a href="/bbs/newsList?type=P">Press</a></li>
							</ul>
						</li>
						<li>
							<a href="/company/contents/overview">회사소개</a>
							<ul class="list_depth2">
								<li><a href="/company/contents/overview">한국도미노피자</a></li>
								<li><a href="/company/tvcfList">광고갤러리</a></li>
								<li><a href="/company/contents/society">사회공헌활동</a></li>
								<li><a href="/company/contents/chainstore1">가맹점 모집</a></li>
								<li><a href="/company/jobList?type=R">인재채용</a></li>
							</ul>
						</li>
						<li>
							<a href="#">DomiChat</a>
							<ul class="list_depth2">
								<li><a href="/event/view?seq=84&gubun=E0200">DomiChat이란?</a></li>
							</ul>
						</li>						
					</ul>
					<a href="/event/view?seq=84&gubun=E0200" class="btn_ico btn_close2">닫기</a>
				</div>
			</div>
		</div>
		<!-- //header -->

<script type="text/javascript">
var ajaxRequest = null;

$(document).ready(function() {
	$.ajaxSetup({cache:false});
});

var basketActionProc = function(param) {
	if(ajaxRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}

	if(param.action_code == "selectAD" && param.branch_code == "86578") {
		alert("도미노피자 잠실야구장점은 매장 특성상 모든 할인 및 상품권, 무료시식권이 적용되지 않으며 후 결제만 가능 합니다.");
	}
	/* if(param.action_code == "selectAD" && param.branch_code == "86504" && $("#order_gubun").val() == "O") {
		//alert("부산 하단점 더블 크러스트 치즈멜팅, 리얼바베큐, 슈퍼디럭스, 슈퍼슈프림, 포테이토, 불고기 피자 배달 30% 할인 진행하고 있습니다.");
	} */

	$.ajax({
		type: "POST",
		url : '/basket/basketAction',
		data : param,
		success:function(data) {
			//alert(data.status);
			if(data.status != "success") {
				alert(data.msg);
				return;
			}

			if(param.action_code == "selectOG") {
				location.reload();
			} else {
				//alert(data.code);
				if(data.code == "01") { // 임시로 담은 제품이 있는 경우
					if(data.msg != "success") {
						alert(data.msg);
						location.href = "/goods/detail?dsp_ctgr=C0102&code_01=RPZ135SL";
					} else {
						window.setTimeout( function() { location.href = "/goods/list?dsp_ctgr=C0101";}, 900);

						$('.pop_toast').fadeIn(200, function() {
							window.setTimeout(function(){$('.pop_toast').fadeOut(200);}, 500);
						});
					}
				} else {
					location.href = "/goods/detail?dsp_ctgr=C0102&code_01=RPZ135SL";
				}
			}
		},
		error: function (error){
			alert("처리도중 오류가 발생하였습니다. 다시 시도해주세요.");
		},
		beforeSend: function() {
			ajaxRequest = "Y";
			$("#defaultLoading").show();
	    },
	    complete: function() {
	    	ajaxRequest = null;
	    	$("#defaultLoading").hide();
	    }
	});
}

// 주문방법 변경
var selectOG = function() {
	var pre_order_gubun = $("#order_gubun").val();
	var order_gubun = $("input[name='order_gubun_radio']:checked").val();
	var gift_yn = (order_gubun == "G") ? "Y" : "N";

	if(order_gubun == "G") {
		gift_yn = "Y";
		order_gubun = "O";
	} else {
		gift_yn = "N";
	}

	var param = {
		action_code : 'selectOG',
		order_gubun : order_gubun,
		gift_yn : gift_yn
	};

	basketActionProc(param);
};

// 주문방법 + 배송지 및 매장 선택
var setAddress = function(branch_code, branch_gb, sn, waiting_yn, alertMsg) {

	//86326 : 이촌점, 86357 : 수지점, 86585 : 대덕점 , 신봉점 : 86693
	/*
	if(branch_code=="86326" || branch_code=="86357" || branch_code=="86585" || branch_code=="86693"){
		alert("6/21부터 6/30까지 전화(1577-3082) 주문으로 신제품 주문 시 치즈 볼로네즈 스파게티 무료 증정 진행 중 (여타 할인과 중복 불가)");
	}
	*/
	var order_gubun = $("#order_gubun").val();

	if(order_gubun == "W" && $("#w_addr_sn").val() == sn) {
		if(confirm("현재 선택된 매장입니다. 장바구니로 이동하시겠습니까?")) {
			location.href = "/basket/detail";
		}
		return;
	} else if(order_gubun == "O" && $("#o_addr_sn").val() == sn) {
		if(confirm("현재 선택된 배달지입니다. 장바구니로 이동하시겠습니까?")) {
			location.href = "/basket/detail";
		}
		return;
	}

	if(waiting_yn == "Y"){
		if(!confirm("해당 매장은 현재 <예약 주문>을 이용하실 수 있습니다.\n주문 진행하시겠습니까?")) return;
	}

	if(alertMsg != null && alertMsg != '') {
		if(!confirm(alertMsg)) return;
	}

	var param = {
		action_code : 'selectAD',
		order_gubun : order_gubun,
		gift_yn : $("#gift_yn").val(),
		branch_code : branch_code,
		branch_gb : branch_gb,
		addr_sn : sn
	};

	basketActionProc(param);
};

// 배송지 및 매장 삭제
var deleteAddress = function(sn) {
	if(ajaxRequest != null) {
		alert("처리중인 작업이 있습니다. 잠시후에 다시 시도해 주세요.");
		return;
	}

	var order_gubun = $("#order_gubun").val();

	if(order_gubun == "W" && $("#w_addr_sn").val() == sn) {
		alert("현재 선택된 매장입니다."); return;
	} else if(order_gubun == "O" && $("#o_addr_sn").val() == sn) {
		alert("현재 선택된 배달지입니다."); return;
	}

	if(!confirm("삭제 하시겠습니까?")) return;

	var param = {
		sn : sn,
		order_gubun : order_gubun
	};

	$.ajax({
		type: "POST",
		url : '/delivery/deleteAjax',
		data : param,
		success:function(data) {
			if(data.msg == "existQuick") {
				if(order_gubun == "W") {
					alert("퀵 오더에 등록된 매장입니다.");
				} else if(order_gubun == "O") {
					alert("퀵 오더에 등록된 배달지입니다.");
				}
				return;
			} else if(data.msg == "success") {
				location.reload();
		 	}
		},
		error: function (error){
			alert("처리도중 오류가 발생하였습니다. 다시 시도해주세요.");
		},
		beforeSend: function() {
			ajaxRequest = "Y";
			$("#defaultLoading").show();
	    },
	    complete: function() {
	    	ajaxRequest = null;
	    	$("#defaultLoading").hide();
	    }
	});
};

// 레이어 닫기 (신규 배송지, 매장 등록)
var closeLayer = function() {
	$('html, body').css('overflow-y', '');
	$(".pop_frame").hide();
};

// 배달주소 등록
var addDelivery = function() {
	

	if ("4" == "5") {
		alert("매장은 최대 5개까지 등록 가능합니다. 추가로 등록하시려면 리스트에서 불필요한 매장을 삭제해주세요.");
		return;
	}

	$("#adr_add iframe").remove();
	$("#adr_add .pop_header").after("<iframe src='/delivery/search' id='delFrame' frameborder='0' width='580' height='822' title='주소 검색'></iframe>");
	$("#adr_add").addClass("open");
	var top = $(window).scrollTop();
	$("#adr_add").find('.pop_wrap').css('top',top+30+'px');
};

// 배달주소 등록 완료
var addDeliveryComplete = function(param) {
	location.reload();
};

// 포장매장 등록
var addBranch = function() {
	

	if ("0" == "5") {
		alert("매장은 최대 5개까지 등록 가능합니다. 추가로 등록하시려면 리스트에서 불필요한 매장을 삭제해주세요.");
		return;
	}

	$("#store_add iframe").remove();
	$("#store_add .pop_header").after("<iframe src='/branch/listIframe' frameborder='0' width='1000' height='1103' id='delivery_iframe' title='포장 매장 등록'></iframe>");
	$("#store_add").addClass("open");
	var top = $(window).scrollTop();
	$("#store_add").find('.pop_wrap').css('top',top+30+'px');
};

// 포장매장 등록 완료
var addBranchComplete = function(param) {
	location.reload();
};

</script>

<!-- container -->
<div id="container">
<form id="orderFrm" name="orderFrm" action="" method="post">
	<div id="hidden_info">
		<input type="hidden" name="order_gubun" id="order_gubun" value="O">
		<input type="hidden" name="gift_yn" id="gift_yn" value="N">
		<input type="hidden" name="branch_code" id="branch_code" value="">
		<input type="hidden" name="o_addr_sn" id="o_addr_sn" value="0">
		<input type="hidden" name="w_addr_sn" id="w_addr_sn" value="">
	</div>
	<!-- content -->
	<div id="content" class="cart_payment">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="#">HOME</a></li>
				<li><span>주문매장 선택</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>주문매장 선택</h2>
			</div>
		</div>
		<!-- //sub_title -->

		<div class="order_store">
			<div class="order_section order_way">
				<!-- 주문방법 -->
				<div class="tit_order">
					<strong>주문방법<em>(주문방법/배달주소 선택 후 장바구니 담기가 가능합니다.)</em></strong>
				</div>
				<div class="order_way_sel">
					<div class="form_group">
						<div class="form_field">
							<span class="custom_form">
								<input type="radio" id="way_rdo" name="order_gubun_radio" value="O" checked onchange="selectOG();">
								<label for="way_rdo" class="ip_rdo2 checked">
									<em></em><span>배달주문</span>
								</label>
							</span>
						</div>
						<div class="form_field">
							<span class="custom_form">
								<input type="radio" id="way_rdo2" name="order_gubun_radio" value="W"   onchange="selectOG();">
								<label for="way_rdo2" class="ip_rdo2 ">
									<em></em><span>방문포장</span>
								</label>
							</span>
						</div>
						<div class="form_field">
							<span class="custom_form">
								<input type="radio" id="way_rdo3" name="order_gubun_radio" value="G"   onchange="selectOG();">
								<label for="way_rdo3" class="ip_rdo2 checked">
									<em></em><span>선물하기</span>
								</label>
							</span>
						</div>
					</div>
				</div>
				<!-- // 주문방법 -->
				<!-- 배달주소 -->
				<div class="order_adr_wrap" id="addr_O" style="">
					<div class="order_adr_chk">
						<strong>배달주소</strong>
						<a href="javascript:addDelivery();" class="btn"><span class="btn_txt">배달주소 등록</span></a>
					</div>
					<div class="order_lately" style="">
						<table>
								<colgroup>
									<col>
									<col width="170px">
								</colgroup>
								<tbody>
									<tr id="O_16926224">
											<td>
												<div class="order_adr">
													<p class="addr_info">서울특별시 강남구 강남대로112길 11 101</p>
													<strong class="order_store_info">논현점<span>(02-546-3082)</span></strong>
												</div>
											</td>
											<td class="txt_rgt">
												<a href="javascript:setAddress('86324', '1', '16926224', 'N', '');" class="btn"><span class="btn_txt">선택</span></a>
												<a href="javascript:deleteAddress('16926224');" class="btn"><span class="btn_txt">삭제</span></a>
											</td>
										</tr>
									<tr id="O_16926231">
											<td>
												<div class="order_adr">
													<p class="addr_info">서울특별시 강동구 강동대로53길 10 10</p>
													<strong class="order_store_info">둔촌점<span>(02-478-0337)</span></strong>
												</div>
											</td>
											<td class="txt_rgt">
												<a href="javascript:setAddress('86313', '1', '16926231', 'N', '');" class="btn"><span class="btn_txt">선택</span></a>
												<a href="javascript:deleteAddress('16926231');" class="btn"><span class="btn_txt">삭제</span></a>
											</td>
										</tr>
									<tr id="O_16951430">
											<td>
												<div class="order_adr">
													<p class="addr_info">대구광역시 달서구 달구벌대로199길 68-3 </p>
													<strong class="order_store_info">대구성서점<span>(053-581-3082)</span></strong>
												</div>
											</td>
											<td class="txt_rgt">
												<a href="javascript:setAddress('86528', '1', '16951430', 'N', '');" class="btn"><span class="btn_txt">선택</span></a>
												<a href="javascript:deleteAddress('16951430');" class="btn"><span class="btn_txt">삭제</span></a>
											</td>
										</tr>
									<tr id="O_16952644">
											<td>
												<div class="order_adr">
													<p class="addr_info">서울특별시 강남구 강남대로102길 42 101-101</p>
													<strong class="order_store_info">동서초점<span>(02-532-3085)</span></strong>
												</div>
											</td>
											<td class="txt_rgt">
												<a href="javascript:setAddress('86540', '1', '16952644', 'N', '');" class="btn"><span class="btn_txt">선택</span></a>
												<a href="javascript:deleteAddress('16952644');" class="btn"><span class="btn_txt">삭제</span></a>
											</td>
										</tr>
									</tbody>
							</table>
						</div>
				</div>
				<!-- // 배달주소 -->
				<!-- 포장주소 -->
				<div class="order_addr" id="addr_W" style="display:none;">
					<div class="order_adr_chk">
						<strong>포장매장</strong>
						<a href="javascript:addBranch();" class="btn"><span class="btn_txt">포장매장 등록</span></a>
					</div>
				</div>
				<div class="order_lately" style="display:none;">
					<table>
							<colgroup>
								<col>
								<col width="170px">
							</colgroup>
							<tbody>
								<tr>
									<td class="empty_data">
										<span class="ico ico_smile3"></span>
										포장매장을 등록해주세요.
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- // 포장주소 -->
			</div>
		</div>
	</div>
	<!-- //content -->
</form>
</div>
<!-- //container -->

<!-- 배달주소 등록 팝업 -->
<div class="pop_layer pop_type" id="adr_add">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>배달주소 등록</h2>
		</div>
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- // 배달주소 등록 팝업 -->

<!-- 포장매장 등록 팝업 -->
<div class="pop_layer pop_type" id="store_add">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>포장매장 등록</h2>
		</div>
		<a href="#" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- // 포장매장 등록 팝업 -->
<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "OCVBR";	// 웹페이지의 성격 정의 - 장바구니 매장선택
</script>
<!-- // LOGGER 환경변수 설정 -->
<!-- 로딩 이미지 -->
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
			<div class="dim"></div>
		</div>
		<!-- // 로딩 이미지 -->

		<!-- 장바구니 담기 토스트 팝업(s) -->
		<div class="pop_toast" id="card_add">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_content">
					<p>장바구니에 담았습니다.</p>
				</div>
			</div>
		</div>

		<!-- //장바구니 담기 토스트 팝업(e) -->

		<!-- 장바구니(s) -->
		<div class="pop_layer pop_type" id="cart_pop">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_header">
					<h2>장바구니</h2>
				</div>
				<!-- iframe src="100_cart_pop_frame.html" width="1000" height="832" frameborder="0"></iframe><!-- 2016-10-05//아이프레임대체 -->
				<a href="javascript:;" onclick="setBasketCnt();" class="btn_ico btn_close">닫기</a>
			</div>
		</div>
		<!-- //장바구니(e) -->

		<div id="footer">
			<div class="footer_wrap">
				<div class="company_info">
					<dl class="order_phone">
						<dt>전화주문</dt>
						<dd><span class="ico ico_phone"></span>1577-3082</dd>
					</dl>
					<ul class="list_sns">
						<li><a href="https://www.facebook.com/dominostory/" target="_blank" class="btn_facebook">facebook</a></li>
						<li><a href="https://twitter.com/dominostory" target="_blank" class="btn_twitter">twitter</a></li>
						<li><a href="http://blog.naver.com/dominostory" target="_blank" class="btn_blog">blog</a></li>
						<li><a href="https://www.instagram.com/dominostory/" target="_blank" class="btn_instar">instargram</a></li>
					</ul>
					<div class="footer_menu">
						<ul class="list_terms">
							<li><a href="/company/contents/overview">회사소개</a></li>
							<li><a href="/contents/privacy"><strong>개인정보 처리방침</strong></a></li>
							<li><a href="/contents/law">이용약관</a></li>
							<li><a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a></li>
						</ul>
						<ul class="list_company">
							<li>135-928 서울특별시 강남구 언주로 315 청오디피케이㈜</li>
							<li>문의 : <a href="mailto:webmaster@dominos.co.kr">webmaster@dominos.co.kr</a></li>
							<li>사업자 등록번호: 220-81-03371</li>
							<li>통신판매업신고: 강남 5064호</li>
							<li>개인정보 보호책임자 : 이명윤</li>
							<li>대표이사: 오광현</li>
						</ul>
						<address>Copyrightsⓒ2017 by Domino’s Pizza. All rights reserved.</address>
						<!-- a href="/contents/familySite" class="btn_family">family_brand</a  -->
					</div>
				</div>
				<div class="awards_area">
					<ul class="list_awards">
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards.png" alt="">
							<p>식품안전<br>경영시스템 인증</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards2.png" alt="">
							<p>지식경제부<br>우수디자인 선정</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards3.png" alt="">
							<p>고객이 가장 추천하는 기업<br/>피자전문점 부문 4년 연속 1위</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards4.png" alt="">
							<p>2016년 「대한민국인터넷소통대상」<br/>「대한민국소셜미디어대상」<br/>Leading Star (7년 연속 종합 1위)</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards5.png" alt="">
							<p>2016 한국산업의 고객만족도<br/>피자전문점 부문 2년 연속 1위</p>
						</li>
					</ul>
				</div>
			</div>
			<a href="#" class="btn_top">Top</a>
		</div>
		<!-- //footer -->
	</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-40278626-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 21550 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
	<script type="text/javascript">var _TRK_LID="21550";var _L_TD="ssl.logger.co.kr";var _TRK_CDMN=".dominos.co.kr";</script>
	<script type="text/javascript">var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net" : "http://fs.bizspring.net";
	(function(b,s){var f=b.getElementsByTagName(s)[0],j=b.createElement(s);j.async=true;j.src='//fs.bizspring.net/fs4/bstrk.1.js';f.parentNode.insertBefore(j,f);})(document,'script');</script>
	<noscript><img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.tsp?u=21550&amp;js=N" /></noscript>
	<!-- END OF LOGGER TRACKING SCRIPT -->
	
	<!-- AceCounter Log Gathering Script V.70.2012031601-->
	<script type="text/javascript" src="/resources/js/acecounter.js"></script>
	<!-- AceCounter Log Gathering Script End -->
	
	<!-- Naver Anlytics 공통-->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
	<script type="text/javascript">
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_273c36e36e8a";
	if (!_nasa) var _nasa={};
	wcs.inflow("dominos.co.kr");
	wcs_do(_nasa);
	</script>
	<!-- // Naver Anlytics 공통 -->

	<!-- Google Tag Manager : dominos_web -->
	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TR97KL" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-TR97KL');</script>
	<!-- End Google Tag Manager -->

<!-- 2017-05-08 // 챗봇 추가(s) -->

<div class="layer_chat">
	<div class="dim"></div>
	<div class="layer_content">
		<iframe id="chatUrl" src="" frameborder="0"></iframe>
		<a href="#" class="btn_close">닫기</a>
	</div>
</div>
<!-- 2017-05-08 // 챗봇 추가(e) -->
		
</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>
</html>
