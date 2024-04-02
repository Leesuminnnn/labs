<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>재물조사시스템</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css?ver=0227">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=0227">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

</script>
<script src="https://unpkg.com/@zxing/library@latest"></script>
<style type="text/css">
	section {
		padding-top: 62px;	
	}
</style>
</head>
<body>
<jsp:include page="./header.jsp"></jsp:include>	
<section>
	<div class="wrap">
		<div class="scan-area">
			<div id="scanBtn">스캔</div>
		</div>
		<div class="search-area">
			<div id="searchBtn">검색</div>
		</div>
	</div>
</section>


<script type="text/javascript">	



	const codeReader = new ZXing.BrowserQRCodeReader();
	const scanButton = document.getElementById('scanBtn');
	const QRdel = document.getElementById('QRdel');
	
	
	
	scanButton.addEventListener('click', () => {
		console.log("click");
		navigator.mediaDevices.getUserMedia({ video:  { facingMode: { exact: "environment" } }} ).then((stream) => {
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
			alert(err);
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
		alert(err);
		});
	});
</script>

</body>
</html>