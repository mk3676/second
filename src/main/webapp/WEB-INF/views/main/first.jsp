<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ include file="../include/header.jsp" %>

				<!-- Style -->
				<style>
					span.badge.bg-success {
						cursor: pointer;
					}
				</style>
				<!-- End Style -->

				<!-- Script -->
				<script>
					$(document).ready(function () {
						$("span.badge.bg-success").each(function (idx) {
							$(this).click(function (e) {
								console.log(idx + "번째 버튼이 눌렸어요")
							})
						})
					})
				</script>
				<!-- End Script -->

				<style>
					.pagination {
						display: flex;
						justify-content: center;
						margin-top: 20px;
					}

					.pagination a {
						margin: 0 5px;
						color: #333;
						text-decoration: none;
						padding: 5px 10px;
						border: 1px solid #ccc;
						border-radius: 5px;
					}

					.pagination a.active {
						background-color: #333;
						color: #fff;
					}

					.pageClass {
						display: "inline";
					}
				</style>

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
												<th>작성자</th>
												<th>이메일</th>
												<th>작성일</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list}">
												<tr>
													<td>${list.cnt}</td>
													<td>${list.username}</td>
													<td>${list.email}</td>
													<td>
														<fmt:formatDate pattern="yyyy년 M월 d일 hh시 m분" value="${list.creDate}" />
													</td>
													<td>
														<c:choose>
															<c:when test="${list.status eq '열람가능'}">
																<span class="badge bg-success">열람가능</span>
															</c:when>
															<c:when test="${list.status eq '수정중'}">
																<span class="badge bg-warning">수정중</span>
															</c:when>
															<c:when test="${list.status eq '열람불가'}">
																<span class="badge bg-danger">열람불가</span>
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-12 col-lg-12 col-xxl-12 text-center ">
								<div class="card">
									<div class=" pagination">
										<c:if test="${paging.prev}">
											<c:set var="prevPage" value="${paging.startNum-1}" />
											<a href="/main/first?pageNum=${prevPage}" class="pageClass"></a>
										</c:if>

										<c:forEach begin="${paging.startNum}"
											end="${paging.startNum+9 > paging.lastNum ? paging.lastNum : paging.startNum+9}" var="page">
											<c:choose>
												<c:when test="${page ne paging.pageNum}">
													<a style="cursor:pointer;" class="pageClass" href="/main/first?pageNum=${page}">${page}</a>
												</c:when>
												<c:when test="${page eq paging.pageNum}">
													<a style="cursor:pointer; background-color: #cfe2f3;" class="pageClass"
														href="/main/first?pageNum=${page}&">${page}</a>
												</c:when>
											</c:choose>

										</c:forEach>

										<c:if test="${paging.next}">
											<c:set var="nextPage" value="${paging.startNum+10}" />
											<a class="pageClass" href="/main/first?pageNum=${nextPage}"></a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<!-- End List -->

					</div>
				</body>
				<!-- End Body -->

				<%@ include file="../include/footer.jsp" %>