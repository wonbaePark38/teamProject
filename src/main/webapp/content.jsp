<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link href="css/write_completion.css" rel="stylesheet">
<script src="script/jquery-3.5.1-min.js"></script>
<script src="script/projectdir.js"></script>

<div style="padding-left: 15px;" id="content_div">
	<div class="projectdir_content_header">
		<div class="setting_div" id="setting_" style="float: right;">
			<a onclick="lockerset()" style="float: left; padding-right: 5px; border-right: 1px solid #eaeaea;">설정</a>
			<a id="dir_setting" class="dir_set">편집</a>

			<div id="content_set" class="content_set">
				<div>
					<h4>보기 설정</h4>
					<a class="content_box" >바둑판형 보기</a><br>
					<a class="content_list">리스트형 보기</a><br>
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
		
	</div>
	<div id="none_project" style="display: block;">
		<strong style="position: absolute; color: darkgray; top: 45%; left: 36%; font-size: 40px;">프로젝트를 생성해보세요.</strong>
	</div>
	<div id="project_dir_list1" class="content_type" >
		<div id="total_favorites" style="display: none;">
		<h4 id="content_type_title">즐겨찾기</h4>
		<c:forEach var="project_lookup" items="${projectDirList}">
			<c:if test="${project_lookup.project_favorites ne '0' and project_lookup.hide_locker eq '0'}">
			<script>
					$('#total_favorites').show();
					$('#none_project').hide();
			</script>
			<div class="project_div">
			<input class="div_btn" id="div_button" type="button">
			<input type="hidden" name="project_id" value="${project_lookup.project_id}">
			
				<div class="project_select">
					<div class="title_box">
						<span>${project_lookup.project_name}</span>
					</div>
					<div class="title_box_s">
						<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
					</div>
				</div>
				<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
			</div>
			</c:if>
		</c:forEach>
		</div>
		<div style="z-index: 1; width: 100%; display: inline-block;">
			<h4 style="padding-bottom: 10px;">참여중</h4>
			<c:forEach var="project_lookup" items="${projectDirList}">
				<c:if test="${project_lookup.project_favorites eq '0' and project_lookup.hide_locker eq '0'}">
				<script>
					$('#none_project').hide();
				</script>
				<div class="project_div">
				<input class="div_btn" id="div_button" type="button" >
				<input type="hidden" name="project_id" value="${project_lookup.project_id}">
					<div class="project_select">
						<div class="title_box">
							<span>${project_lookup.project_name}</span>
						</div>
						<div class="title_box_s">
							<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
						</div>
					</div>
					<input class="title_btn" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
				</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<!-- 전체 -->
	
	
	<!-- 미보관 -->
	<div id="project_dir_list2" class="content_type" style="z-index: 1; width: 100%; display: inline-block;">
		<h4 style="padding-bottom: 10px;">미보관</h4>
		<c:forEach var="project_lookup" items="${projectDirList}">
			<c:if test="${project_lookup.project_locker eq null and project_lookup.hide_locker eq '0'}">
				<c:choose>
					<c:when test="${project_lookup.project_favorites ne '0'}">
						<div class="project_div">
						<input class="div_btn" id="div_button" type="button" >
						<input type="hidden" name="project_id" value="${project_lookup.project_id}">
							<div class="project_select">
								<div class="title_box">
									<span>${project_lookup.project_name}</span>
								</div>
								<div class="title_box_s">
									<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
								</div>
							</div>
							<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
						</div>
					</c:when>
					<c:when test="${project_lookup.project_favorites eq '0' and project_lookup.hide_locker eq '0'}">
						<div class="project_div">
						<input class="div_btn" id="div_button" type="button" >
						<input type="hidden" name="project_id" value="${project_lookup.project_id}">
							<div class="project_select">
								<div class="title_box">
									<span>${project_lookup.project_name}</span>
								</div>
								<div class="title_box_s">
									<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
								</div>
							</div>
							<input class="title_btn" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
						</div>
					</c:when>
				</c:choose>
			</c:if>
		</c:forEach>
	</div>
	<!-- 미보관 -->
	
	<!-- 읽지않음 -->
	<div id="project_dir_list3" class="content_type" style="z-index: 1; width: 100%; display: inline-block;">
		<h4 style="padding-bottom: 10px;">읽지않음</h4>
		<c:forEach var="project_lookup" items="${projectDirList}">
			<c:choose>
				<c:when test="${project_lookup.project_favorites ne '0' and project_lookup.hide_locker eq '0'}">
					<div class="project_div">
					<input class="div_btn" id="div_button" type="button" >
					<input type="hidden" name="project_id" value="${project_lookup.project_id}">
						<div class="project_select">
							<div class="title_box">
								<span>${project_lookup.project_name}</span>
							</div>
							<div class="title_box_s">
								<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
							</div>
						</div>
						<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
					</div>
				</c:when>
				<c:when test="${project_lookup.project_favorites eq '0' and project_lookup.hide_locker eq '0'}">
					<div class="project_div">
					<input class="div_btn" id="div_button" type="button" >
					<input type="hidden" name="project_id" value="${project_lookup.project_id}">
						<div class="project_select">
							<div class="title_box">
								<span>${project_lookup.project_name}</span>
							</div>
							<div class="title_box_s">
								<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
							</div>
						</div>
						<input class="title_btn" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
	<!-- 읽지않음 -->
	
	
	<!-- 즐겨찾기 -->
	<div id="project_dir_list4" class="content_type">
		<h4 id="content_type_title">즐겨찾기</h4>
			<c:forEach var="project_lookup" items="${projectDirList}">
			<c:if test="${project_lookup.project_favorites ne '0' and project_lookup.hide_locker eq '0'}">
			<div class="project_div">
			<input class="div_btn" id="div_button" type="button" >
			<input type="hidden" name="project_id" value="${project_lookup.project_id}">
				<div class="project_select">
					<div class="title_box">
						<span>${project_lookup.project_name}</span>
					</div>
					<div class="title_box_s">
						<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
					</div>
				</div>
				<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
			</div>
			</c:if>
		</c:forEach>
	</div>
	<!-- 즐겨찾기 -->
	
	<!-- 보관함 -->
	<c:forEach var="locker_list" items="${projectLockerList}">
		<c:if test="${project_lookup.hide_locker eq '0' and locker_list.locker_name ne null or locker_list.locker_name ne ''}">
			<input type="hidden" name="locker_list_id" value="${locker_list.locker_list_id }">
			<div id="${locker_list.locker_name}" class="content_type" style="z-index: 1; width: 100%; display: inline-block;">
			<h4 style="padding-bottom: 10px;"><span id="locker_n">${locker_list.locker_name}</span> 보관함</h4>
				<c:forEach var="project_lookup" items="${projectDirList}">
					<c:if test="${locker_list.locker_name eq project_lookup.project_locker}">
					
					<c:choose>
						<c:when test="${project_lookup.project_favorites ne '0'}">
							<div class="project_div" id="${project_lookup.project_locker}">
							<input class="div_btn" id="div_button" type="button" >
							<input type="hidden" name="project_id" value="${project_lookup.project_id}">
								<div class="project_select">
									<div class="title_box">
										<span>${project_lookup.project_name}</span>
									</div>
									<div class="title_box_s">
										<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
									</div>
								</div>
								<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
							</div>
						</c:when>
						<c:when test="${project_lookup.project_favorites eq '0'}">
							<div class="project_div"id="${project_lookup.project_locker}">
							<input class="div_btn" id="div_button" type="button" >
							<input type="hidden" name="project_id" value="${project_lookup.project_id}">
								<div class="project_select">
									<div class="title_box">
										<span>${project_lookup.project_name}</span>
									</div>
									<div class="title_box_s">
										<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
									</div>
								</div>
								<input class="title_btn" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
							</div>
						</c:when>
					</c:choose>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</c:forEach>
	<!-- 보관함 -->
	
	
	<!-- 숨김 -->
	
	<div id="hide_load" class="content_type" style="z-index: 1; width: 100%; display: inline-block;">
		<h4 style="padding-bottom: 10px;"><span>숨김</span> 보관함</h4>
		<c:forEach var="project_lookup" items="${projectDirList}">
		<c:if test="${project_lookup.hide_locker eq '1'}">
			<c:choose>
				<c:when test="${project_lookup.project_favorites ne '0'}">
					<div class="project_div">
					<input class="div_btn" id="div_button" type="button" >
					<input type="hidden" name="project_id" value="${project_lookup.project_id}">
						<div class="project_select">
							<div class="title_box">
								<span>${project_lookup.project_name}</span>
							</div>
							<div class="title_box_s">
								<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
							</div>
						</div>
						<input class="title_btn_check" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
					</div>
				</c:when>
				<c:when test="${project_lookup.project_favorites eq '0'}">
					<div class="project_div">
					<input class="div_btn" id="div_button" type="button" >
					<input type="hidden" name="project_id" value="${project_lookup.project_id}">
						<div class="project_select">
							<div class="title_box">
								<span>${project_lookup.project_name}</span>
							</div>
							<div class="title_box_s">
								<span>${project_lookup.joinuser}</span> <span>명 참여중</span>
							</div>
						</div>
						<input class="title_btn" id="star_btn" type="button" name="project_favorites" value="${project_lookup.project_favorites}">
					</div>
				</c:when>
			</c:choose>
			</c:if>
		</c:forEach>
	</div>
	

	<!-- 숨김 -->
</div>
