<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="script/jquery-3.5.1-min.js"></script>
<meta charset="UTF-8">
<title>Plug</title>
<script>
	$(document).on('click','.qna_btn',function(){

		if ($(this).attr('name') == 'qna_success') {
			var title = $('#qna_title').val();
			var content = $('#qna_content').val();
			
			// form 생성
			var qna_form = $('<form></form>');
			
			// form 설정
			qna_form.attr('method','post');
			qna_form.attr('action','insertQnA.do');
			// form 데이터
			qna_form.append($('<input/>',{type:'hidden', name:'title', value: title}));
			qna_form.append($('<input/>',{type:'hidden', name:'content', value: content}));
			
			// form 생성하는 곳
			qna_form.appendTo('body');
			qna_form.submit();
		} else if ($(this).attr('name') == 'qna_cancel') {
			$('.qna_div').remove();
		}
	});
</script>
</head>
<body>
	
<div class="qna_div">

	<div class="background_shadow" style="z-index: 9000; position: absolute;"></div>
	<div class="layerstyle4" style="width: 400px; height: 320px; text-align: center;  z-index: 9001; position: absolute; border-top-left-radius: 10px; border-top-right-radius: 10px;" >
		<div style="background-color: #fff; height: 100%;border-top-left-radius: 10px; border-top-right-radius: 10px;">
			<div style="background-color: #f2f3f4; width: 100%; height: 50px; padding-top: 10px; font-size: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">
				<span >1:1 문의함</span>
			</div>
			<div style="padding-top:15px; border-top-left-radius: 10px; border-top-right-radius: 10px;">
				<input type="text" id="qna_title" placeholder="제목을 입력하세요." name="qna_title" style="width: 90%; float: inherit;">
				<textarea name="qna_content" id="qna_content" placeholder="설명글을 입력할 수 있습니다." rows="1" style="min-height: 70px;  max-height: 150px;  overflow: auto; min-width: 362px; height: 432px; max-width: 90%; margin: 10px 0px; width: 457px;"></textarea>
			</div>
			<span>
				<input type="button" class="qna_btn" name="qna_success" value="확인" style="margin-right: 20px; width: 80px; height: 30px;">
				
				<input type="button" class="qna_btn" name="qna_cancel" value="취소" style=" width: 80px; height: 30px;"/>
			</span>
		</div>
		
	</div>
</div>
</body>

</html>