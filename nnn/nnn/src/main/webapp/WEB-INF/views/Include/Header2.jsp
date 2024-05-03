<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function goBack() {
	window.history.back();
}
</script>
<div class="header2">
	<div class="img_box" onclick="location.href='${pageContext.request.contextPath}/h/Main.do'">
		<img src="${pageContext.request.contextPath}/resources/icon/arrow2.png">
	</div>
	<div class="con">
		<span style="" class="bold">식사수발</span>
	</div>
</div>
<style>
/*  식사수발 top css  */
.header2{
	font-size: 40pt;
	text-align: center;
	display: flex;
	align-items: center;		/* 세로 가운데 정렬 */
	border-bottom: 1px solid #e3e3e3;
	background-color: #ffffff;
	padding-top: 5px;
	padding-bottom: 5px;
	height: 150px;
	position : fixed;	/* 이 부분을 고정 */
	top : 0;			/* 하단에 여백 없이 */
	width: 100vw;
	transition: top 0.2s ease-in-out;
	z-index: 99;
}
.img_box{
	margin-left: 32px;
	flex-grow: 0;
	align-items: center;
	display: flex;
	z-index: 1;
}
.header2 > span{
	color: #2f2f2f;
}
.con{
	display: flex; /* flexbox 적용 */
	align-items: center; /* 세로 가운데 정렬 */
	justify-content: center; /* 가로 가운데 정렬 */
	flex-grow: 1;
	margin-left: -68px;
}
/**/
</style>

