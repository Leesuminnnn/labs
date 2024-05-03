<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- Web App으로 선언하여 브라우저의 UI ( URL 바 ) 를 안 보이도록 할 수 있다. -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Detailcss.css">
<title>마이 페이지</title>
</head>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
//유효성검사
$(function(){
	$("#btn").click(function(){
		let m_name = $("#m_name").val();
		let m_in = $("#m_in").val();
		let m_de = $("#m_de").val();
		let m_no = $("#m_no").val();
		let m_email = $("#m_email").val();
		
		if(m_name == ""){
			alert("이름을 확인해주세요.");
			$("#m_name").focus();
			return false;
		}else if(m_in == ""){
			alert("기관명을 확인해주세요");
			$("#m_in").focus();
			return false;
		}else if(m_de == ""){
			alert("부서명을 확인해주세요");
			$("#m_de").focus();
			return false;
		}else if(m_no == ""){
			alert("사원번호를 확인해주세요");
			$("#m_no").focus();
			return false;
		}else if(m_email == ""){
			alert("이메일을 확인해주세요");
			$("#m_email").focus();
			return false;
		}
		// insert
		$("#frm").attr("action","${pageContext.request.contextPath}/m/DetailAction.do/${detail.midx}").submit();
		
	});
	
});	
</script>
<body>
<%@ include file="../Include/Header6.jsp" %>
<section>
	<form id="frm" action="" method="post">
		<div class="container normal flex flex-center">
			<div class="content">
				
				<div>
					<div class="text">이름  </div>
					<input class="light" type="text" name="m_name" id="m_name" value="${detail.m_name}">
				</div>
				<div>
					<div class="text">기관  </div>
					<input class="light" type="text" name="m_in" id="m_in" value="${detail.m_in}">
				</div>
				<div>
					<div class="text">부서  </div>
					<input class="light" type="text" name="m_de" id="m_de" value="${detail.m_de}">
				</div>
				<div>
					<div class="text">사원번호  </div>
					<input class="light" type="text" name="m_no" id="m_no" value="${detail.m_no}">
				</div>
				<div>
					<div class="text">이메일 </div>
					<input class="light" type="email" name="m_email" id="m_email" value="${detail.m_email}" disabled="disabled">
				</div>
			</div>
		</div>
		<div class="flex flex-center">
			<button type="button" id="btn" class="btn2 light">변경</button>
		</div>
	</form>
</section>
<%@ include file="../Include/Footer.jsp" %>
</body>
</html>