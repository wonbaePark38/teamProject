<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<div class="locker_save">
	<div class="locker_save_h">
		<a onclick="">X</a>
		<h3>보관함 설정</h3>
	</div>
	<div class="locker_save_list">
		<ul>
			<c:forEach var="locker_list" items="${projectLockerList}">
				<li>
					<label><input type="checkbox">${locker_list.locker_name}</label><br>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
