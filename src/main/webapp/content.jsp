<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/task.css" rel="stylesheet">
<script type="text/javascript">
	function contentset(){
	    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
	  }
</script>

</head>
<body>
	<div class="contents" style=" position:relative; width: 100%;">
			<div style="padding-left: 15px;">
				<div class="컨텐츠 헤더">
					<div style="float: right;">
						<a href="#" onclick="contentset()" style="float: left; padding-right:5px; border-right: 1px solid #eaeaea;">설정</a>
						<a href="#" style="float: none; padding-left: 5px; ">편집</a>
						<div id="content_set" class="content_set">
							<div>
							<h4>보기 설정</h4>
								<a>바둑판형 보기</a><br>
								<a>리스트형 보기</a><br>
							</div>
							<div>
							<h4>정렬 기준</h4>
								<a>최신 글/댓글 순 (전체)</a><br>
								<a>최신 글/댓글 순 (본인작성)</a><br>
								<a>프로젝트명 오름차순 (ㄱ ~ ㅎ)</a><br>
								<a>프로젝트명 내림차순 (ㅎ ~ ㄱ)</a><br>				
							</div>
							<div>
							<h4>필터</h4>
								<a>내가 참여한 모든 프로젝트 보기</a><br>
								<a>내가 관리자인 모든 프로젝트 보기</a><br>
							</div>
						</div>
					</div>
						
					<h4>참여중</h4>
				</div>
				
				<div class="컨텐츠"  style="z-index: 1; display: inline-block; width: 100%;">
					<div class="pro" >
						<input class="title_btn" type="button" value="즐">
						<div class="title_box">
							<span>프로젝트 이름</span>
						</div>
						<div class="title_box_s">
							<span>n명</span>
							<span>참여중</span>
						</div>
					</div>
					<div class="pro" >
						<input class="title_btn" type="button" value="즐">
						<div class="title_box">
							<span>프로젝트 이름</span>
						</div>
						<div class="title_box_s">
							<span>n명</span>
							<span>참여중</span>
						</div>
					</div>
					<div class="pro" >
						<input class="title_btn" type="button" value="즐">
						<div class="title_box">
							<span>프로젝트 이름</span>
						</div>
						<div class="title_box_s">
							<span>n명</span>
							<span>참여중</span>
						</div>
					</div>
					<div class="pro" >
						<input class="title_btn" type="button" value="즐">
						<div class="title_box">
							<span>프로젝트 이름</span>
						</div>
						<div class="title_box_s">
							<span>n명</span>
							<span>참여중</span>
						</div>
					</div>
					
				
				</div>
					



			</div>
	</div>
</body>
</html>