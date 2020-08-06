<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/write_completion.css" rel="stylesheet">
<script src="script/jquery-3.5.1-min.js"></script>
<script src="script/newproject.js"></script>
<script type="text/javascript">
	function contentset(){
	    document.getElementById('content_set').style.display=(document.getElementById('content_set').style.display=='block') ? 'none' : 'block';
	  }
</script>
<script>
	$(document).on('click','.projectdir_set',function(){
		var click_this = $(this).attr('id');
		if(click_this == 'newarticle_total'){
			alert('total 준형이형 DB 조인 해야함');
		} else if(click_this == 'newarticle_this'){
			alert('this 준형이형 DB 조인 해야함');
		} else if(click_this == 'project_ascending'){
			$('#projectdir_set').attr('action','content_ascending.do').submit();
		} else if(click_this == 'project_descending'){
			$('#projectdir_set').attr('action','content_descending.do').submit();
		} else if(click_this == 'project_total'){
			$('#projectdir_set').attr('action','content_total.do').submit();
		} else if(click_this == 'project_manager'){
			$('#projectdir_set').attr('action','content_manager.do').submit();
		}
	});
</script>
</head>
<body>
	
	<div class="contents" style=" position:relative; width: 100%;">
		<div style="padding-left: 15px;">
			<div class="컨텐츠 헤더">
				<div style="float: right;">
					<a href="#" onclick="contentset()" style="float: left; padding-right:5px; border-right: 1px solid #eaeaea;">설정</a>
					<a href="#" style="float: none; padding-left: 5px; ">편집</a>
					
					<form id="projectdir_set">
					</form>
					<div id="content_set" class="content_set">
						<div>
						<h4>보기 설정</h4>
							<a>바둑판형 보기</a><br>
							<a>리스트형 보기</a><br>
						</div>
						<div>
						<h4>정렬 기준</h4>
							<a id="newarticle_total" class="projectdir_set">최신 글/댓글 순 (전체)</a><br>
							<a id="newarticle_this" class="projectdir_set">최신 글/댓글 순 (본인작성)</a><br>
							<a id="project_ascending" class="projectdir_set">프로젝트명 오름차순 (ㄱ ~ ㅎ)</a><br>
							<a id="project_descending" class="projectdir_set">프로젝트명 내림차순 (ㅎ ~ ㄱ)</a><br>				
						</div>
						<div>
						<h4>필터</h4>
							<a id="project_total" class="projectdir_set">내가 참여한 모든 프로젝트 보기</a><br>
							<a id="project_manager" class="projectdir_set">내가 관리자인 모든 프로젝트 보기</a><br>
						</div>
					</div>
				</div>
					
				<h4>참여중</h4>
			</div>
			
			<div class="컨텐츠"  style="z-index: 1; display: inline-block; width: 100%;">
				
				<c:forEach var="projectdir" items="${projectDirList}">
					<div class="pro" >
						<input class="title_btn" type="button" value="즐">
						<div class="title_box">
							<span>${projectdir.projectname}</span>
						</div>
						<div class="title_box_s">
							<span></span>
							<span>명 참여중</span>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</body>
</html>