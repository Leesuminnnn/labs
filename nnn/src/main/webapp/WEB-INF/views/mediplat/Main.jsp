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
<title>MediPlat</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mediplat_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demoheadercss.css?ver=0226">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/resources/favicon/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>	
	<div class="info">
		<div class="info-container">
			<div class="info_name">
				<span class="normal">
					<c:set var="infofirstName" value="${fn:substring(info.name, 0, 1)}" />
					${infofirstName}ㅇㅇ
				</span>
				<span class="light info_id">(사원번호 : ${info.id })</span>
			</div>
			<div class="info_hs light">
				<span>${info.hspt_name} / ${info.hspt_subname } / ${info.hspt_position }</span>
			</div>
			<div class="info_date light">
				<span>입사일자 : <fmt:formatDate var="date" value="${info.reg_date }" pattern="yyyy. MM. dd" />${date}</span>
			</div>
		</div>
	</div>
<div class="main">
	<div class="main_platform" style="font-size: 2rem; color: #0A4B73; font-weight: bold; padding: 10px;">
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
			<div style="border-top: 1px solid #000;"></div>
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
	else if (menu_id ==423){
		link = "${pageContext.request.contextPath}/a/Calendar.do";
		
		location.href = link;
	}
	else if(menu_id == 731) {
		if(name == '관리자'){
			link = "${pageContext.request.contextPath}/demo/admin";
		}
		else {
			link = "${pageContext.request.contextPath}/demo/Info/"+idx;
		}
		location.href = link;
	}
	else if (menu_id == 213) {
		link = "${pageContext.request.contextPath}/hwt/CounselList.do";
		location.href = link;
	}
}
</script>
</body>
</html>