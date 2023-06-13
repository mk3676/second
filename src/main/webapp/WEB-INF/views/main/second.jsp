<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../include/header.jsp" %>

		<!-- Style -->
		<style>
			.input-group-append {
				cursor: pointer;
			}

			.badge {
				cursor: pointer;
				user-select: none;
			}
		</style>
		<!-- End Style -->

		<!-- Script -->
		<script>
			$(document).ready(function () {

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

				$(".input-group-append").click(function () {
					var startDate = $("#blog-overview-date-range-1").val()
					var endDate = $("#blog-overview-date-range-2").val()

					console.log("버튼이눌렸어", startDate, endDate)
				})

				let currentBadgeIndex = 0;
				$(".selecting-badge").on("click", () => {
					switch (currentBadgeIndex++ % 3) {
						case 0:
							$(".selecting-badge").html('<span class="badge bg-warning">수정중</span>');
							break;
						case 1:
							$(".selecting-badge").html('<span class="badge bg-danger">열람불가</span>');
							break;
						case 2:
							$(".selecting-badge").html('<span class="badge bg-success">열람가능</span>');
							break;
						default:
							break;
					}

					// ajax
				});

				$("#printPDF").click(function () {
					html2canvas($('body')[0]).then(function (canvas) {

						var imgData = canvas.toDataURL('image/png');
						var imgWidth = 190;
						var pageHeight = imgWidth * 1.414;
						var imgHeight = canvas.height * imgWidth / canvas.width;
						var heightLeft = imgHeight;
						var margin = 10;
						var doc = new jsPDF('p', 'mm');
						var position = 0;

						doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
						heightLeft -= pageHeight;

						while (heightLeft >= 20) {
							position = heightLeft - imgHeight;
							doc.addPage();
							doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
							heightLeft -= pageHeight;
						}

						doc.save('tilt-graph.pdf');
					});
				});
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
						<!-- Small Stats Blocks -->
						<div class="row col-12">
							<div class="col-lg col-md-6 col-sm-6 mb-4">
								<div class="stats-small stats-small--1 card card-small">
									<div class="card-body p-0 d-flex">
										<div class="d-flex flex-column m-auto">
											<div class="stats-small__data text-center">
												<span class="stats-small__label text-uppercase">데이터 갯수</span>
												<h6 class="stats-small__value count my-3">2,390</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg col-md-6 col-sm-6 mb-4">
								<div class="stats-small stats-small--1 card card-small">
									<div class="card-body p-0 d-flex">
										<div class="d-flex flex-column m-auto">
											<div class="stats-small__data text-center">
												<span class="stats-small__label text-uppercase">경사 평균</span>
												<h6 class="stats-small__value count my-3">182</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg col-md-4 col-sm-6 mb-4">
								<div class="stats-small stats-small--1 card card-small">
									<div class="card-body p-0 d-flex">
										<div class="d-flex flex-column m-auto">
											<div class="stats-small__data text-center">
												<span class="stats-small__label text-uppercase">배터리 평균</span>
												<h6 class="stats-small__value count my-3">8,147</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg col-md-4 col-sm-6 mb-4">
								<div class="stats-small stats-small--1 card card-small">
									<div class="card-body p-0 d-flex">
										<div class="d-flex flex-column m-auto">
											<div class="stats-small__data text-center">
												<span class="stats-small__label text-uppercase">온도 평균</span>
												<h6 class="stats-small__value count my-3">2,413</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg col-md-4 col-sm-12 mb-4">
								<div class="stats-small stats-small--1 card card-small">
									<div class="card-body p-0 d-flex">
										<div class="d-flex flex-column m-auto">
											<div class="stats-small__data text-center">
												<span class="stats-small__label text-uppercase">보고서 출력</span>
												<div class="stats-small__value">
													<span class="badge bg-info" id="printPDF">보고서</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg col-md-4 col-sm-6 mb-4">
								<div class="stats-small stats-small--1 card card-small">
									<div class="card-body p-0 d-flex">
										<div class="d-flex flex-column m-auto">
											<div class="stats-small__data text-center">
												<span class="stats-small__label text-uppercase">상태 변경</span>
												<div class="selecting-badge stats-small__value">
													<span class="badge bg-success">열람가능</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End Small Stats Blocks -->


						<!-- Chart Stats -->
						<div class="col-lg-8 col-md-12 col-sm-12 mb-4">
							<div class="card card-small">
								<div class="card-header border-bottom">
									<h5 class="m-0">차트</h5>
								</div>
								<div class="card-body pt-0">
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
												<c:forEach var="key" items="${key}">
													<th>${key}</th>
												</c:forEach>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dataList" items="${pageList}">
												<tr>
													<c:forEach var="key" items="${key}">
														<td>${dataList[key]}</td>
													</c:forEach>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End List -->

						<div class=" pagination">
							<c:if test="${paging.prev}">
								<c:set var="prevPage" value="${paging.startNum-1}" />
								<a href="/main/displayColumn?pageNum=${prevPage}&pointer=${pointer}" class="pageClass">이전</a>
							</c:if>

							<c:forEach begin="${paging.startNum}"
								end="${paging.startNum+9 > paging.lastNum ? paging.lastNum : paging.startNum+9}" var="page">
								<c:choose>
									<c:when test="${page ne paging.pageNum}">
										<a style="cursor:pointer;" class="pageClass"
											href="/main/displayColumn?pageNum=${page}&pointer=${pointer}">${page}</a>
									</c:when>
									<c:when test="${page eq paging.pageNum}">
										<a style="cursor:pointer; background-color: #cfe2f3;" class="pageClass"
											href="/main/displayColumn?pageNum=${page}&pointer=${pointer}">${page}</a>
									</c:when>
								</c:choose>

							</c:forEach>

							<c:if test="${paging.next}">
								<c:set var="nextPage" value="${paging.startNum+10}" />
								<a class="pageClass" href="/main/displayColumn?pageNum=${nextPage}&pointer=${pointer}">이후</a>
							</c:if>
						</div>

					</div>
				</div>
			</div>
		</body>
		<!-- End Body -->

		<%@ include file="../include/footer.jsp" %>