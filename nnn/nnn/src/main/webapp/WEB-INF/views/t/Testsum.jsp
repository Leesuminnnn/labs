<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Writtencss.css?0415">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hwt/demoheadercss.css?after">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<title>ㄴㄴㄴㄴㄴㄴ</title>

<style>
</style>
</head>
<body style="min-width: 1280px;">
<form id="frm" name="frm" method="post" action="">
<div id="capture_area">
<div id="captureBtn" style="width: 150px; height: 60px;">
capture
</div>
</div>

</form>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script>
// document.getElementById("captureBtn").addEventListener("click", function() {
//     html2canvas(document.body).then(canvas => {
//         const imgData = canvas.toDataURL('image/png');
//         const pdf = new window.jspdf.jsPDF();  // Access jsPDF from the window object if it's not directly available
//         pdf.addImage(imgData, 'PNG', 0, 0);
//         pdf.save("download.pdf");
        
//         console.log(window.jsPDF);  // Also check on the window object
//         console.log(window.jspdf.jsPDF);  // Directly log the constructor to verify it's available
//     }).catch(error => {
//         console.error("Error capturing canvas:", error);
//     });
// });
$(document).ready(function() {
    document.getElementById("captureBtn").addEventListener("click", function() {
        html2canvas(document.getElementById("capture_area")).then(canvas => {
            const imgData = canvas.toDataURL('image/png');
            const pdf = new window.jspdf.jsPDF();  // Ensure jsPDF is correctly referenced
            pdf.addImage(imgData, 'PNG', 0, 0);

            // Convert the generated PDF to a base64 string
            const pdfBase64 = pdf.output('datauristring').split(';base64,')[1]; // Extract base64 part from the data URI

            // Send the base64 string to the server
            sendPDFToServer(pdfBase64);
        }).catch(error => {
            console.error("Error capturing canvas:", error);
        });
    });

    function sendPDFToServer(pdfBase64) {
        $.ajax({
            url: '${pageContext.request.contextPath}/save',  // Adjust this to your actual server endpoint
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ pdfData: pdfBase64 }),
            success: function(response) {
                console.log('Server received PDF:', response);
                alert('PDF uploaded successfully!');
            },
            error: function(xhr, status, error) {
                console.error('Failed to upload PDF:', error);
                alert('Failed to upload PDF. Please try again.');
            }
        });
    }
});

</script>
<script>
</script>
</html>