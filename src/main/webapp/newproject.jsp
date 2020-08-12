<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/newproject_css.css">
<script src="script/projectdir.js"></script>
<form action="newproject.do" id="newproject" method="post">

<input type="hidden" name="project_manager" value="0">
<input type="hidden" name="project_type" value="0">

<div class="background_shadow" style="z-index: 9000; position: absolute;"></div>
	<div class="layerstyle4" style="width: 500px; z-index: 9001" >
		<div id="projectOptionLayer" class="layerstyle4_po" style="display: block;">
			<div class="layerstyle4_title">
				<h3>프로젝트 만들기</h3>
				<a id="flowMakeCloseBtn" class="btn_layerstyle4_close" onclick="">
					<img alt="닫기" src="images/btn_layerstyle3_close.gif">
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
				
				<dl class="nwroptn_box">
					<dt>
						<a style="background:none;cursor:default;">옵션 설정</a>
					</dt>
					<dd style="margin: 0px;">
						<ul style="margin-block-start: 0em; margin-block-end: 0em;">
							<li class="ico3">
								<div class="left">관리자 승인 후 참여가능</div>
								<div class="right">
									<label class="switch-35" for="JNNG_ATHZ_YN">
										<input type="checkbox" id="JNNG_ATHZ_YN">
										<span class="btn-switch">
											<span></span>
										</span>
									</label>
								</div>
							</li>
							
							<li id="optionMore" class="ico5">
								<div class="left">
									<a>옵션 더보기</a>
								</div>
							</li>
						</ul>
					</dd>
				</dl>
				
				<div class="t_center" style="margin-top:30px;">
					<a id="flowMakeBtn" type="button" class="new_btnstyle50 on" onclick="newproject()">프로젝트 생성</a>
				</div>
			</div>
		</div>
	</div>
</form>