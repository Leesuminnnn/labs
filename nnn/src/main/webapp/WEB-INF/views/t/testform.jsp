<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		<div></div>
	</div>
</form>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</body>
</html>