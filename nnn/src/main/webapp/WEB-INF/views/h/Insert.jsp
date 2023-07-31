<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Core Work Tools</title>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Insertcss.css">
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/@zxing/library@latest"></script>
<script>
	//유효성검사
	$(function(){
		$("#insert").click(function(){
			let h_name = $("#h_name").val();
			let h_no = $("#h_no").val();
			let h_number = $("#h_number").val();
			
			if(h_name == ""){
				alert("병동명을 확인해주세요.");
				$("#h_name").focus();
				return false;
			}else if(h_no == ""){
				alert("병실 번호를 확인해주세요");
				$("#h_no").focus();
				return false;
			}else if(h_number == ""){
				alert("침상 번호를 확인해주세요");
				$("#h_number").focus();
				return false;
			}
			// insert
			$("#frm").attr("action","${pageContext.request.contextPath}/h/Insertajax/${detail.midx}").submit();
			
			
			/* 
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/h/Insertajax/${sessionScope.midx}",
				data: {
					h_name: h_name,
					h_no: h_no,
					h_number: h_number
				},
				success: function(response){
					// fetch updated list data using AJAX
					alert("등록완료");
					$.ajax({
				          type: "GET",
				          url: "${pageContext.request.contextPath}/h/Insert.do/${sessionScope.midx}",
				          dataType: "json",
				          success: function(data) {
				        	  alert(data);
				            // update HTML to display updated list
				            let listHTML = "";
				            data.forEach(function(item) {
				              listHTML += "<li>" + item.h_name + ", " + item.h_no + ", " + item.h_number + "</li>";
				            });
				            $("#list-container").html("<ul>" + listHTML + "</ul>");
				          },
				          error: function(xhr, status, error) {
				            alert("Error fetching updated list: " + error);
				            console.log(error);
				          }
				        });
				},
				error: function(xhr, status, error){
					alert("오류발생: "+ error);
				}
			})
			*/
		});
		
	});
	
	
</script>
</head>

<body>
<%@ include file="../Include/Header3.jsp" %>
<section>
<div class="container">
	<div class="overlay"></div>
	<%--
	<c:if test="${detail.m_in == null or detail.m_de == null or detail.m_no == null}">
		<script>
			alert('회원 정보를 입력해주세요');
			location.href = "${pageContext.request.contextPath}/m/Detail.do/${detail.midx}";
		</script>
	</c:if>
	 --%>
		<form method="post" id="frm" action=""
			>
			<div class="scan-box scan">
				<img id="scanButton" src="${pageContext.request.contextPath}/resources/icon/QR icon.png">
				<span class="light">QR코드 스캔을 위해 위 이미지를 눌러주세요.</span>
				<!-- <video style="display: none;" id="qrVideo" class="scan"></video> -->
				<img style="display:none; position: fixed; z-index:11; top:10px; right: 10px;" id="QRdel" src="${pageContext.request.contextPath}/resources/icon/del_white.png">
				<span class="light" id="QRtext">QR코드를 스캔하기 위해 중앙에 위치해 주세요.</span>
				<img class="" id="QR_scan_img" src="${pageContext.request.contextPath}/resources/img/out_line_QR.png">
				<span class="light" id="QRtext2">QR코드를 인식하시면 자동으로 기입이 완료됩니다.</span>
			</div>
			<div class="dott"></div>
			<input type="hidden" name="h_userId" value="${detail.m_id}">
			<input type="hidden" name="h_userName" value="${detail.m_name}">
			<div class="data-box light">
				<div class="data">
					<div class="flex flex-start" onclick="this.querySelector('input').focus();">
						<input type="text" id="h_name" name="h_name" maxlength="2" value="${h_name }" onchange="namechange()"/>
						<div>병동</div>
					</div>
					<div class="flex flex-start" onclick="this.querySelector('input').focus();">
						<input type="text" id="h_no" name="h_no" value="${h_no }" maxlength="2" onchange="nochange()"/>
						<div>병실</div>
					</div>
					<div class="flex flex-start" onclick="this.querySelector('input').focus();">
						<input type="text" id="h_number" name="h_number" value="${h_number }" maxlength="2" onchange="numberchange()"/>
						<div>침상</div>
					</div>
				</div>
			</div>
<script type="text/javascript">	



	const codeReader = new ZXing.BrowserQRCodeReader();
	const scanButton = document.getElementById('scanButton');
	const h_name = document.getElementById('h_name');
	const h_no = document.getElementById('h_no');
	const h_number = document.getElementById('h_number');
	const QRdel = document.getElementById('QRdel');
	
	
	
	scanButton.addEventListener('click', () => {
		navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
			const video = document.createElement('video');
			const img = document.createElement('img');
			video.srcObject = stream;
			// scan클래스를 지정하여 scan클래스에 video생성
			//document.body.appendChild(video);
			document.querySelector('.scan').appendChild(video);
			// video태그에 class 추가
			video.className += "QRscan";
			
			video.play();
			video.muted = true;
			video.playsinline = true;
			// 오버레이(화면 어둡게) 시작
			$(".overlay").show();
			// QRdel icon 생성
			$("#QRdel").show();
			// QR 안내 text 생성
			$("#QRtext").show();
			// QR_scan_img 생성
			$("#QR_scan_img").show();
			// QR 안내 text2 생성
			$("#QRtext2").show();
			
			
			
			// QRdel icon 클릭 시 QR스캔 중지
			QRdel.addEventListener('click', () => {
				// video 요소를 삭제합니다.
				video.pause();
				video.srcObject = null;
				const videoParent = video.parentNode;
				videoParent.removeChild(video);
				// 스트림을 중지합니다.
				stream.getTracks().forEach(track => track.stop());
				// 오버레이(화면 어둡게) 제거
				$(".overlay").hide();
				// QRdel icon 제거
				$("#QRdel").hide();
				// QR 안내 text 제거
				$("#QRtext").hide();
				// QR_scan_img 제거
				$("#QR_scan_img").hide();
				// QR 안내 text2 제거
				$("#QRtext2").hide();
			});
			
			codeReader.decodeFromVideoDevice(undefined, video, (result) => {
				if (result) {
				
				const urlParam = new URLSearchParams(result.text);
				console.log(result.text);
				const h_name_val = urlParam.get('h_name');
				const h_no_val = urlParam.get('h_no');
				const h_number_val = urlParam.get('h_number');
				
				console.log(h_name_val);
				console.log(h_no_val);
				console.log(h_number_val);
				
				h_name.value = h_name_val;
				h_no.value = h_no_val;
				h_number.value = h_number_val;
				
            	video.pause();
            	video.srcObject = null;
            	const videoParent = video.parentNode;
            	videoParent.removeChild(video);
            	
            	// 스트림을 중지합니다.
				stream.getTracks().forEach(track => track.stop());
				// 오버레이(화면 어둡게) 제거
				$(".overlay").hide();
				// QRdel icon 제거
				$("#QRdel").hide();
				// QR 안내 text 제거
				$("#QRtext").hide();
				// QR_scan_img 제거
				$("#QR_scan_img").hide();
				// QR 안내 text2 제거
				$("#QRtext2").hide();
				}
			}).catch((err) => {
			console.error(err);
			// video 요소를 삭제합니다.
			video.pause();
			video.srcObject = null;
			const videoParent = video.parentNode;
			videoParent.removeChild(video);
			// 스트림을 중지합니다.
			stream.getTracks().forEach(track => track.stop());
			// 오버레이(화면 어둡게) 제거
			$(".overlay").hide();
			// QRdel icon 제거
			$("#QRdel").hide();
			// QR 안내 text 제거
			$("#QRtext").hide();
			// QR_scan_img 제거
			$("#QR_scan_img").hide();
			// QR 안내 text2 제거
			$("#QRtext2").hide();
			});
		}).catch((err) => {
		console.error(err);
		});
	});
</script>
			<div class="dott2"></div>
			<div class="btn-box">
				<div id="insert" class="flex flex-center btn btn1 bold" >수발시작</div>
				<div id="end" class="flex flex-center btn btn2 bold">수발완료</div>
			</div>
			<div class="modal normal">
				<div class="modal_body">
					<div>
						<img class="del-icon" src="${pageContext.request.contextPath}/resources/icon/del.png" onclick="closePopup()">
						<img class="insert-icon" src="${pageContext.request.contextPath}/resources/icon/insert.png">
						<div class="text text3">수발완료가 되었습니다.</div>
						<div class="text text4">기타 참고 사항을 입력해주세요.</div>
						<div class="textarea">
							<textarea name="h_comm" id="h_comm"></textarea>
						</div>
						<div class="modal_insert" id="modal_insert" onclick="end()">
						등록
						</div>
					</div>
				</div>
			</div>
			<div class="modal2 normal">
				<div class="modal_body2">
					<div>
						<img class="modal2_img" src="${pageContext.request.contextPath}/resources/img/white.png" style="width: 680px; height: 680px;">
						<!-- <img class="modal2_img" src="" style="width: 680px; height: 680px;"> -->
						<div class="text text3" id="result"></div>
						<div class="modal_insert" id="" onclick="closePopupAndRedirect2(); closePopup();">
						확인
						</div>
					</div>
				</div>
			</div>
			<div class="enter"></div>
			
			<div class="imglist flex flex-center" id="recent">
			
				<c:choose>
					<c:when test="${empty startlist}">
						<div class="imglist-content" id="list-contanier">
							<%-- <img src="${pageContext.request.contextPath}/resources/img/0.png"> --%>
							<div class="imglist-content-text text1 normal"> </div>
							<div class="imglist-content-text text5 normal">수발시작 데이터가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${startlist}" var="startlist">
							<div class="imglist-content" id="list-contanier">
								<img src="${pageContext.request.contextPath}/resources/img/0.png">
								<div class="imglist-content-text text1 normal">${startlist.h_startTime}</div>
								<div class="imglist-content-text text2 bold">수발시작 정상처리</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${empty endlist or endlist == '[null]'}">
						<div class="imglist-content" id="list-contanier">
							<%-- <img src="${pageContext.request.contextPath}/resources/img/0.png"> --%>
							<div class="imglist-content-text text1 normal"> </div>
							<div class="imglist-content-text text5 normal">수발완료 데이터가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${endlist}" var="endlist">
							<div class="imglist-content" id="list-contanier">
								<img src="${pageContext.request.contextPath}/resources/img/0.png">
								<div class="imglist-content-text text1 normal">${endlist.h_endTime}</div>
								<div class="imglist-content-text text2 bold">수발완료 정상처리</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		
		</form>
		
		
	</div>
	
</section>
<script>



const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const modal2 = document.querySelector('.modal2');
const btnOpenPopup = document.querySelector('#end');
const modal2Open = document.querySelector('#modal_insert')
var result = document.querySelector('#result')
var modal2img = document.querySelector('.modal2_img');

function getRandRange(min,max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRandWeight(listItem){
    var pickVal = Number.MAX_VALUE;
    var pickItem = null;
    for(var item in listItem){
        if(listItem.hasOwnProperty(item)){
            var tmpVal = -Math.log(Math.random()) / listItem[item];
            if(tmpVal < pickVal){
                pickVal = tmpVal;
                pickItem = item;
            }
        }
    }
    return pickItem;
}

btnOpenPopup.addEventListener('click', () => {
	
		let h_name = $("#h_name").val();
		let h_no = $("#h_no").val();
		let h_number = $("#h_number").val();
		
		if(h_name == ""){
			alert("병동명을 확인해주세요.");
			$("#h_name").focus();
			return false;
		}else if(h_no == ""){
			alert("병실 번호를 확인해주세요");
			$("#h_no").focus();
			return false;
		}else if(h_number == ""){
			alert("침상 번호를 확인해주세요");
			$("#h_number").focus();
			return false;
		}
		
	
	
	modal.classList.toggle('show');

	if (modal.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
});

modal2Open.addEventListener('click', () => {
	modal2.classList.toggle('show');

	if (modal2.classList.contains('show')) {
		body.style.overflow = 'hidden';
	}
});
function end(){
	
	if (textareaIsEmpty()) {
		// textarea가 비어있는 경우
			const confirmed = window.confirm('내용을 입력하지 않으셨습니다. 그대로 등록하시겠습니까?');
			if (confirmed) {
				$(document).ready(function(){
					var str = "";
					var listItem = [];
					listItem["당첨"] = 50;
					listItem["꽝"] = 50;
					
					// 꽝
					var src1 = "${pageContext.request.contextPath}/resources/img/25.png";
					// 당첨
					var src2 = "${pageContext.request.contextPath}/resources/img/prize.png";
					
					var pickItem = getRandWeight(listItem);
					
					if(pickItem == "꽝"){
						str = "아쉽지만.. "
						modal2img.src = src1;
					}else{
						str = "축하합니다! "
						modal2img.src = src2;
					}
					console.log(str + pickItem +"입니다");
					
					
					result.textContent = str + pickItem +"입니다";
//					alert(str + pickItem +" 입니다");
					
				});
//				closePopupAndRedirect();
			}
		} else {
			// 코멘트 창에 아무말도 입력하지 않았을때
			$(document).ready(function(){
				var str = "";
				var listItem = [];
				listItem["당첨"] = 50;
				listItem["꽝"] = 50;
				
				// 꽝
				var src1 = "${pageContext.request.contextPath}/resources/img/25.png";
				// 당첨
				var src2 = "${pageContext.request.contextPath}/resources/img/prize.png";
				
				var pickItem = getRandWeight(listItem);
				
				if(pickItem == "꽝"){
					str = "아쉽지만.. "
					modal2img.src = src1;
				}else{
					str = "축하합니다! "
					modal2img.src = src2;
				}
				console.log(str + pickItem +"입니다");
				
				
				result.textContent = str + pickItem +"입니다";
//				alert(str + pickItem +" 입니다");
				
			});
//			closePopupAndRedirect();
		}
}

modal.addEventListener('click', (event) => {
	
	
	if (event.target === modal) {
		// 모달 바깥 영역을 클릭했을 때
		const confirmed = window.confirm('등록하시겠습니까?');
		end();
		/* 
		if (textareaIsEmpty()) {
		// textarea가 비어있는 경우
			const confirmed = window.confirm('내용을 입력하지 않으셨습니다. 그대로 등록하시겠습니까?');
			if (confirmed) {
				// 모달 바깥 영역 클릭했을 때 모달2 띄움
				end();
//				closePopupAndRedirect();
				
			}
		} else {
			// 모달 바깥 영역 클릭했을 때 + 코멘트 창 비어있을때 모달2 띄움
			end();
//			closePopupAndRedirect();
		}
		 */
	}
});




function namechange(){
	let value = $('#h_name').val();
	console.log(value);
}
function nochange(){
	let value = $('#h_no').val();
	console.log(value);
}
function numberchange(){
	let value = $('#h_number').val();
	console.log(value);
}
function closePopupAndRedirect() {
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
	let h_name = $("#h_name").val();
	let h_no = $("#h_no").val();
	let h_number = $("#h_number").val();
	let midx = "${sessionScope.midx}"
	let h_comm = $("#h_comm").val();
	
	console.log(h_name);
	console.log(h_no);
	console.log(h_number);
	console.log(h_comm);
	$("#frm").attr("action","${pageContext.request.contextPath}/h/end.do/${detail.midx}").submit();
	//window.location.href = '${pageContext.request.contextPath}/h/end.do/${sessionScope.midx}';
	
}

//모달2 닫고 전송
function closePopupAndRedirect2() {
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
	let h_name = $("#h_name").val();
	let h_no = $("#h_no").val();
	let h_number = $("#h_number").val();
	let midx = "${sessionScope.midx}"
	let h_comm = $("#h_comm").val();
	
	console.log(h_name);
	console.log(h_no);
	console.log(h_number);
	console.log(h_comm);
	$("#frm").attr("action","${pageContext.request.contextPath}/h/end.do/${detail.midx}").submit();
	//window.location.href = '${pageContext.request.contextPath}/h/end.do/${sessionScope.midx}';
	
}

function closePopup(){
	modal.classList.toggle('show');
	if (!modal.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}
//모달2 닫기
function closePopup2(){
	modal2.classList.toggle('show');
	if (!modal2.classList.contains('show')) {
		body.style.overflow = 'auto';
	}
}

function textareaIsEmpty() {
	const textarea = modal.querySelector('textarea');
	return textarea.value.trim() === '';
}
</script>
<%@ include file="../Include/Footer.jsp" %>

</body>
</html>