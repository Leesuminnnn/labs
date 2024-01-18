<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" >
<title>메인페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
}
.main_content {
	margin-top: 10px;
	padding: 15px;
	border: 1px solid #000;
	margin-right: 10px;
	width: 250px;
	height: 73px;
	text-align: center;
	display:flex;
	align-items: center;
	justify-content: center; 
	font-size: 22px;
	cursor: pointer;
}
.menu_content {
	margin-top: 10px;
	padding: 15px;
	border: 1px solid #000;
	margin-right: 10px;
	height: 73px;
	display:flex;
	justify-content: center;
	align-items: center; 
	width: 100%;
	font-size: 17px;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="logo_area" style="display: flex; justify-content: space-around;">
	<div class="logo">코어솔루션 로고</div>
	<div class="main_logo">메디플랫</div>
	<div class="login">
	기관명 : ${info.hspt_name}<br>
	사번 : ${info.id }<br>
	이름 : ${info.name }
	<a href="${pageContext.request.contextPath}/demo/Logout">로그아웃</a></div>
</div>
<div class="main">
	<div class="main_platform">
		<div>MEDIPLAT</div>
		<div>CORESOLUTION MEDICAL WORK PLATFORM</div>
	</div>
	<div class="main_area">
		<div>
			<div style="border-top: 1px solid #ddd; display: flex; ">
				<c:forEach items="${title }" var="t">
					<div class="main_content" style=" background-color: ${t.col3}; color:${t.col4}; border-color: ${t.col3}" onclick="menu_go(this)" data-menu="${t.idx}">
						${t.col1 }<br>
						${t.col2 }
					</div>
				</c:forEach>
			</div>
			<div style="border-top: 1px solid #000; margin-top: 10px;"></div>
			<div style="display: flex;">
				<div style="margin-right: 10px; width: 250px;text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 1 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 2 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 3 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 4 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 5 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 6 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m" varStatus="">
						<c:if test="${m.title_idx eq 7 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="margin-right: 10px; width: 250px; text-align: center; display: flex; align-items: flex-start; justify-content: flex-start; flex-direction: column;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 8 }">
							<div class="menu_content" style="background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}" onclick="menu_go(this)" data-menu="${m.title_idx}${m.idx}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				
				
			</div>
			
		</div>
		
		<%-- 
		
		<div>
			<c:forEach items="${menu }" var="m">
				${m }
			</c:forEach>
		</div> 
		
		--%>
	</div>
</div>
<script>
var link = "";
var idx = "${info.idx}";
var name = "${info.name}";
function menu_go(element) {
	var menu_id = element.getAttribute("data-menu");
	if(menu_id == 1) {
		link = "${pageContext.request.contextPath}/t/CoreHospital2";

		location.href = link;
	}
	else if (menu_id ==422){
		link = "${pageContext.request.contextPath}/a/Calendar.do";
		
		location.href = link;
	}
	else if(menu_id == 730) {
		if(name == '관리자'){
			link = "${pageContext.request.contextPath}/demo/admin";
		}
		else {
			link = "${pageContext.request.contextPath}/demo/Info/"+idx;
		}
		location.href = link;
	}
}
</script>
</body>
</html>