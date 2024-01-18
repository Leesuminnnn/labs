<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Ambulance</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/amb2css.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<style type="text/css">
	
	</style>
</head>
<body>
	<!-- Button trigger modal --><!-- 
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Launch static backdrop modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">앰뷸런스 운행 예약 요청서</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="initModal('insertModal')"></button>
      </div>
      <div class="modal-body">
			<label for="">운행구분:</label><br>
			<div class="">
				<div class="row mb-1">
					<label class="col form-check-label">
						<input type="radio" onclick="runselect(event)" class="form-check-input" name="run" value="입원" >
						<span class="form-text">
							입원
						</span>
					</label> 
					<label class="col form-check-label">
						<input type="radio" onclick="runselect(event)" class="form-check-input" name="run" value="외진">
						<span class="form-text">
							외진
						</span>
					</label> 
					<label class="col form-check-label">
						<input type="radio" onclick="runselect(event)" class="form-check-input" name="run" value="전원(응급)">
						<span class="form-text">
							전원(응급)
						</span>
					</label> 
					<label class="col form-check-label">
						<input type="radio" onclick="runselect(event)" class="form-check-input" name="run" value="혈액원">
						<span class="form-text">
							혈액원
						</span>
					</label>
				</div>
				
				<div class="form-check d-flex justify-content-md-center align-items-center">
					<label class="form-check-label">
						<input type="radio" onclick="runselect(event)" class="form-check-input" value="Other" id="other" name="run" >
						<span class="form-text">Other&nbsp;</span>
					</label>
					<input type="text" class="form-control" name="RunotherInput" id="RunotherInput"  value="" onchange="runchange()" disabled="disabled">
				</div>
				<!-- <input type="text" class="form-control" name="Runhidden" id="Runhidden" value="">  -->
			</div>
			<label for="">기관선택:</label><br>
			<div class="form-inline">
			<div class="row mb-1">
				<label class="col mr-2">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" value="전북대학교병원">
					<span class="form-text">
						전북대학교병원
					</span>
				</label> 
				<label class="col mr-2">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" value="예수병원">
					<span class="form-text">
						예수병원
					</span>
				</label> 
				<label class="col mr-2">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" value="대자인병원">
					<span class="form-text">
						대자인병원
					</span>
				</label> 
			</div>
			<div class="row mb-1">
				<label class="col mr-2">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" value="전주병원">
					<span class="form-text">
						전주병원
					</span>
				</label> 
				<label class="col mr-2">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" value="호성전주병원">
					<span class="form-text">
						호성전주병원
					</span>
				</label> 
				<label class="col mr-2">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" value="혈액원">
					<span class="form-text">
						혈액원
					</span>
				</label>
			</div>
			
			<div class="form-check d-flex justify-content-md-center align-items-center">
				<label class="form-check-label">
					<input type="radio" onclick="agencyselect(event)" class="form-check-input" name="agency" id="agencyOther" value="Other">
					<span class="form-text">Other&nbsp;</span>
				</label>
				<input type="text" class="form-control" name="agencyInput" id="AgencyotherInput" onchange="agencychange()" disabled="disabled">
			</div>
			</div>
			<label for="">준비사항:</label><br>
			<label class="mr-2">
				<input type="checkbox" class="form-check-input" name="prepare" id="checkbox1" value="산소">
				<span class="form-text">
					산소
				</span>
			</label> 
			<label class="mr-2">
				<input type="checkbox" class="form-check-input" name="prepare" id="checkbox2" value="석션">
					<span class="form-text">
						석션
					</span>
			</label> 
			<label class="mr-2">
				<input type="checkbox" class="form-check-input" name="prepare" id="checkbox3" value="환의">
					<span class="form-text">
						환의
					</span>
				</label> 
			
<div class="form-check d-flex justify-content-md-center align-items-center">
	<label class="form-check-label">
		<input type="checkbox" class="form-check-input" name="prepare" id="checkbox4" value="기타">
		<span class="form-text">
			Other&nbsp;
		</span>
	</label>
	<input type="text" class="form-control" name="prepareInput" id="prepareInput">
</div>
		  <div class="form-group">
			<label for="">환자 정보를 입력해 주세요</label><br>
			<div>
			<label>환자 이름
			<input type="text" class="form-control" name="patientName" id="patientName" value="김환자" ></label> 
			<label>병실
			<input type="text" class="form-control" name="patientRoom" id="patientRoom" value="101호" ></label> 
			<label>연락처
			<input type="text" class="form-control" name="patientNumber" id="patientNumber" value="010-5678-1234" placeholder="예) 010-1234-5678" ></label>
			</div> 
		  </div>
          <br>
          <div class="form-group">
			<label for="title">일정제목:</label>
			<input type="text" class="form-control" value="엠뷸런스예약" id="title">
		  </div>
		  <div class="form-group">
			<label for="content">주의사항 및 특이사항:</label>
			<textarea class="form-control" id="content">낙상주의</textarea>
		  </div>
		  <div class="form-group">
			<label for="start">출발시간:</label>
			<select class="form-control" id="start" onchange="startChange()">
				<option value="" selected>출발시간을 선택해 주세요.</option>
				<option value="09:00">09:00</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
			</select>
		  </div><%-- 
		  <c:forEach items="${list }" var="l">
		  	${fn:substring(l.start,0,10) }
		  </c:forEach> --%>
		   <div class="form-group">
			<label for="end">종료시간:</label>
			<select class="form-control" id="end">
				<option value="" selected>종료시간을 선택해 주세요.</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
				<option value="19:00">19:00</option>
			</select>
		  </div>
		  <div class="form-group">
		  	<label for="">요청(예약)자 이름 및 부서</label>
		  	<input type="text" class="form-control" value="${name }" id="writer" readonly="readonly">
		  </div>
		  <div class="form-group">
		  	<div><label for="">요청 부서 선택</label></div>
		  	<div class="form-check row justify-content-md-center">
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="2병동" name="a"> 
					<span id="" class="form-text">
						2병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="3병동" name="a"> 
					<span id="" class="form-text">
						3병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="4병동" name="a"> 
					<span id="" class="form-text">
						4병동
					</span>
				</label>
			</div>
			
			<div class="form-check row justify-content-md-center">
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="5병동" name="a"> 
					<span id="" class="form-text">
						5병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="6병동" name="a"> 
					<span id="" class="form-text">
						6병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="7병동" name="a"> 
					<span id="" class="form-text">
						7병동
					</span>
				</label>
			</div>
			
			<div class="form-check row justify-content-md-center">
				
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="8병동" name="a"> 
					<span id="" class="form-text">
						8병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="9병동" name="a"> 
					<span id="" class="form-text">
						9병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="10병동" name="a"> 
					<span id="" class="form-text">
						10병동
					</span>
				</label>
			</div>
			
			<div class="form-check row justify-content-md-center">
				
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="11병동" name="a">
					<span id="" class="form-text">
						11병동
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="외래" name="a">
					<span id="" class="form-text">
						외래 
					</span>
				</label>
				<label class="form-check-label col col-sm-3">
					<input type="radio" class="form-check-input" value="원무부" name="a"> 
					<span id="" class="form-text">
						원무부 
					</span>
					
				</label>
			</div>
			
			<div class="form-check row justify-content-md-center align-items-center">
				
				<label class="form-check-label col col-auto">
					<input type="radio" class="form-check-input" value="임상병리실" name="a">
					<span id="" class="form-text">
						임상병리실 
					</span>
				</label>
			</div>
			<div class="form-check d-flex justify-content-md-center align-items-center">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" value="Other" name="a">
					<span class="form-text">Other&nbsp;</span>
				</label>
				<input type="text" class="form-control">
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
        <button type="button" class="btn btn-dark  float-right deleteBtn" onclick="deleteSch('insertModal', g_arg)">삭제</button>
		  <button type="button" class="btn btn-warning float-right insertBtn" onclick="insertSch('insertModal', g_arg)">등록</button>
      </div>
    </div>
  </div>
</div>
</div>
<!--  -->
	<!-- 메뉴바 st-->
<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item" role="presentation">
		<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">켈린더 VIEW</button>
	</li>
	<li class="nav-item" role="presentation">
		<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">구급차 운행 신청 리스트</button>
	</li>
	<li class="nav-item" role="presentation">
		<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>
	</li>
</ul>
<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	
	<!-- insertModal -->
  <div class="modal fade insertModal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">앰뷸런스 운행 예약 요청서</h4>
          <button type="button" class="close" onclick="initModal('insertModal')">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
     	  <div class="form-group">
			<label for="">운행구분:</label><br>
			<div class="form-inline">
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="입원" style="height: 100%;">입원</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="외진"style="height: 100%;">외진</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="전원(응급)"style="height: 100%;">전원(응급)</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" name="run" value="혈액원"style="height: 100%;">혈액원</label> 
				<label class="mr-2">
				<input type="radio" onclick="runselect(event)" class="form-control" id="other" name="run" value="Other"style="height: 100%;">Other&nbsp;
				<input type="text" class="form-control" name="RunotherInput" id="RunotherInput"  value="" onchange="runchange()" disabled="disabled"></label>
				<!-- <input type="text" class="form-control" name="Runhidden" id="Runhidden" value="">  -->
			</div>
		  </div>
		  <div class="form-group">
			<label for="">기관선택:</label><br>
			<div class="form-inline">
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="전북대학교병원" style="height: 100%;">전북대학교병원</label> 
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="예수병원"style="height: 100%;">예수병원</label> 
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="대자인병원"style="height: 100%;">대자인병원</label> 
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="전주병원"style="height: 100%;">전주병원</label> 
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="호성전주병원"style="height: 100%;">호성전주병원</label> 
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" value="혈액원"style="height: 100%;" >혈액원</label> <br>
			<label class=" form-check-label">
			<input type="radio" onclick="agencyselect(event)" class="form-control" name="agency" id="agencyOther" value="Other" style="height: 100%;">Other&nbsp;
			<input type="text" class="form-control" name="agencyInput" id="AgencyotherInput" onchange="agencychange()" disabled="disabled"></label> <br>
			</div>
		  </div>
		  <div class="form-group">
			<label for="">준비사항:</label><br>
			<div class="form-inline">
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox1" value="산소" style="height: 100%;">산소</label> 
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox2" value="석션"style="height: 100%;">석션</label> 
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox3" value="환의"style="height: 100%;">환의</label> 
			<label class="mr-2">
			<input type="checkbox" class="form-control" name="prepare" id="checkbox4" value="기타"style="height: 100%;">기타
			<input type="text" class="form-control" name="prepareInput" id="prepareInput" style="display:none;">
			</label> 
		  	</div>
		  </div>
		  <div class="form-group">
			<label for="">환자 정보를 입력해 주세요</label><br>
			<div>
			<label>환자 이름
			<input type="text" class="form-control" name="patientName" id="patientName" value="김환자" style="height: 100%;"></label> 
			<label>병실
			<input type="text" class="form-control" name="patientRoom" id="patientRoom" value="101호" style="height: 100%;"></label> 
			<label>연락처
			<input type="text" class="form-control" name="patientNumber" id="patientNumber" value="010-5678-1234" placeholder="예) 010-1234-5678" style="height: 100%;"></label>
			</div> 
		  </div>
          <br>
          <div class="form-group">
			<label for="title">일정제목:</label>
			<input type="text" class="form-control" value="엠뷸런스예약" id="title">
		  </div>
		  <div class="form-group">
			<label for="content">주의사항 및 특이사항:</label>
			<textarea class="form-control" id="content">낙상주의</textarea>
		  </div>
		  <div class="form-group">
			<label for="start">출발시간:</label>
			<select class="form-control" id="start" onchange="startChange()">
				<option value="" selected>출발시간을 선택해 주세요.</option>
				<option value="09:00">09:00</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
			</select>
		  </div><%-- 
		  <c:forEach items="${list }" var="l">
		  	${fn:substring(l.start,0,10) }
		  </c:forEach> --%>
		   <div class="form-group">
			<label for="end">종료시간:</label>
			<select class="form-control" id="end">
				<option value="" selected>종료시간을 선택해 주세요.</option>
				<option value="09:30">09:30</option>
				<option value="10:00">10:00</option>
				<option value="10:30">10:30</option>
				<option value="11:00">11:00</option>
				<option value="11:30">11:30</option>
				<option value="12:00">12:00</option>
				<option value="12:30">12:30</option>
				<option value="13:00">13:00</option>
				<option value="13:30">13:30</option>
				<option value="14:00">14:00</option>
				<option value="14:30">14:30</option>
				<option value="15:00">15:00</option>
				<option value="15:30">15:30</option>
				<option value="16:00">16:00</option>
				<option value="16:30">16:30</option>
				<option value="17:00">17:00</option>
				<option value="17:30">17:30</option>
				<option value="18:00">18:00</option>
				<option value="18:30">18:30</option>
				<option value="19:00">19:00</option>
			</select>
		  </div>
		  <div class="form-group">
		  	<label for="">요청(예약)자 이름 및 부서</label>
		  	<input type="text" class="form-control" value="${name }" id="writer" readonly="readonly">
		  </div>
		  <div class="form-group">
		  	<div><label for="">요청 부서 선택</label></div>
		  	<div class="row-sm-12 form-check">
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="2병동" name="a">2병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="3병동" name="a">3병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="4병동" name="a">4병동 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="5병동" name="a">5병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="6병동" name="a">6병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="7병동" name="a">7병동 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="8병동" name="a">8병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="9병동" name="a">9병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="10병동" name="a">10병동 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="11병동" name="a">11병동 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="외래" name="a">외래 
				</label>
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="원무부" name="a">원무부 
				</label>
				
				<label class="form-check-label col-sm-3">
					<input type="radio" class="form-check-input" value="임상병리실" name="a">임상병리실 
				</label>
				<label class="form-check-label col-sm-7">
					<input type="radio" class="form-check-input" value="Other" name="a">Other 
					<input type="text" class="form-control">
				</label>
			</div>
			<br>
		  </div>
		  <!-- 
		  <div class="form-group">
			  <label for="allDay">종일여부:</label>
			  <div class="form-check">
				<label class="form-check-label">
					<input type="radio" class="form-check-input" value="true" name="allDay">예
				</label>
			  </div>
		
			  <div class="form-check">
				<label class="form-check-label">
					<input type="radio" checked="checked" class="form-check-input" value="false" name="allDay">아니오
				</label>
			  </div>
			</div>
			 -->
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
        <!-- 
		  <button type="button" class="btn btn-success approvalBtn" onclick="approvalSch('insertModal',g_arg)">승인</button>
		  <button type="button" class="btn btn-danger rejectBtn" onclick="rejectSch('insertModal', g_arg)">반려</button>
		   -->
		  <button type="button" class="btn btn-dark  float-right deleteBtn" onclick="deleteSch('insertModal', g_arg)">삭제</button>
		  <button type="button" class="btn btn-warning float-right insertBtn" onclick="insertSch('insertModal', g_arg)">등록</button>
        </div>
        
      </div>
    </div>
  </div>
	
		<!-- 모달 ed -->
	
		<div class="calendar_area">
			<div class="calendar">
		        <div class="header">
		            <div class="year-month"></div>
		            <div class="month_nav">
						<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
						<button class="nav-btn go-today" onclick="goToday()">Today</button>
						<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
		            </div>
		        </div>
		        <div class="main">
		            <div class="days">
		                <div class="day">일</div>
		                <div class="day">월</div>
		                <div class="day">화</div>
		                <div class="day">수</div>
		                <div class="day">목</div>
		                <div class="day">금</div>
		                <div class="day">토</div>
		            </div>
		            <div class="dates"></div>
		        </div>
		    </div>
		</div>
	</div>
	<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
</div>
	<!-- 메뉴바 end -->
	
    
    
</body>
<script>

let date = new Date();

const renderCalendar = () => {
	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth();
	plusmonth = viewMonth+1;
// 	console.log(plusmonth);
// 	console.log(viewMonth+1);
	// year-month 채우기
	document.querySelector('.year-month').textContent = viewYear+'년 '+ plusmonth +'월';

	// 지난 달 마지막 Date, 이번 달 마지막 Date
	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, plusmonth, 0);
	
	const PLDate = prevLast.getDate();
	const PLDay = prevLast.getDay();
	
	const TLDate = thisLast.getDate();
	const TLDay = thisLast.getDay();
	
	// Dates 기본 배열들
	const prevDates = [];
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	const nextDates = [];
	
	// prevDates 계산
	if (PLDay !== 6) {
		for (let i = 0; i < PLDay + 1; i++) {
			prevDates.unshift(PLDate - i);
		}
	}
	
	// nextDates 계산
	for (let i = 1; i < 7 - TLDay; i++) {
		nextDates.push(i)
	}
	
	// Dates 합치기
	const dates = prevDates.concat(thisDates, nextDates);
	
	// Dates 정리
	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);
	dates.forEach((date, i) => {
		const condition = i >= firstDateIndex && i < lastDateIndex + 1
		? 'this'
		: 'other';
		dates[i] = '<div class="date" data-year="'+viewYear+'" data-date="'+date+'" data-month="'+plusmonth+'" onclick="reservation(this)" data-bs-toggle="modal" data-bs-target="#staticBackdrop" ><span class="'+condition+'">'+date+'</span><div class="date_text '+condition+'">▶09:00 ~ 10:00<br>전원(응급) 전북대학교</div></div>';
	})
	
	// Dates 그리기
	document.querySelector('.dates').innerHTML = dates.join('');
	
	// 오늘 날짜 그리기
	const today = new Date();
	if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
		for (let date of document.querySelectorAll('.this')) {
			if (+date.innerText === today.getDate()) {
				date.classList.add('today');
				break;
			}
		}
	}
}

renderCalendar();

const prevMonth = () => {
	date.setDate(1);
	date.setMonth(date.getMonth() - 1);
	renderCalendar();
}

const nextMonth = () => {
	date.setDate(1);
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
}

const goToday = () => {
	date = new Date();
	renderCalendar();
}




//모달초기화
function initModal(modal){
	
//	var run = $('.modal .' + modal + ' input[name="run"]:checked').val();
	
	var runCheckbox = $('.modal .' + modal + ' input[name="run"]:checked');
	var agencyCheckbox = $('.modal .' + modal + ' input[name="agency"]:checked');
	var prepareCheckbox = $('.modal .' + modal + ' input[name="prepare"]:checked');

	
	var runValue = runCheckbox.val();
	var agencyValue = agencyCheckbox.val();
	var prepareValue = prepareCheckbox.val();
	console.log(runValue);
	console.log(agencyValue);
	console.log(prepareValue);
	var t = document.querySelector(".modal-title");
	var tv = t.innerHTML
	var text = "앰뷸런스 운행 예약 요청서";
	t.innerHTML = text;
	console.log(t.innerHTML);
//	var agency = $('.modal .' + modal + ' input[name="agency"]:checked').val();
//	var prepare = $('.modal .' + modal + ' input[name="prepare"]:checked').val();
	$('.'+modal+' #title').val('');
	$('.'+modal+' #content').val('');
	
	$("input:radio[name='run']").prop('checked', false);
	$("input:radio[name='agency']").prop('checked', false);
	$("input:checkbox[name='prepare']").prop('checked', false);
	
	$('.'+modal+' #patientName').val('');
	$('.'+modal+' #patientRoom').val('');
	$('.'+modal+' #patientNumber').val('');
	$('.'+modal+' #start').val('');
	$('.'+modal+' #end').val('');
	$('.'+modal+' #allDay').val('0');
	$('.'+modal+' input[name="allDay"]').val(['false']);
	$('.'+modal).modal('hide');
	
}

var run = "";
var agency = "";
var runhidden = $("#Runhidden").val();
var prepare = "";
//모든 체크박스에 대한 이벤트 리스너 등록
var checkboxes = document.getElementsByName("prepare");
for (var i = 0; i < checkboxes.length; i++) {
	checkboxes[i].addEventListener("change", updateSelectedValues);
}

//input 요소에 이벤트 리스너 추가
document.getElementById("prepareInput").addEventListener("input", updateSelectedValues);

//선택된 값을 저장할 배열
var selectedValues = [];

//선택된 값을 업데이트하는 함수
function updateSelectedValues() {
selectedValues = [];

// 각 체크박스의 상태를 확인하여 선택된 값을 배열에 추가
for (var i = 0; i < checkboxes.length; i++) {
	if (checkboxes[i].checked && checkboxes[i].value !== "기타") {
		selectedValues.push(checkboxes[i].value);
	}
}

// 기타 체크박스가 선택된 경우, 입력된 텍스트 값을 가져와서 추가
var inputText = document.getElementById("prepareInput").value;
if (checkbox4.checked && inputText.trim() !== "") {
 selectedValues.push(inputText);
}

// 선택된 값을 문자열로 만들어 변수에 저장
var selectedValuesString = selectedValues.join(', ');

// 변수에 저장된 값을 사용하거나 출력
console.log(selectedValuesString);
prepare = selectedValuesString;
}


// 체크박스 상태가 변경될 때마다 updateSelectedValues 함수 호출
document.getElementById("checkbox1").addEventListener("change", updateSelectedValues);
document.getElementById("checkbox2").addEventListener("change", updateSelectedValues);
document.getElementById("checkbox3").addEventListener("change", updateSelectedValues);
document.getElementById("checkbox4").addEventListener("change", updateSelectedValues);


var runInput = document.getElementById('RunotherInput');
var agencyInput = document.getElementById('AgencyotherInput');
var runotherRadio = document.getElementById('other');
var agencyRadio = document.getElementById('agencyOther');

// radio value 가져오기
function runselect(event){
	var selectedValue = event.target.value;
	var otherselect = document.getElementById('other');
  
	run = selectedValue;
	console.log(run);		// other
	console.log(runInput.value);
	if (selectedValue === 'Other') {
		runInput.removeAttribute('disabled');
		var inputValue = runInput.value;
		console.log(inputValue);
		otherselect.value = inputValue;
		console.log(otherselect.value);
		$("#RunotherInput").on("propertychange change keyup paste input", function(){
			console.log("   "+otherselect.value);
		});
	} else {
		runInput.setAttribute('disabled', 'disabled');
		runInput.value = "";
	}
	otherselect.value = "Other";
}
function agencyselect(event){
	var selectedValue = event.target.value;
	var otherselect = document.getElementById('agencyOther');
	
	agency = selectedValue;
	
	if (selectedValue === 'Other') {
	agencyInput.removeAttribute('disabled');
	var inputValue = AgencyotherInput.value;
	console.log(inputValue);
	otherselect.value = inputValue;
	console.log(otherselect.value);
	$("#AgencyotherInput").on("propertychange change keyup paste input", function(){
		console.log("   "+otherselect.value);
	});
	}else{
		agencyInput.setAttribute('disabled', 'disabled');
		agencyInput.value = "";
	}
	otherselect.value = "Other";

}

function runchange(){
	let value = $('#RunotherInput').val();
	console.log(value);
	run = value;
	var title = document.getElementById("title");
	/* run.on("propertychange change paste input", function() {
		title.value = run;  
	}); */
}
	
function agencychange(){
	let value = $('#AgencyotherInput').val();
	console.log(value);
	agency = value;
}
function reservation(element) {
	// data태그를 이용해 현재 클릭한 날짜를 가져온다.
	var clickYear = element.getAttribute("data-year");
	var clickMonth = element.getAttribute("data-month");
	var clickDate = element.getAttribute("data-date");
	
	console.log(clickYear+"년 "+clickMonth+"월 "+clickDate+"일");
	var t = document.querySelector(".modal-title");
	var tv = t.innerHTML
	t.innerHTML = clickMonth+"월 "+clickDate+"일 엠뷸런스 운행 예약 요청서"
	
	$('.insertModal').modal({backdrop: 'static'});
	console.log("모달창 오픈");
	$('.insertModal #title').focus();
}

</script>
</html>