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
</head>
<body>
<div class="logo_area">
	<div class="logo"></div>
	<div class="main_logo">메디플랫</div>
	<div class="login"></div>
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
					<div style=" margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; width: 250px; height: 43px; text-align: center; display:flex; align-items: center; justify-content: center; background-color: ${t.col3}; color:${t.col4}; border-color: ${t.col3}">
						${t.col1 }<br>
						${t.col2 }
					</div>
				</c:forEach>
			</div>
			<div style="border-top: 1px solid #000; margin-top: 10px;"></div>
			<div style="display: flex;">
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 1 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 2 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 3 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 4 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 5 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 6 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 7 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
								${m.col1 }<br>
								${m.col2 }
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div style="width: 250px; text-align: center;">
					<c:forEach items="${menu }" var="m">
						<c:if test="${m.title_idx eq 8 }">
							<div style="margin-top: 10px; padding: 15px; border: 1px solid #000; margin-right: 10px; height: 43px; display:flex; justify-content: center; align-items: center; background-color: ${m.col3}; color:${m.col4}; border-color: ${m.col3}">
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

</body>
</html>