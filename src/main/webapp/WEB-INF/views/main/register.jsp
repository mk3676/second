<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- Script -->
<script>
$(document).ready(function(){
	/* form 태그의 버튼이 눌리면 각 이미지의 정보를 input(hidden)의 value에 담아 전송 */
	var formObj = $("form[role='form']")
	$("button[type='submit']").click(function (e) {
		e.preventDefault()
		console.log("전송버튼이 눌렸어요")
		var str = ""
		$(".uploadResult ul li").each(function (idx, obj) {
			console.log("obj: ", obj)
			var jobj = $(obj)
			console.dir(jobj)
			str += "<input type='hidden' name='attachList[" + idx + "].fileName' value='" + jobj.data('filename') + "'>"
			str += "<input type='hidden' name='attachList[" + idx + "].uuid' value='" + jobj.data('uuid') + "'>"
			str += "<input type='hidden' name='attachList[" + idx + "].uploadPath' value='" + jobj.data('path') + "'>"
			str += "<input type='hidden' name='attachList[" + idx + "].image' value='" + jobj.data('type') + "'>"
		})
		console.log(str)
		//formObj.append(str).submit()
	})
	/* 정규표현식 으로 확장자 와 용량 제한 */
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
	var maxSize = 5242880  //5MB
	const checkExtension = (fileName, fileSize) => {
		if (fileSize >= maxSize) {
			alert("파일 용량 초과 (제한용량: 5MB)")
			return false;
		}
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.")
			return false;
		}
		return true;
	}
	/* input 태그에 파일이 담기면 체크(확장자, 용량) 후 ajax 를 통해 uploadcontroller의 uploadAjaxAction 에 전달되고
	이미지를 c:\upload 폴더에 날짜를 생성하고 uuid를 붙여 저장하고, 이미지면 thumbnail 이미지를 추가 생성하고, AttachFileDTO 에 값을 저장하여 list 로 반환하면
	반환된 list 정보를 태그화 하여 이미지면 thumbnail 이미지를 보여주고, 이미지가 아니면 attach.png 를 보여준다 */
	$("input[type='file']").change(function (e) {
		var formData = new FormData()
		var inputFile = $("input[name='uploadFile']")
		var files = inputFile[0].files
		console.log(files)
		for (var i of files) {
			if (!checkExtension(i.name, i.size)) return false;
			formData.append("uploadFile", i)
		}
		var uploadResult = $(".uploadResult ul")
		const showUploadedFile = (uploadResultArr) => {
			if (!uploadResultArr || uploadResultArr.length == 0) return
			var str = ""
			$(uploadResultArr).each(function (idx, obj) {
				if (obj.image) {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
					var originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName
					originPath = originPath.replace(new RegExp(/\\/g), "/")  // "\\" => "/"  로 대체
					str += "<li data-path='" + obj.uploadPath + "'data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "'data-type='" + obj.image + "'"
					str += "><div><span>" + obj.fileName + "</span><button type='button' data-file=\'" + fileCallPath + "\' data-type='image' "
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
					str += "<img src='/display?fileName=" + fileCallPath + "' width='300px'></div></li>"
				} else {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/")
					str += "<li data-path='" + obj.uploadPath + "'data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "'data-type='" + obj.image + "'"
					str += "><div><span>" + obj.fileName + "</span><button type='button' data-file=\'" + fileCallPath + "\' data-type='file' "
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button></br>"
					str += "<img src='/resources/img/attach.png'></div></li>"
				}
			})
			uploadResult.append(str)
		}
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: (result) => {
				console.log("업로드 성공", result)
				showUploadedFile(result)
			}
		}) // ajax
	}) // button[type='file'] change
	$(".uploadResult").on("click","span", function(e) {
		var targetFile = $(this).data('file')
		var type= $(this).data('type')
		console.log(targetFile)
	}) // uploadResult click
	
	$(".uploadResult").on("click","button", function(e) { ///// 변경
		console.log("이미지 삭제")
		var targetFile = $(this).data('file')
		var type= $(this).data('type')
		console.log(targetFile)
		var targetLi = $(this).closest("li")
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType: 'text',
			type: 'POST',
			success: (result)=>{
				alert(result)
				targetLi.remove()
			}
		})
	}) // uploadResult click
})
</script>
<!-- End Script -->

<!-- Page Header -->
<div class="page-header row no-gutters py-4">
  <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
    <span class="text-uppercase page-subtitle">Register</span>
    <h3 class="page-title text-bold">등록 페이지</h3>
  </div>
</div>
<!-- End Page Header -->

<!-- Body -->
<body>
<div class="container-fluid p-0">
	<div class="row">
		<div class="col-lg-3">
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
</body>
<!-- End Body -->

<%@ include file="../include/footer.jsp" %>