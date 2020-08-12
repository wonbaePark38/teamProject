<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link href="css/write_completion.css" rel="stylesheet">
<script src="script/jquery-3.5.1-min.js"></script>
<script src="script/projectdir.js"></script>

<form action="projectfavorites.do" id="favorites_form" method="post">
<div style="padding-left: 15px;">
	<div class="projectdir_content_header">
		<div style="float: right;">
			<a onclick="contentset()" style="float: left; padding-right: 5px; border-right: 1px solid #eaeaea;">설정</a>
			<a href="#" style="float: right; padding-left: 5px;">편집</a>

			<div id="content_set" class="content_set">
				<div>
					<h4>보기 설정</h4>
					<a>바둑판형 보기</a><br> <a>리스트형 보기</a><br>
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
		
		<div class="content_type" style="display: none;">
		<h4 id="content_type_title">즐겨찾기</h4>
		<c:forEach var="project_lookup" items="${projectDirList}">
			<input type="hidden" name="project_id" value="${project_lookup.project_id}">
			<c:if test="${project_lookup.project_favorites ne '0'}">
				<script>
					$('.content_type').show();	
				</script>
				<div class="pro">
					<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
					<div class="title_box">
						<span>${project_lookup.project_name}</span>
					</div>
					<div class="title_box_s">
						<span></span> <span>명 참여중</span>
					</div>
				</div>
			</c:if>
		</c:forEach>
		</div>
	</div>

	<div id="project_dir_list" style="z-index: 1; width: 100%; display: inline-block;">
		<h4 style="padding-bottom: 10px;">참여중</h4>
		<c:forEach var="project_lookup" items="${projectDirList}">
			<input type="hidden" name="project_id" value="${project_lookup.project_id}">
			<c:if test="${project_lookup.project_favorites eq '0'}">
				<div class="pro">
					<input class="title_btn" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
					<div class="title_box">
						<span>${project_lookup.project_name}</span>
					</div>
					<div class="title_box_s">
						<span></span> <span>명 참여중</span>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
	</form>
