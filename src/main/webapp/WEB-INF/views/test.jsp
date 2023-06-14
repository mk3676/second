<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" id="main-stylesheet" data-version="1.1.0"
          href="/resources/styles/shards-dashboards.1.1.0.min.css">
        <link rel="stylesheet" href="/resources/styles/extras.1.1.0.min.css">
        <script async defer src="https://buttons.github.io/buttons.js"></script>
      </head>
      <!-- End Head -->

      <!-- Script -->
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
      <script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
      <script src="/resources/scripts/extras.1.1.0.min.js"></script>
      <script src="/resources/scripts/shards-dashboards.1.1.0.min.js"></script>
      <!-- <script src="/resources/scripts/app/app-blog-overview.1.1.0.js"></script> -->
      <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
      <script src="/resources/scripts/html2canvas.js"></script>
      <script src="/resources/scripts/jspdf.min.js"></script>
      <script>
        $(document).ready(function () {
/*         	console.log('${pageList}'["DATE"]) */
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
                location.href = "/main/start?pointer=" + result["pointer"]
              }
            });
          });

          $("#pointerButton").click(function () {
            console.log("클릭")
            location.href = "/main/start?pointer=" + $("#pointer").val()
          });

          $("#tableButton").click(function () {
            html2canvas($('body')[0]).then(function (canvas) { //저장 영역 div id

              // 캔버스를 이미지로 변환
              var imgData = canvas.toDataURL('image/png');

              var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
              var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
              var imgHeight = canvas.height * imgWidth / canvas.width;
              var heightLeft = imgHeight;
              var margin = 10; // 출력 페이지 여백설정
              var doc = new jsPDF('p', 'mm');
              var position = 0;

              // 첫 페이지 출력
              doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
              heightLeft -= pageHeight;

              // 한 페이지 이상일 경우 루프 돌면서 출력
              while (heightLeft >= 20) {
                position = heightLeft - imgHeight;
                doc.addPage();
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
              }

              // 파일 저장
              doc.save('tilt-graph.pdf');
            });
          });
        });
      </script>
      </head>

      <body>
        <form id="insert" enctype="multipart/form-data">
          성명: <input type="text" name="name" id="name">
          전화번호: <input type="text" name="phone" id="phone">
          이메일 주소: <input type="email" name="email" id="email">
          비밀번호: <input type="password" name="password" id="password">
          <input type="file" name="file[]" id="file" multiple>
          <input type="button" value="버튼" id="submitButton">
        </form>

        <form id="route">
          <input type="text" name="pointer" id="pointer">
          <input type="button" value="pointerButton" id="pointerButton">
        </form>

        <input type="button" id="tableButton" value="PDF로 변환">

        <table class="table table-hover my-0" id="tableContent">
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
      </body>

      </html>