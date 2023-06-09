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
						<tr>
							<td>(번호)</td>
							<td>(제목)</td>
							<td>(작성자)</td>
							<td>(작성일)</td>
							<td>
								<!-- c:choose (값이 들어오는거에 따라 변경) -->
								<span class="badge bg-success">열람가능</span>
								<span class="badge bg-warning">수정중</span>
								<span class="badge bg-danger">열람불가</span>
								<!-- End c:choose -->
							</td>
						</tr>
						<!-- End forEach -->
						<tr>
							<td>(번호)</td>
							<td>(제목)</td>
							<td>(작성자)</td>
							<td>(작성일)</td>
							<td>
								<!-- c:choose (값이 들어오는거에 따라 변경) -->
								<span class="badge bg-success">열람가능</span>
								<span class="badge bg-warning">수정중</span>
								<span class="badge bg-danger">열람불가</span>
								<!-- End c:choose -->
							</td>
						</tr>
						<tr>
							<td>(번호)</td>
							<td>(제목)</td>
							<td>(작성자)</td>
							<td>(작성일)</td>
							<td>
								<!-- c:choose (값이 들어오는거에 따라 변경) -->
								<span class="badge bg-success">열람가능</span>
								<span class="badge bg-warning">수정중</span>
								<span class="badge bg-danger">열람불가</span>
								<!-- End c:choose -->
							</td>
						</tr>
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

<%@ include file="../include/footer.jsp" %>