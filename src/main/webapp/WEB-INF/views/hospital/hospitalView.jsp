<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp"%>

<!-- 글 삭제 confirm 창 띄우기 -->
<script>
	function deleteCheck(){
		if(confirm("정말로 삭제하시겠습니까?") == true){	// 확인
			location.href="delete?hos_no=${hospital.hos_no}&page=${page}"
		}else{										// 취소
			alert("취소되었습니다.");
			return false;
		}
	}

</script>

<script type="text/javascript">
	/* $('#reply').load('${path}/reply?hos_no=${hospital.hos_no}')

	${'#repInsert'}.click(function(){
		if(!frm.repText.value){
			alert('댓글을 입력하세요!');
			frm.repText.focus();
			return false;
		}
	})
	var frmData = $('form').serialize();
	
	$.post('${path}/repInsert', frmData, function(data)){
		$('#reply').html(data);
		frm.reptext.value='';
	} */	
</script>

</head>
<body>
	<table border="1" width=600 align="center">
		<tr align="center">
			<td colspan=2><h2>${hospital.hos_name}</h2></td>
		</tr>
		<tr>
			<td><c:if test="${empty hospital.hos_file}">
					<img src="${path}/hos_upload/hospitalimg.jpg" height="300"
						width="300" />
				</c:if> <c:if test="${not empty hospital.hos_file}">
					<img src="${path}/hos_upload/${hospital.hos_file}" height="300"
						width="300" />
				</c:if></td>
			<td>
				<div id="map" style="width: 400px; height: 300px;"></div> <script
					type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=edb50793cf788e6a058efaf0acf9f9b1&libraries=services,clusterer,drawing"></script>
				<script>
				// 지도를 표시할 영역(container) 지정
					var mapContainer = document.getElementById('map');
					var mapOption = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),	// 지도의 중심 좌표
						level: 2	// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색
					geocoder
							.addressSearch('${addr}', function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {

					    	 // 마커가 표시될 위치
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					        // 마커 생성(결과값으로 받은 위치를 마커로 표시)
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
					        
					     	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					        var content = '<div class="customoverlay">' +
					            '  <a href="https://map.kakao.com/link/search/${addr}" target="_blank">' +
					            '    <span class="title">${hospital.hos_name}</span>' +
					            '  </a>' +
					            '</div>';

					        // 커스텀 오버레이가 표시될 위치입니다 
					        var position = new kakao.maps.LatLng(result[0].y, result[0].x);  

					        // 커스텀 오버레이를 생성합니다
					        var customOverlay = new kakao.maps.CustomOverlay({
					            map: map,
					            position: position,
					            content: content,
					            yAnchor: 0 
					        });

					        // 인포윈도우로 장소에 대한 설명을 표시
					        /* var infowindow = new kakao.maps.InfoWindow({
					            content: '<a href="https://map.kakao.com/link/search/${addr}" target="_blank">' +
					            	'<div style="width:150px;text-align:center;padding:6px 0;">${hospital.hos_name}</div>' +
					            	'</a>'
					        });
					        infowindow.open(map, marker); */

					        // 지도의 중심을 결과값으로 받은 위치로 이동
					        map.setCenter(coords);
					    } 
					});    

					
				</script>
			</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_addr}</td>
		</tr>
		<tr>
			<td colspan=2>${hospital.hos_tel}</td>
		</tr>
		<tr>
			<td colspan=2>${hos_time}</td>
		</tr>
		<tr>
			<td colspan=2>${hos_content}</td>
		</tr>
		<tr>
			<c:if test="${not empty hospital.hos_link}">
				<td colspan=2><a href="http://${hospital.hos_link}" target="_blank"
					style="text-decoration: none">${hospital.hos_link}</a></td>
			</c:if>
		</tr>
		<tr>
			<c:if test="${hospital.hos_24 == 'Y' || hospital.hos_holiday == 'Y' || hospital.hos_parking == 'Y'}">
				<td colspan=2><c:if test="${not empty hospital.hos_24 && hospital.hos_24 == 'Y'}">24시&nbsp;</c:if>
					<c:if test="${not empty hospital.hos_holiday && hospital.hos_holiday == 'Y'}">연중무휴&nbsp;&nbsp;</c:if>
					<c:if test="${not empty hospital.hos_parking && hospital.hos_parking == 'Y'}">주차 가능</c:if>
				</td>
			</c:if>
		</tr>
		<c:if test="${sessionScope.id != null}">
			<tr>
				<td colspan=2 align="center">
					<input type="button" value="추천" onClick="">
				</td>
			</tr>
		</c:if>
	</table>

	<div align="center">
		<c:if test="${sessionScope.id == hospital.hos_writer}">
			<input type="button" value="수정"
				onClick="location.href='updateForm?hos_no=${hospital.hos_no}&page=${page}'">
			<input type="button" value="삭제"
				onClick="deleteCheck()">
		</c:if>
			<input type="button" value="목록"
				onClick="location.href='hospitalList?page=${page}'">
	</div>

	<!-- Ajax 댓글 -->

	<%-- <div id="reply"></div>

	<form name="frm" id="frm">
		<input type="hidden" name="id" value="${sessionScope.id}"> 
		<input type="hidden" name="hos_no" value="${hospital.hos_no}">
		<table border="1" align="center">
			<tr>
				<td colspan="2">작성자</td>
			</tr>
			<tr>
				<td><textarea rows="3" cols="50" name="repText"
						placeholder="댓글 내용을 입력하세요."></textarea></td>
				<td><input type="button" value="등록" id="repInsert"></td>
			</tr>
		</table>
	</form> --%>

<%@ include file="../layout/footer.jsp"%>