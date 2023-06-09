<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-12 col-lg-12 col-xxl-12 text-center ">
			<div class="card">
			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
						<!--<c:if test="${page.prev}"> -->
							<li class="pageInfo_btn previous"><a href="${page.startPage-1}" >이전</a></li>
						<!-- </c:if> -->
						<!-- <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}"> -->
							<li class="pageInfo_btn ${page.cri.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a></li>
						<!-- </c:forEach> -->
						<!-- <c:if test="${page.next}"> -->
							<li class="pageInfo_btn next"><a href="${page.endPage + 1 }">다음</a></li>
						<!-- </c:if> -->
					</ul>
				</div>
			</div>
			</div>
		</div>
	</div>
	<!-- End List -->
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
		<input type="hidden" name="amount" value="${page.cri.amount }">
		<input type="hidden" name="keyword" value="${page.cri.keyword }">
		<input type="hidden" name="type" value="${page.cri.type }">
	</form>
</div>
</body>
<!-- End Body -->

<%@ include file="../include/footer.jsp" %>