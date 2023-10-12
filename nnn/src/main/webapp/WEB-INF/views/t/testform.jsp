<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/testformcss.css">
<title>설문조사</title>
</head>
<body>
<form>
	<div class="header">
	
	</div>
	<div class="section">
		<div class="container">
			<div class="progress">
				<progress id="progress" value="0" min="0" max="100"></progress>
			</div>
			<div class="area">
				<p>Q1. 질문이 들어갑니다.</p>
				<p>
					<label><input type="radio" name="q1" value=""/>답변 1</label>
					<label><input type="radio" name="q1" value=""/>답변 2</label>
					<label><input type="radio" name="q1" value=""/>답변 3</label>
				</p>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="nav">
			<div class="prev">&lt;</div>
			<div class="next">&gt;</div>
		</div>
	</div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
var next = document.querySelector(".next");
var prev = document.querySelector(".prev");
var progress = document.querySelector("#progress");

next.addEventListener("click", NextPage);
prev.addEventListener("click", PrevPage)
function NextPage() {
	progress.value = progress.value + 10;
	console.log(progress.value);
}

function PrevPage() {
	progress.value = progress.value - 10;
	console.log(progress.value);
}
</script>	
</body>
</html>