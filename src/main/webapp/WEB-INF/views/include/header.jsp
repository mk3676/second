<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html class="no-js h-100" lang="ko">

<!-- Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>두번째 프로젝트</title>
<meta name="description" content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" id="main-stylesheet" data-version="1.1.0" href="/resources/styles/shards-dashboards.1.1.0.min.css">
<link rel="stylesheet" href="/resources/styles/extras.1.1.0.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script async defer src="https://buttons.github.io/buttons.js"></script>
</head>
<!-- End Head -->

<!-- Script -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="https://unpkg.com/shards-ui@latest/dist/js/shards.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sharrre/2.0.1/jquery.sharrre.min.js"></script>
<script src="/resources/scripts/extras.1.1.0.min.js"></script>
<script src="/resources/scripts/shards-dashboards.1.1.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- <script src="/resources/scripts/app/app-blog-overview.1.1.0.js"></script> -->
      <!-- <script src="/resources/scripts/html2canvas.js"></script> -->
      <!-- <script src="/resources/scripts/jspdf.min.js"></script> -->

<script>
var currentLocation = window.location.pathname;
if(currentLocation === '/main/second' || currentLocation === '/second'){
    const script1 = document.createElement('script');
    script1.type = 'text/javascript';
    script1.src = '/resources/scripts/app/app-blog-overview.1.1.0.js';
    document.head.appendChild(script1);
    
    const script2 = document.createElement('script');
    script2.type = 'text/javascript';
    script2.src = '/resources/scripts/html2canvas.js';	
    document.head.appendChild(script2);
    
    const script3 = document.createElement('script');
    script3.type = 'text/javascript';
    script3.src = '/resources/scripts/jspdf.min.js';
    document.head.appendChild(script3);
}
</script>
<!-- End Script -->
