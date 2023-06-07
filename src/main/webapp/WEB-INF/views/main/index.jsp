<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- Script -->
<script>
$(document).ready(function(){
	$('button[id^=myButton]').each(function(){
		$(this).click(function() {
		    $(this).toggleClass('btn-dark');
		});
	});
	
	$('#register').click(function(){
		$('.modal').modal('show')
	})
})
</script>
<!-- End Script -->

<!-- Page Header -->
<div class="page-header row no-gutters py-4">
  <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
    <span class="text-uppercase page-subtitle">Dashboard</span>
    <h3 class="page-title text-bold">메인 페이지</h3> 
    
  </div>
  <button type="button" id="register" class="btn btn-secondary">등록</button>
</div>
<!-- End Page Header -->

<!-- Body -->
<body class="h-100">
	<div class="container-fluid">
		<div class="main-content-container container-fluid px-4">
			<div class="row">
				<!-- Chart Stats -->
				<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
					<div class="card card-small">
						<div class="card-header border-bottom">
							<h5 class="m-0">차트</h5>
						</div>
						<div class="card-body pt-0">
							<div class="row border-bottom py-2 bg-light">
								<div class="col-12 col-sm-6">
									<div id="blog-overview-date-range" class="input-daterange input-group input-group-sm my-auto ml-auto mr-auto ml-sm-auto mr-sm-0" style="max-width: 350px;">
										<input type="text" class="input-sm form-control" name="start" placeholder="Start Date" id="blog-overview-date-range-1">
										<input type="text" class="input-sm form-control" name="end" placeholder="End Date" id="blog-overview-date-range-2">
										<span class="input-group-append">
											<span class="input-group-text">
												<i class="material-icons"></i>
											</span>
										</span>
									</div>
								</div>
							</div>
							<canvas height="130" style="max-width: 100% !important;" class="blog-overview-users"></canvas>
						</div>
					</div>
				</div>
				<!-- End Chart Stats -->
				
        		<!-- Button -->
        		<div class="col-12 col-lg-4">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">버튼</h5>
						</div>
						<div class="card-body">
							<h6 class="card-subtitle mb-2 text-muted">테스트</h6>
							<div class="mb-4" role="group" aria-label="Small button group">
								<button type="button" class="btn" id="myButton">첫번째</button>
								<button type="button" class="btn" id="myButton">두번째</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Button -->
				
				<!-- List -->
				<div class="row">
					<div class="col-12 col-lg-12 col-xxl-12 d-flex">
						<div class="card flex-fill">
							<div class="card-header">
					
								<h5 class="card-title mb-0">데이터</h5>
							</div>
							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>Name</th>
										<th class="d-none d-xl-table-cell">Start Date</th>
										<th class="d-none d-xl-table-cell">End Date</th>
										<th>Status</th>
										<th class="d-none d-md-table-cell">Assignee</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Project Apollo</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-success">Done</span></td>
										<td class="d-none d-md-table-cell">Vanessa Tucker</td>
									</tr>
									<tr>
										<td>Project Fireball</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-danger">Cancelled</span></td>
										<td class="d-none d-md-table-cell">William Harris</td>
									</tr>
									<tr>
										<td>Project Hades</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-success">Done</span></td>
										<td class="d-none d-md-table-cell">Sharon Lessman</td>
									</tr>
									<tr>
										<td>Project Nitro</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-warning">In progress</span></td>
										<td class="d-none d-md-table-cell">Vanessa Tucker</td>
									</tr>
									<tr>
										<td>Project Phoenix</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-success">Done</span></td>
										<td class="d-none d-md-table-cell">William Harris</td>
									</tr>
									<tr>
										<td>Project X</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-success">Done</span></td>
										<td class="d-none d-md-table-cell">Sharon Lessman</td>
									</tr>
									<tr>
										<td>Project Romeo</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-success">Done</span></td>
										<td class="d-none d-md-table-cell">Christina Mason</td>
									</tr>
									<tr>
										<td>Project Wombat</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td><span class="badge bg-warning">In progress</span></td>
										<td class="d-none d-md-table-cell">William Harris</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- End List -->
				
			</div>
		</div>
	</div>
</body>
<!-- End Body -->

<!-- Modal -->
<div class="modal" tabindex="-1">
  <div class="modal-dialog modal-xl">
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
							<label for="pwd" class="col-lg-4">비밀번호</label>
							<input type="password" class="col-lg-6" name="pwd" placeholder="비밀번호">
						</div>
					</div>
					<div class="card">
						<div class="fileUpload pt-3 pb-0">
							<label for="uploadFile"><b>파일첨부</b></label>
							<input type="file" name="uploadFile" multiple="multiple">
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
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->

<%@ include file="../include/footer.jsp" %>