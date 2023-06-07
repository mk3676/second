<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
              console.log(result)
            }
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
  </body>

  </html>