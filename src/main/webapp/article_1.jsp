<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/task.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function img_load(){
		$("#post_images").append("<div class='post_image'><div class='post_box'><img class='post_load_img'><input type='button' id='img_close'></div></div>");
	}
	
	function file_load(){
		$("#post_files").append("<div class='post_file' ><div style='height: 70px; width: 100%; border: 1px solid #eaeaea; position: relative;'><img id='download_icon'><dl class='file_div'><dt><a href='#'>파일 이름</a>	</dt><dd style='margin: 0px;'>파일 크기</dd></dl><div class='down_fil' ><a id='down_logo' style='display: inline-block;color: #555;' href='#'>&nbsp;&nbsp;&nbsp;다운로드</a>	</div></div></div>");
	}
	
	function content_load(thisevent){	/* 원배형  코드*/

		  var node = $(thisevent).parent().next();
		  var presentDisplay = node.css('display');
		 
		  if(presentDisplay == 'block'){
		    
		    node.css('display','none');
		  }
		  else{
		    node.css("display","block");
		  }
	}
	
</script>
</head>
<body>
	
	<div class="post_idx"style="width: 511px;  background-color: pink;">
		<!-- 탑 -->
		<div class="top_writer">
			<div class="photo" style="float: left;">
				<!-- 스크립트로 실행 -->
				<img id="user_profile" style="width: 40px; height: 40px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat;">
			</div>
			<div style="padding-left: 30px; float: left;">
				<span>이름</span><br> <span id="공개범위설정">yyyy-mm-dd 24:00 <img></span>
			</div>
			<div style="margin: -10px 0px 0px 10px;">
				<div style="float: right; padding-left: 10px;">
					<a id="set_icon"></a>
				</div>
				<div style="float: right;">
					<a id="pin_icon"></a>
				</div>
			</div>
		</div>
		<!-- 탑 -->

		<!-- 글내용 -->
		<div class="post">
		<!-- 일반글 -->
			<!-- 택스트박스 -->
			<div class="div_text_write" contenteditable="false">
				<p>디비에 저장된 글내용</p>
			</div>
			
			<!-- 이미지 -->
			<input type="button" onclick="img_load()" value="이미지 업로드 버튼">
			<div id="post_images">
				<!-- 이미지가 들어갈 영역 -->
				<!-- 
				<div class='post_image'>
					<div class='post_box'>
						<img class='post_load_img'>
						<input type='button' id='img_close'>
					</div>
				</div>
				 -->
			</div>
			<!-- 파일 -->
			<input type="button" onclick="file_load()" value="파일 업로드 버튼">
			<div id="post_files">
				<!-- 파일이 들어갈 영역 -->
				<!-- <div class="post_file" >
					<div style="height: 70px; width: 100%; border: 1px solid #eaeaea; position: relative;">
						<img id="download_icon">
							<dl class="file_div">
								<dt>
								<a href="#">파일 이름</a>
							</dt>
							<dd style="margin: 0px;">파일 크기</dd>
						</dl>
						<div class="down_fil" >
							<a id="down_logo" style="display: inline-block;color: #555;" href="#">&nbsp;&nbsp;&nbsp;다운로드</a>
						</div>
					</div>
				</div> 
				-->
			</div>
			<div style="text-align:right; padding-right: 10px;">
				<span>댓글 n 개</span>&nbsp;<span>읽음 n 명</span>
			</div>
		<!-- 일반글 -->
		
	
		
		
		</div>
		<!-- 글내용 -->

		<!-- 좋아요 담아두기 -->

		<div class="bottom_lay" style="height: 40px;">
			<ul class="bottom_list">
				<li><a id="like_icon">좋아요</a></li>
				<li><a id="input_btn_icon">댓글작성</a></li>
				<li><a id="bringIcon">담아두기</a></li>
			</ul>
		</div>
		<!-- 글내용 -->
		
		<!-- 댓글 DB -->
		<div class="remark_div">
			
			<div class="photo" style="float: left; padding-left: 10px;">
				<img id="user_profile_remark">
			</div>
			<div class="remark_setting">
				<span>수정</span><em>|</em><span>삭제</span>
			</div>
			<div class="remark_data">
				<strong>이름</strong>
				<span>yyyy-mm-dd 24:00</span>
				<a id="remark_like_icon">좋아요</a>
				<pre>댓글 내용</pre>			
			</div>
			
		</div>
		<!-- 댓글 DB -->
		
		<!-- 댓글 -->
		<div class="" style="position: relative; padding-bottom: 10px;">
			<div class="photo" style="float: left; padding-left: 10px;">
				<img id="user_profile" style="width: 32px; height: 32px; cover; background-image: url(images/empty_photo_s.png); background-size: cover; background-repeat: no-repeat; ">
			</div>
			<div class="remarkcntn">
				<div class="div_text_write" contenteditable="true" placeholder="댓글을 입력하세요(Enter는 입력, shift or ctrl + Enter는 줄바꿈)" style="min-height: 20px;" ></div>
				
			</div>
			<a class="remark_upload"></a>
			<div class="remark_images">
				<div class="image_box">
					<!-- 썸네일 153 x 153 -->
					<img class="remark_load_img">
					<input type="button" id="img_close">
				</div>
			</div>
			<div class="remark_files">
				<!-- 파일 등록시 -->
				<div class="file_box">
					<img id="remark_down_icon">
					<dl class="file_div" style="margin:0;">
						<dt style="padding:5px 5px 0 5px;float: left;"><a href="#">파일 이름</a></dt>
						<dd style="margin: 0px;padding: 5px 5px 0 0;">파일 크기</dd>
					</dl>
					<input type="button" id="file_div_close">
				</div>
			</div>
		</div>
		<!-- 댓글 -->
	</div>



	<!-- 일반글 -->
</body>
</html>