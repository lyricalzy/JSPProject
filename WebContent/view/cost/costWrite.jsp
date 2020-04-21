<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%
	if(session.getAttribute("name") == null){
		response.sendRedirect("../login/LoginView.jsp");
		
	}

%>	
	
	
<!DOCTYPE html>
<html>
<head>
<title>예상 창업 비용 계산</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="../../js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="../js/sojaeji.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/css.css">

<script type="text/javascript">
	$(
			function() {
				// 시/도
				var city = [ '서울', '부산', '대구', '인천', '광주', '대전', '울산', '강원',
						'경기', '경남', '경북', '전남', '전북', '제주', '충남', '충북' ]
				// 서울 구/군
				var gu1 = [ '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구',
						'금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구',
						'서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구',
						'은평구', '종로구', '중구', '중랑구' ]
				// 부산 구/군
				var gu2 = [ '강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구',
						'사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구',
						'기장군' ]
				// 대구 구/군
				var gu3 = [ '남구', '달서구', '동구', '북구', '서구', '수성구', '중구', '달성군' ]
				// 인천 구/군
				var gu4 = [ '계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구', '중구',
						'강화군', '옹진군' ]
				// 광주 구/군
				var gu5 = [ '광산구', '남구', '동구', '북구', '서구' ]
				// 대전 구/군
				var gu6 = [ '대덕구', '동구', '서구', '유성구', '중구' ]
				// 울산 구/군
				var gu7 = [ '남구', '동구', '북구', '중구', '울주군' ]
				// 강원 구/군
				var gu8 = [ '강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시', '태백시',
						'고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군',
						'홍천군', '화천군', '횡성군' ]
				// 경기 구/군
				var gu9 = [ '고양시 덕양구', '고양시 일산동구', '고양시 일산서구', '과천시', '광명시',
						'광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시 소사구',
						'부천시 오정구', '부천시 원미구', '성남시 분당구', '성남시 수정구', '성남시 중원구',
						'수원시 권선구', '수원시 영통구', '수원시 장안구', '수원시 팔달구', '시흥시',
						'안산시 단원구', '안산시 상록구', '안성시', '안양시 동안구', '안양시 만안구',
						'양주시', '오산시', '용인시 기흥구', '용인시 수지구', '용인시 처인구', '의왕시',
						'의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시',
						'가평군', '양평군', '여주군', '연천군' ]
				// 경남 구/군
				var gu10 = [ '거제시', '김해시', '마산시', '밀양시', '사천시', '양산시', '진주시',
						'진해시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군',
						'창녕군', '하동군', '함안군', '함양군', '합천군' ]
				// 경북 구/군
				var gu11 = [ '경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시',
						'영주시', '영천시', '포항시 남구', '포항시 북구', '고령군', '군위군', '봉화군',
						'성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군',
						'청송군', '칠곡군' ]
				// 전남 구/군
				var gu12 = [ '광양시', '나주시', '목포시', '순천시', '여수시', '강진군', '고흥군',
						'곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군',
						'완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군' ]
				// 전북 구/군
				var gu13 = [ '군산시', '김제시', '남원시', '익산시', '전주시 덕진구', '전주시 완산구',
						'정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군',
						'진안군' ]
				// 제주 구/군
				var gu14 = [ '제주시', '서귀포시' ]
				// 충남 구/군
				var gu15 = [ '계룡시', '공주시', '논산시', '보령시', '서산시', '아산시',
						'천안시 동남구', '천안시 서북구', '금산군', '당진군', '부여군', '서천군',
						'연기군', '예산군', '청양군', '태안군', '홍성군' ]
				// 충북 구/군
				var gu16 = [ '제천시', '청주시 상당구', '청주시 흥덕구', '충주시', '괴산군', '단양군',
						'보은군', '영동군', '옥천군', '음성군', '증평군', '진천군', '청원군' ]

				for (var i = 0; i < city.length; i++) {
					$("#sido").append(
							"<option value=" + city[i] + ">" + city[i]
									+ "</option>")
				}

				$("#sido").change(
						function() {
							$("#gugun").empty();
							$("#gugun").append("<option>-구/군-</option>")
							if ($("#sido").val() == '서울') {
								for (var i = 0; i < gu1.length; i++) {
									$("#gugun").append(
											"<option value=" + gu1[i] + ">"
													+ gu1[i] + "</option>")
								}
							} else if ($("#sido").val() == '부산') {
								for (var i = 0; i < gu2.length; i++) {
									$("#gugun").append(
											"<option value=" + gu2[i] + ">"
													+ gu2[i] + "</option>")
								}
							} else if ($("#sido").val() == '대구') {
								for (var i = 0; i < gu3.length; i++) {
									$("#gugun").append(
											"<option value=" + gu3[i] + ">"
													+ gu3[i] + "</option>")
								}
							} else if ($("#sido").val() == '인천') {
								for (var i = 0; i < gu4.length; i++) {
									$("#gugun").append(
											"<option value=" + gu4[i] + ">"
													+ gu4[i] + "</option>")
								}
							} else if ($("#sido").val() == '광주') {
								for (var i = 0; i < gu5.length; i++) {
									$("#gugun").append(
											"<option value=" + gu5[i] + ">"
													+ gu5[i] + "</option>")
								}
							} else if ($("#sido").val() == '대전') {
								for (var i = 0; i < gu6.length; i++) {
									$("#gugun").append(
											"<option value=" + gu6[i] + ">"
													+ gu6[i] + "</option>")
								}
							} else if ($("#sido").val() == '울산') {
								for (var i = 0; i < gu7.length; i++) {
									$("#gugun").append(
											"<option value=" + gu7[i] + ">"
													+ gu7[i] + "</option>")
								}
							} else if ($("#sido").val() == '강원') {
								for (var i = 0; i < gu8.length; i++) {
									$("#gugun").append(
											"<option value=" + gu8[i] + ">"
													+ gu8[i] + "</option>")
								}
							} else if ($("#sido").val() == '경기') {
								for (var i = 0; i < gu9.length; i++) {
									$("#gugun").append(
											"<option value=" + gu9[i] + ">"
													+ gu9[i] + "</option>")
								}
							} else if ($("#sido").val() == '경남') {
								for (var i = 0; i < gu10.length; i++) {
									$("#gugun").append(
											"<option value=" + gu10[i] + ">"
													+ gu10[i] + "</option>")
								}
							} else if ($("#sido").val() == '경북') {
								for (var i = 0; i < gu11.length; i++) {
									$("#gugun").append(
											"<option value=" + gu11[i] + ">"
													+ gu11[i] + "</option>")
								}
							} else if ($("#sido").val() == '전남') {
								for (var i = 0; i < gu12.length; i++) {
									$("#gugun").append(
											"<option value=" + gu12[i] + ">"
													+ gu12[i] + "</option>")
								}
							} else if ($("#sido").val() == '전북') {
								for (var i = 0; i < gu13.length; i++) {
									$("#gugun").append(
											"<option value=" + gu13[i] + ">"
													+ gu13[i] + "</option>")
								}
							} else if ($("#sido").val() == '제주') {
								for (var i = 0; i < gu14.length; i++) {
									$("#gugun").append(
											"<option value=" + gu14[i] + ">"
													+ gu14[i] + "</option>")
								}
							} else if ($("#sido").val() == '충남') {
								for (var i = 0; i < gu15.length; i++) {
									$("#gugun").append(
											"<option value=" + gu15[i] + ">"
													+ gu15[i] + "</option>")
								}
							} else if ($("#sido").val() == '충북') {
								for (var i = 0; i < gu16.length; i++) {
									$("#gugun").append(
											"<option value=" + gu16[i] + ">"
													+ gu16[i] + "</option>")
								}
							}
						})
				// 외식업
				var jong1 = [ '한식', '분식', '주점', '전문점 ', '고기류', '치킨류',
						'커피/패스트푸드', '기타' ]
				// 판매업
				var jong2 = [ '제품판매업', '식품판매업', '가구/잡화', '기타' ]
				// 서비스/무점포업
				var jong3 = [ '공간대여업 ', '생활서비스업', '무점포⦁소호', '기타 ' ]

				// 한식
				var sae1 = [ '탕/찌개', '식사/백반', '찜/샤브', '전문점', '기타' ]
				// 분식
				var sae2 = [ '김밥', '떡볶이', '면', '퓨전', '기타' ]
				// 주점
				var sae3 = [ '포차/막걸리', '맥주/스몰비어', '일본식주점', '와인/요리주점', '기타주점' ]
				// 전문점
				var sae4 = [ '중식/일식', '회/해산물', '서양식', '퓨전메뉴', '기타' ]
				// 고기류
				var sae5 = [ '돼지구이점', '소구이점', '전문부위집', '종합고기집', '기타고기' ]
				// 치킨류
				var sae6 = [ '배달치킨점', '치킨호프점', '테이크아웃점', '치킨카페', '기타' ]
				// 커피/패스트푸드
				var sae7 = [ '커피/음료전문점', '아이스크림전문점', '제과점/도넛', '피자/샌드위치', '기타' ]
				// 제품판매업
				var sae8 = [ '의류/신발', '안경/핸드폰 ', '화장품/주얼리', '문구/스포츠', '기타' ]
				// 식품판매업
				var sae9 = [ '편의점/슈퍼', '야채/과일 ', '건강/유기농', '식품', '기타' ]
				// 가구/잡화
				var sae10 = [ '가구', '잡화/소품', '레저/스포츠', '가전 ' ]
				// 공간대여업
				var sae11 = [ '오락실/당구장', '헬스/건강', 'PC방/멀티방', '독서실/노래방', '기타' ]
				// 생활서비스업
				var sae12 = [ '미용실/네일', '학원', '카센터/자동차', '대행업', '기타 ' ]
				// 무점포⦁소호
				var sae13 = [ '온라인', '컴퓨터서비스', '렌탈', '여행관련', '기타' ]

				$('#tae').change(
						function() {
							$('#jong').empty();
							$('#jong').append("<option>-업종-</option>")
							if ($('#tae').val() == '외식업') {
								for (var i = 0; i < jong1.length; i++) {
									$("#jong").append(
											"<option value=" + jong1[i] + ">"
													+ jong1[i] + "</option>")
								}
							} else if ($('#tae').val() == '판매업') {
								for (var i = 0; i < jong2.length; i++) {
									$("#jong").append(
											"<option value=" + jong2[i] + ">"
													+ jong2[i] + "</option>")
								}
							} else if ($('#tae').val() == '서비스/무점포업') {
								for (var i = 0; i < jong3.length; i++) {
									$("#jong").append(
											"<option value=" + jong3[i] + ">"
													+ jong3[i] + "</option>")
								}
							} else if ($('#tae').val() == '기타') {
								$("#jong").append("<option>기타</option>")
							}
						})

				$('#jong').change(
						function() {
							$('#sae').empty();
							$('#sae').append("<option>-세부업종-</option>")
							if ($('#jong').val() == '한식') {
								for (var i = 0; i < sae1.length; i++) {
									$("#sae").append(
											"<option value=" + sae1[i] + ">"
													+ sae1[i] + "</option>")
								}
							} else if ($('#jong').val() == '분식') {
								for (var i = 0; i < sae2.length; i++) {
									$("#sae").append(
											"<option value=" + sae2[i] + ">"
													+ sae2[i] + "</option>")
								}
							} else if ($('#jong').val() == '주점') {
								for (var i = 0; i < sae3.length; i++) {
									$("#sae").append(
											"<option value=" + sae3[i] + ">"
													+ sae3[i] + "</option>")
								}
							} else if ($('#jong').val() == '전문점') {
								for (var i = 0; i < sae4.length; i++) {
									$("#sae").append(
											"<option value=" + sae4[i] + ">"
													+ sae4[i] + "</option>")
								}
							} else if ($('#jong').val() == '고기류') {
								for (var i = 0; i < sae5.length; i++) {
									$("#sae").append(
											"<option value=" + sae5[i] + ">"
													+ sae5[i] + "</option>")
								}
							} else if ($('#jong').val() == '치킨류') {
								for (var i = 0; i < sae6.length; i++) {
									$("#sae").append(
											"<option value=" + sae6[i] + ">"
													+ sae6[i] + "</option>")
								}
							} else if ($('#jong').val() == '커피/패스트푸드') {
								for (var i = 0; i < sae7.length; i++) {
									$("#sae").append(
											"<option value=" + sae7[i] + ">"
													+ sae7[i] + "</option>")
								}
							} else if ($('#jong').val() == '제품판매업') {
								for (var i = 0; i < sae8.length; i++) {
									$("#sae").append(
											"<option value=" + sae8[i] + ">"
													+ sae8[i] + "</option>")
								}
							} else if ($('#jong').val() == '식품판매업') {
								for (var i = 0; i < sae9.length; i++) {
									$("#sae").append(
											"<option value=" + sae9[i] + ">"
													+ sae9[i] + "</option>")
								}
							} else if ($('#jong').val() == '가구/잡화') {
								for (var i = 0; i < sae10.length; i++) {
									$("#sae").append(
											"<option value=" + sae10[i] + ">"
													+ sae10[i] + "</option>")
								}
							} else if ($('#jong').val() == '공간대여업') {
								for (var i = 0; i < sae11.length; i++) {
									$("#sae").append(
											"<option value=" + sae11[i] + ">"
													+ sae11[i] + "</option>")
								}
							} else if ($('#jong').val() == '생활서비스') {
								for (var i = 0; i < sae12.length; i++) {
									$("#sae").append(
											"<option value=" + sae12[i] + ">"
													+ sae12[i] + "</option>")
								}
							} else if ($('#jong').val() == '무점포⦁소호') {
								for (var i = 0; i < sae13.length; i++) {
									$("#sae").append(
											"<option value=" + sae13[i] + ">"
													+ sae13[i] + "</option>")
								}
							} else if ($('#jong').val() == '기타') {
								$("#sae").append("<option>기타</option>")
							}
						})

				$('#calBtn')
						.click(
								function() {
									if ($('#name').val() == "") {
										alert("이름을 입력하세요");
										$('#name').focus();
									} else if ($('#sido option:selected').val() == '-시/도-') {
										alert("지역을 선택하세요");
										$('#sido').focus();
									} else if ($('#pyung option:selected')
											.val() == '-평수-') {
										alert("평수를 선택하세요");
										$('#pyung').focus();
									} else if ($('#tae option:selected').val() == '-업태-') {
										alert("업태를 선택하세요");
										$('#tae').focus();
									} else {
										location.href = "costResult.jsp?name="
												+ $('#name').val()
												+ "&sido="
												+ $('#sido option:selected')
														.val()
												+ "&pyung="
												+ $('#pyung option:selected')
														.val()
												+ "&tae="
												+ $('#tae option:selected')
														.val()
									}
								})
			})
</script>
</head>
<body>

<!-- 	<div class="jumbotron text-center" style="margin-bottom: 0px;"> -->
<!-- 		<h1>창업 컨설팅 사이트</h1> -->
<%-- 		<h3 class ="text-right" style="color:black"><%=session.getAttribute("name") %>님 환영합니다. <a href="../login/logout.jsp">로그아웃</a></h3> --%>
<!-- 	</div> -->

<!-- 	<div class="container" style="margin-bottom: 100px; margin-top: 0px;"> -->
<%-- 		<jsp:include page="../main/mainMenu.jsp"></jsp:include> --%>
<!-- 	</div> -->

<!-- 	<div class="container"> -->
<%-- 		<jsp:include page="../main/knowhowTop.jsp"></jsp:include> --%>
<!-- 	</div> -->

<jsp:include page="../main/top.jsp"></jsp:include>

<div style ="height : 70px;"></div>
	<div class="container" style="margin-bottom: 100px;">
		<h2>예상 창업 비용 계산</h2>
		<hr style="border: solid 2px;">
		<div>
			<table class="table bbs" style ="border = none;">
				<tr style ="height : 50px;">
					<td><span class="tt">이름</span></td>
					<td><input type="text" name="name" id="name"
						class="form-control"></td>
				</tr>
				<tr>
					<td><span class="tt">연락처</span></td>
					<td>
						<div class="form-group row">
							<div class="col-md-2">
								<select name="tel1" id="tel1" class="form-control">
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>019</option>
									<option>02</option>
									<option>032</option>
								</select>
							</div>
							<div class="col-md-2">
								<input type="text" name="tel2" id="tel2" maxlength="4"
									class="form-control"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
							<div class="col-md-1">-</div>
							<div class="col-md-2">
								<input type="text" name="tel3" id="tel3" maxlength="4"
									class="form-control"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="tt">평수</span></td>
					<td><select name="pyung" id="pyung" class="form-control">
							<option>-평수-</option>
							<option value="10">10평이하</option>
							<option value="20">11~20평</option>
							<option value="30">21~30평</option>
							<option value="40">31~40평</option>
							<option value="50">41~49평</option>
							<option value="60">50평이상</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="tt">시/도</span></td>
					<td><select name="sido" id="sido" class="form-control">
							<option>-시/도-</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="tt">구/군</span></td>
					<td><select name="gugun" id="gugun" class="form-control">
							<option>-구/군-</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="tt">창업형태</span></td>
					<td><select name="hyung" id="hyung" class="form-control">
							<option>-창업형태-</option>
							<option value="프랜차이즈">프랜차이즈</option>
							<option value="전수창업">전수창업</option>
							<option value="개인창업">개인창업</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="tt">업태</span></td>
					<td><select name="tae" id="tae" class="form-control">
							<option>-업태-</option>
							<option value="외식업">외식업</option>
							<option value="판매업">판매업</option>
							<option value="서비스/무점포업">서비스/무점포업</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="tt">업종</span></td>
					<td><select name="jong" id="jong" class="form-control">
							<option>-업종-</option>
					</select></td>
				</tr>
				<tr>
					<td><span class="tt">세부업종</span></td>
					<td><select name="sae" id="sae" class="form-control">
							<option>-세부업종-</option>
					</select></td>
				</tr>
			</table>
			<button onclick="" class="btn btn-success" style="float: right;"
				id="calBtn">예상 창업 비용 보기</button>
		</div>
	</div>
	<div class="jumbotron text-center" style="margin-bottom: 100px; margin-top: 0px;">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>