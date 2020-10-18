<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plug</title>
<link rel="stylesheet" href="css/admin.css">
<script src="script/jquery-3.5.1-min.js"></script>	
<script>
	$(function(){
		$('.top_menu').click(function(){
		    var id_check = $(this).attr("id");
		    $('div[class^=content_menu]').hide();
			$(id_check).show();
		});
	});

</script>

</head>
<body>
	<div class="admin_contents">
		<header>회사정보</header>
		<div class="user_data">
			<a class="top_menu" id="success"><span>정상<span id="ud_success">(1)</span></span></a>
			<a class="top_menu" id="block"><span>이용중지<span id="ud_block">(0)</span></span></a>
			<a class="top_menu" id="waiting"><span>가입대기<span id="ud_waiting">(0)</span></span></a>
		</div>
		<div class="srch_table_div">
			<table class="srch_table">
				<colgroup>
					<col style="width: 110px;">
					<col style="width: 230px;">
					<col style="width: 100%;">
					<col style="width: 310px;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" style="padding-right: 10px;">
							<select style="width: 100%;">
								<option>이름</option>
								<option>부서</option>
								<option>직책</option>
								<option>이메일</option>
								<option>휴대폰</option>
							</select>
						</th>
						<td>
							<input type="text"placeholder="검색어를 입력해주세요.">
						</td>
						<td>
							<a class="btn btn_srchbtn">검색</a>
						</td>
						<td style="text-align: right;">
							<a class="btn plus_btn"><span>+사용자 등록</span></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="content_menu" id="success" style="display: block;">
			<div class="user_data_list" style="padding-top: 30px;">
				<table>
					<colgroup>
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="width: 18%;">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"style="cursor: pointer;">회사<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">이름<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">부서<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">직책<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">이메일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">휴대폰<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">가입일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">접속일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">접속장치</th>
							<th scope="col"style="cursor: pointer;">상태</th>
							<th scope="col"style="cursor: pointer;">관리자<a>▽</a></th>
						</tr>
					</thead>
				</table>
			</div>
			
			
			<div class="user_article">
				<table>
					<colgroup>
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="width: 18%;">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<tbody >
						<tr id="user_article_list">
							<td class="cn">dnjswhdzld</td>
							<td class="id">장원종</td>
							<td class="dv">부서</td>
							<td class="jb">직책</td>
							<td class="em">이메일</td>
							<td class="hp">휴대폰</td>
							<td>가입일</td>
							<td>접속일</td>
							<td>2&nbsp;<a>[보기]</a></td>
							<td>정상&nbsp;<a>[중지]</a></td>
							<td><span>관리자</span><a>[헤제]</a>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<div class="content_menu" id="block" style="display: none;">
			<div class="user_data_list" style="padding-top: 30px;">
				<table>
					<colgroup>
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="width: 18%;">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"style="cursor: pointer;">회사<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">이름<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">부서<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">직책<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">이메일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">휴대폰<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">가입일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">접속일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">접속장치</th>
							<th scope="col"style="cursor: pointer;">상태</th>
							<th scope="col"style="cursor: pointer;">관리자<a>▽</a></th>
						</tr>
					</thead>
				</table>
			</div>
			
			
			<div class="content_menu" class="user_article">
				<table>
					<colgroup>
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="width: 18%;">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<tbody >
						<tr id="user_article_list">
							<td class="cn">dnjswhdzld</td>
							<td class="id">장원종</td>
							<td class="dv">부서</td>
							<td class="jb">직책</td>
							<td class="em">이메일</td>
							<td class="hp">휴대폰</td>
							<td>가입일</td>
							<td>접속일</td>
							<td>2&nbsp;<a>[보기]</a></td>
							<td>정상&nbsp;<a>[중지]</a></td>
							<td><span>관리자</span><a>[헤제]</a>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		
		<div id="waiting" style="display: none;">
			<div class="user_data_list" style="padding-top: 30px;">
				<table>
					<colgroup>
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"style="cursor: pointer;">이름<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">이메일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">가입 요청일<a>▽</a></th>
							<th scope="col"style="cursor: pointer;">설정<a>▽</a></th>
						</tr>
					</thead>
				</table>
			</div>
			
			<div class="user_article">
				<table>
					<colgroup>
						<col style="">
						<col style="">
						<col style="">
						<col style="">
					</colgroup>
					<tbody >
						<tr id="user_article_list">
							<td class="id">장원종</td>
							<td class="em">이메일</td>
							<td>가입요청일</td>
							<td class="set">설정</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


	</div>
	

</body>
</html>