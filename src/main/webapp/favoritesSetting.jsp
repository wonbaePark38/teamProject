<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Plug</title>
<link href="css/favoritesSetting.css" rel="stylesheet" />
<script type="text/javascript" src="script/favoritesSetting.js"></script>
<script src="vendor/jquery/configScript.js"></script>
<script src="script/jquery-3.5.1-min.js"></script>
</head>

<body>
	<div class="wrap">
		
		<div class="centerArea">
			
			<div class="article">
				<header> 프로젝트 즐겨찾기 설정 </header>
				<div class="text-area">프로젝트 즐겨찾기 시, 프로젝트를 상단에 고정할 수 있도록 설정할 수
					있습니다.</div>
				<div class="setting-div">
					<div class="use-div">
						<input type="radio" name="usecheck" value="use">사용함
					</div>

					<div class="not-use-div">
						<input type="radio" name="usecheck" value="use">사용안함
					</div>
				</div>

				<div class="reset-div">
					<button type="button" onclick="reset();" id="reset-bt">
						<span>초기화</span>
					</button>
				</div>

				<div id="modal">
					<div class="modal-content">
						<h5>프로젝트에 표기한 모든 별도 표기를 초기화합니다.(복구 되지 않습니다)</h5>
						<button type="button" id="comfirm-cancle"
							onclick="settinCancel();">취소</button>
						<button type="button" id="confirm" onclick="settingConfirm()">확인</button>
					</div>


				</div>

				<div class="tutorial-div">
					<img src="images/bookmark_tutorial.png">
				</div>
			</div>
			<!-- end article -->
		</div>
		<!-- end centerarea -->
	</div>
</body>

</html>