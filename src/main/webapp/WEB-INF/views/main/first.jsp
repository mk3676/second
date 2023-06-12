<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- Style -->
<style>
span.badge.bg-success {
	cursor:pointer;}
</style>
<!-- End Style -->

<!-- Script -->
<script>
$(document).ready(function(){
	$("span.badge.bg-success").each(function(idx){
		$(this).click(function(e){
			console.log(idx+"번째 버튼이 눌렸어요")
		})
	})
	
	$("#checkOK").click(function(){
		console.log("열람버튼이 눌렸어")
		let pwd = $(".checkOK").val()
		console.log(pwd)
	})
})
</script>
<!-- End Script -->

<!-- Page Header -->
<div class="page-header row no-gutters py-4">
  <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
    <span class="text-uppercase page-subtitle">first</span>
    <h3 class="page-title text-bold">초기 화면</h3>
  </div>
</div>
<!-- End Page Header -->

<!-- Body -->
<body>
<div class="container-fluid p-0">

	<!-- Button -->
	<div class="clearfix pl-3 pr-3">
		<div class="col-lg-4 float-right">
			<div class="card mb-3">
				<div class="card-body pt-3 pb-3">
					<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-secondary col-lg-12 mb-0 btn-lg btn-block">등 록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- List -->
	<div class="row pl-3 pr-3">
		<div class="col-12 col-lg-12 col-xxl-12 d-flex">
			<div class="card flex-fill">
				<div class="card-header pl-3">
					<h5 class="mb-0">데이터</h5>
				</div>
				
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<!-- forEach -->
						<tr class="toggle-class">
							<td>(번호)</td>
							<td>(제목)</td>
							<td>(작성자)</td>
							<td>(작성일)</td>
							<td>
								<!-- c:choose (값이 들어오는거에 따라 변경) -->
								<!-- c:when ${list == "열람가능"} -->
								<span class="badge bg-success" data-toggle="modal" data-target="#pwdModal">열람가능</span>
								<!-- c:when ${list == "수정중"} -->
								<span class="badge bg-warning">수정중</span>
								<!-- c:when ${list == "열람불가"} -->
								<span class="badge bg-danger">열람불가</span>
								<!-- End c:choose -->
							</td>
						</tr>
						<!-- End forEach -->
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-12 col-lg-12 col-xxl-12 text-center ">
			<div class="card">
				<!-- 페이징 처리  1,2,3,4,.....  -->
			</div>
		</div>
	</div>
	<!-- End List -->

</div>
</body>
<!-- End Body -->

<!-- Modal 1 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-xl">
  	<form id="insert" enctype="multipart/form-data">
	    <div class="modal-content">
	      <div class="modal-header">
	        <!-- Modal Header -->
	        <div class="page-header row no-gutters py-4">
			  <div class="col-12 col-sm-12 text-center text-sm-left mb-0">
			    <span class="text-uppercase page-subtitle">Register</span>
			    <h3 class="page-title text-bold">등록 페이지</h3>
			  </div>
			</div>
			<!-- End Modal Header -->
	      </div>
	      <div class="modal-body">
			<!-- Modal Body -->
			<div class="container-fluid p-0">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body pt-3 pb-0"> 
								<label for="name" class="col-lg-4">성명</label>
								<input type="text" class="col-lg-6" name="name" placeholder="성명">
							</div>
							<div class="card-body pt-3 pb-0">
								<label for="phone" class="col-lg-4">전화번호</label>
								<input type="tel" class="col-lg-6" name="phone" placeholder="전화번호">
							</div>
							<div class="card-body pt-3 pb-0">
								<label for="email" class="col-lg-4">이메일주소</label>
								<input type="email" class="col-lg-6" name="email" placeholder="이메일 주소">
							</div>
							<div class="card-body pt-3 pb-3">
								<label for="password" class="col-lg-4">비밀번호</label>
								<input type="password" class="col-lg-6" name="password" placeholder="비밀번호">
							</div>
						</div>
						<div class="card">
							<div class="card-body pt-3 pb-0">
								<label for="uploadFile" class="col-lg-3"><b>파일첨부</b></label>
								<input type="file" class="col-lg-8" name="file[]" multiple>
								<span class="col-lg-12">파일첨부시 확장자가 'tilt'인 것과</span><br>
								<span class="col-lg-12">아닌 것 으로 구분하세요</span>
								<div class="uploadResult" id="uploadResult">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Modal Body -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="submitButton">등록</button>
	      </div>
	    </div>
    </form>
  </div>
</div>
<!-- End Modal 1 -->

<!-- Modal 2 -->
<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-xl">
  	<form id="pwdCheck">
	    <div class="modal-content">
	      <div class="modal-header">
	        <!-- Modal Header -->
	        <div class="page-header row no-gutters py-4">
			  <div class="col-12 col-sm-12 text-center text-sm-left mb-0">
			    <span class="text-uppercase page-subtitle">Password</span>
			    <h3 class="page-title text-bold">비밀번호 확인</h3>
			  </div>
			</div>
			<!-- End Modal Header -->
	      </div>
	      <div class="modal-body">
			<!-- Modal Body -->
			<div class="container-fluid p-0">
				<div class="row">
					<div class="col-lg-12 align-center">
						<label for="password" class="col-lg-3">비밀번호</label>
						<input type="password" class="col-lg-6 checkOK" name="password" placeholder="비밀번호">
						<button type="button" class="btn btn-primary col-lg-2" id="checkOK">열람</button>
					</div>
				</div>
			</div>
			<!-- End Modal Body -->
	      </div>
	    </div>
    </form>
  </div>
</div>
<!-- End Modal 2 -->

<%@ include file="../include/footer.jsp" %>