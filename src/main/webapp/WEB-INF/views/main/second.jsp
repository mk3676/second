<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- Style -->
<style>
.input-group-append {
	cursor:pointer;}
</style>
<!-- End Style -->

<!-- Script -->
<script>
$(document).ready(function(){
	
    $("#submitButton").click(function () {
        console.log("클릭함")
        var data = $("#insert")[0]
        var formData = new FormData(data);

        $.ajax({
          type: "post",
          url: "http://127.0.0.1:5000/insert",
          dataType: "json",
          contentType: false,
          processData: false,
          data: formData,
          success(result) {
            console.log(result)
          }
        });
    });
	
	$(".input-group-append").click(function(){
    	var startDate = $("#blog-overview-date-range-1").val()
    	var endDate = $("#blog-overview-date-range-2").val()
    	console.log("버튼이눌렸어", startDate, endDate)
    })
    
})
</script>
<!-- End Script -->

<!-- Page Header -->
<div class="page-header row no-gutters py-4">
  <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
    <span class="text-uppercase page-subtitle">Detail</span>
    <h3 class="page-title text-bold">상세 화면</h3>
  </div>
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
							<canvas height="130" style="max-width: 100% !important;" class="blog-overview-chart"></canvas>
						</div>
					</div>
				</div>
				<!-- End Chart Stats -->
				
        		<!-- Button -->
        		<div class="col-lg-4">
					<div class="card">
						<div class="card-header pt-3 pb-3">
							<h5 class="card-title mb-0">차트 데이터 선택</h5>
						</div>
						<div class="card-body pt-3 pb-3">
							<h6 class="card-subtitle mb-2 text-muted">데이터를 선택하여 필요한 데이터만 보실 수 있습니다.</h6>
							<div role="group" aria-label="Small button group">
								<c:forEach var="good" items="${list}">
								</c:forEach>
									<button type="button" class="btn btn-secondary myButton">경사 데이터</button>
									<button type="button" class="btn btn-secondary myButton">위치 데이터</button>
								
							</div>
						</div>
					</div>
				</div>
				<!-- End Button -->
				
				<!-- List -->
				<div class="row pl-3">
					<div class="col-12 col-lg-12 col-xxl-12 d-flex">
						<div class="card flex-fill">
							<div class="card-header pl-3">
								<h5 class="mb-0">데이터</h5>
							</div>
							
							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>Name</th>
										<th class="d-none d-xl-table-cell">Start Date</th>
										<th class="d-none d-xl-table-cell">End Date</th>
										<th class="d-none d-md-table-cell">Assignee</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Project Apollo</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">Vanessa Tucker</td>
										<td><span class="badge bg-success">Done</span></td>
									</tr>
									<tr>
										<td>Project Fireball</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">William Harris</td>
										<td><span class="badge bg-danger">Cancelled</span></td>
									</tr>
									<tr>
										<td>Project Hades</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">Sharon Lessman</td>
										<td><span class="badge bg-success">Done</span></td>
									</tr>
									<tr>
										<td>Project Nitro</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">Vanessa Tucker</td>
										<td><span class="badge bg-warning">In progress</span></td>
									</tr>
									<tr>
										<td>Project Phoenix</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">William Harris</td>
										<td><span class="badge bg-success">Done</span></td>
									</tr>
									<tr>
										<td>Project X</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">Sharon Lessman</td>
										<td><span class="badge bg-success">Done</span></td>
									</tr>
									<tr>
										<td>Project Romeo</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">Christina Mason</td>
										<td><span class="badge bg-success">Done</span></td>
									</tr>
									<tr>
										<td>Project Wombat</td>
										<td class="d-none d-xl-table-cell">01/01/2021</td>
										<td class="d-none d-xl-table-cell">31/06/2021</td>
										<td class="d-none d-md-table-cell">William Harris</td>
										<td><span class="badge bg-warning">In progress</span></td>
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

<%@ include file="../include/footer.jsp" %>