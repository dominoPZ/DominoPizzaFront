<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 토핑 알레르기 유발성분 표 팝업(s) -->
<div class="pop_layer pop_type pop_toppingAllergic" id="toppingAllergic">
	<div class="pop_wrap" style="top: 338px;">
			<div class="pop_header">
				<h2>토핑 알레르기 유발성분</h2>
			</div>
			<div class="pop_content">
				<div class="allergy_guide">
					<p>한국인에게 알레르기를 유발할 수 있는 12가지 식품에 대해 아래와 같이 제품별 상세 내용을 표기하여 안내해드립니다.<br>(괄호 안 식품이 해당 토핑에 포함되어있는 알레르기 유발 가능식품)</p>
					<dl>
						<dt>* 알레르기 유발 가능 식품 : </dt>
						<dd>토마토, 아황산류(이를 첨가하여 최종제품에 SO2로 10mg/kg 이상 함유한 경우에 한한다), 호두, 닭고기, 쇠고기, 오징어, 조개류(굴, 전복, 홍합 포함)</dd>
					</dl>
				</div>
	
				<div class="allergy_table">
					<table class="tbl_type">
						<caption>유발성분 표</caption>
						<colgroup>
							<col width="5%">
							<col width="25%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>토핑</th>
								<th>알레르기 유발성분 표기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>도미노치즈 (모차렐라)</td>
								<td>우유</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>2</td>
								<td>베이컨</td>
								<td>돼지고기</td>
							</tr>
							<tr>
								<td>3</td>
								<td>페퍼로니</td>
								<td>돼지고기, 쇠고기</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>4</td>
								<td>감자 (냉동감자)</td>
								<td>대두, 이산화황</td>
							</tr>
							<tr>
								<td>5</td>
								<td>햄</td>
								<td>돼지고기, 쇠고기, 대두, 계란</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>6</td>
								<td>불고기</td>
								<td>쇠고기, 대두, 밀</td>
							</tr>
							<tr>
								<td>7</td>
								<td>체더치즈</td>
								<td>우유</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>8</td>
								<td>카망베르 크림 치즈</td>
								<td>우유</td>
							</tr>
							<tr>
								<td>9</td>
								<td>로스트 포테이토</td>
								<td>대두</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>10</td>
								<td>포크</td>
								<td>돼지고기, 쇠고기, 대두, 밀, 계란</td>
							</tr>
							<tr>
								<td>11</td>
								<td>할라피뇨 호스래디시 소스</td>
								<td>계란, 대두</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>12</td>
								<td>베이컨칩</td>
								<td>돼지고기</td>
							</tr>
							<!-- <tr>
								<td>13</td>
								<td>프리미엄 너츠 고구마무스</td>
								<td>계란, 대두</td>
							</tr> -->
							<tr class="bg_tr_gray">
								<td>13</td>
								<td>프리미엄 불고기</td>
								<td>쇠고기, 대두, 밀</td>
							</tr>
							<tr>
								<td>14</td>
								<td>선드라이 토마토</td>
								<td>토마토</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>15</td>
								<td>마요네즈</td>
								<td>난류, 대두</td>
							</tr>
							<tr>
								<td>16</td>
								<td>보코치니</td>
								<td>우유</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>17</td>
								<td>갈릭올리브믹스</td>
								<td>계란, 우유, 대두</td>
							</tr>
							<tr>
								<td>18</td>
								<td>파르메산 치즈</td>
								<td>우유</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>19</td>
								<td>프로볼로네 치즈</td>
								<td>우유</td>
							</tr>
							<tr>
								<td>20</td>
								<td>직화 스테이크</td>
								<td>쇠고기, 대두, 밀</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>21</td>
								<td>킹프론</td>
								<td>새우</td>
							</tr>
							<tr>
								<td>22</td>
								<td>칼라마리</td>
								<td>오징어</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>23</td>
								<td>만체고 슈레드 치즈</td>
								<td>우유</td>
							</tr>
							<tr>
								<td>24</td>
								<td>새송이 버섯</td>
								<td>대두</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>25</td>
								<td>스윗펌킨빠스</td>
								<td>대두</td>
							</tr>
							<tr>
								<td>26</td>
								<td>와규 크럼블</td>
								<td>쇠고기, 대두, 밀</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>27</td>
								<td>비스테카 스테이크</td>
								<td>쇠고기, 밀, 대두, 토마토</td>
							</tr>
							<tr>
								<td>28</td>
								<td>생 모차렐라 + 그뤼에르 멜팅치즈</td>
								<td>우유</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>29</td>
								<td>브레이즈 포크</td>
								<td>돼지고기, 대두, 토마토</td>
							</tr>
							<tr>
								<td>30</td>
								<td>통모차렐라 치즈</td>
								<td>우유</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>31</td>
								<td>칼릭비프</td>
								<td>쇠고기, 대두, 토마토</td>
							</tr>
							<tr>
								<td>32</td>
								<td>허니로스트햄</td>
								<td>돼지고기, 대두, 밀</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>33</td>
								<td>호스래디시소스</td>
								<td>계란, 우유, 대두</td>
							</tr>
							<tr>
								<td>34</td>
								<td>칼라마리 큐브</td>
								<td>오징어</td>
							</tr>
							<tr class="bg_tr_gray">
								<td>35</td>
								<td>꽃게살</td>
								<td>꽃게</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<a href="javascript:closeAllergic();" class="btn_ico btn_close">닫기</a>
		</div>
</div>
<!-- 토핑 알레르기 유발성분 표 팝업(e) -->