<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link rel="stylesheet" href="css/admin.css">	
</head>
<body>
	<div class="office_user_setting">
		<div class="ous_top">
			<h2 style="font-weight: normal;">사용자 등록<a style=" float: right;padding: 0 10px;">X</a></h2>
		</div>
		<div class="ous_body">
			<h3>필수정보</h3>
			<table>
				<colgroup>
					<col style="width: 30%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th class="ous_th">이름*</th>
						<td class="ous_td"><input class="ous_input" type="text" placeholder="이름을 입력해주세요."></td>
					</tr>
					<tr>
						<th class="ous_th">이메일*</th>
						<td class="ous_td"><input class="ous_input" type="text" placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<th class="ous_th">비밀번호*</th>
						<td class="ous_td"><input class="ous_input" type="text" placeholder="비밀번호는 6자 이상 영문,숫자만 가능합니다."></td>
					</tr>
				</tbody>
			</table>
			<div class="hr"></div>

			<h3 style="border: 0px;">추가정보입력</h3>
			<table>
				<colgroup>
					<col style="width: 30%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th class="ous_th">부서명</th>
						<td class="ous_td"><input class="ous_input" type="text" placeholder="부서명을 입력해주세요."></td>
					</tr>
					<tr>
						<th class="ous_th">직책</th>
						<td class="ous_td"><input class="ous_input" type="text" placeholder="직책을 입력해주세요."></td>
					</tr>
					<tr>
						<th class="ous_th">휴대폰번호</th>
						<td class="ous_td"><input class="ous_input" type="text" placeholder="휴대폰번호는 '-'를 제외하고 입력해주세요."></td>
					</tr>
				</tbody>
			</table>
			<p>※ 사용자 등록 후, "이메일 주소/비밀번호"를 입력하여 로그인 가능합니다.</p>
			<p>※ 비밀번호는 웹화면 [설정>비밀번호 변경]메뉴에서 추후 변경할 수 있습니다.</p>
			<div class="btn" style="margin-top: 15px; text-align: center; width: 100%;">
				<a class="yes">저장</a>
				<a class="no">취소</a>
			</div>
		</div>			
	</div>
	<div class="background_shadow" style="z-index: 200;"></div>
</body>
</html>