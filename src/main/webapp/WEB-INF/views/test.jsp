<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <title>Insert title here</title>
          <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
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
                    location.href = "/main/start?pointer=" + result["pointer"]
                  }
                });
              });

              $("#pointerButton").click(function () {
                console.log("클릭")
                location.href = "/main/start?pointer=" + $("#pointer").val()
              });

              $("#selection").click(function () {
                console.log($('input[name="select"]:checked').val())
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

          <legend>열 선택</legend>
          <div>
            <c:forEach var="list" items="${columnList}">
              <input type="checkbox" name="select" value="${list}">${list}
            </c:forEach>
            <input type="button" value="버튼" id="selection">
          </div>




        </body>

        </html>