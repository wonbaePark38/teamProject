<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/newproject.css">
<script src="script/projectdir.js"></script>

<div id="new_project_div">
<div class="background_shadow" style="z-index: 9000; position: absolute;"></div>
	<div class="layerstyle4" style="width: 500px; z-index: 9001" >
		<div id="projectOptionLayer" class="layerstyle4_po" style="display: block;">
			<div class="layerstyle4_title">
				<h3>프로젝트 만들기</h3>
				<a id="flowMakeCloseBtn" class="btn_layerstyle4_close" onclick="projectPopdel()">
					<img alt="닫기" src="./images/btn_layerstyle4_close.png">
				</a>
			</div>
			<div class="newrm_wrap" style="background-color: #fff;">
				<dl class="nwrtitle_box">
					<dt>
						<input name="project_name" id="COLABO_TTL" placeholder="프로젝트 제목을 입력하세요" rows="1" class="autosize" style="max-height: 59px;" maxlength="50">
					</dt>
					<dd style="padding: 0; margin: 0px;">
						<textarea name="project_content" id="COLABO_CNTN" placeholder="설명글을 입력할 수 있습니다." rows="1" class="autosize" style="max-height: 90px; overflow: auto; padding: 9px; height: 55px;"></textarea>
					</dd>
				</dl>
				
				
				<div class="t_center" style="margin-top:30px;">
					<a id="flowMakeBtn" type="button" class="new_btnstyle50 on" onclick="new_project_form()">프로젝트 생성</a>
				</div>
			</div>
		</div>
	</div>
</div>