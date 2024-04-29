<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<title>WrittenView</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.7.570/pdf.min.js"></script>
<script>
<%-- 
<img src="${pageContext.request.contextPath}/resources/icon/arrow2.png" style="position: absolute; top: 10px; left: 10px;">
<img src="data:image/png;base64,${imageData}" alt="image">
 --%>

</script>
</head>
<body>
<%-- <canvas id="pdfViewer"></canvas> --%>
<!-- <script> -->
<%-- // var url = '${pageContext.request.contextPath}/hwt/WrittenViewimage/${cs_idx}'; // 서버에서 PDF를 제공하는 URL --%>
<!-- // pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.7.570/pdf.worker.min.js'; -->
<!-- // var loadingTask = pdfjsLib.getDocument(url); -->
<!-- // loadingTask.promise.then(function(pdf) { -->
<!-- //     console.log('PDF 로드됨'); -->

<!-- //     // 첫 번째 페이지 가져오기 -->
<!-- //     pdf.getPage(1).then(function(page) { -->
<!-- //         var scale = 1.5; -->
<!-- //         var viewport = page.getViewport({scale: scale}); -->

<!-- //         // canvas 요소와 렌더링 컨텍스트 준비 -->
<!-- //         var canvas = document.getElementById('pdfViewer'); -->
<!-- //         var context = canvas.getContext('2d'); -->
<!-- //         canvas.height = viewport.height; -->
<!-- //         canvas.width = viewport.width; -->

<!-- //         // 페이지 렌더링 -->
<!-- //         var renderContext = { -->
<!-- //             canvasContext: context, -->
<!-- //             viewport: viewport -->
<!-- //         }; -->
<!-- //         page.render(renderContext); -->
<!-- //     }); -->
<!-- // }, function(reason) { -->
<!-- //     console.error(reason); -->
<!-- // }); -->
<!-- </script> -->

</body>
</html>