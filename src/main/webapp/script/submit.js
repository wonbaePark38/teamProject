//submit

function writeForm_submit1() {
	var form1 = document.getElementById('writeForm1_form');
	if ($('#writeForm1_content_text').val() == '' || $('#writeForm1_content_text').val() == null) {
		alert('내용을 입력해주세요');
	} else {
		form1.submit();
	}
	
	
}

function writeForm_submit2() {
	var form2 = document.getElementById('writeForm2_form');
	if ($('#writeForm2_title').val() == '' || $('#writeForm2_title').val() == null) {
		alert('제목을 입력해주세요');
	} else if ($('#writeForm2_content_text').val() == '' || $('#writeForm2_content_text').val() == null) {
		alert('내용을 입력해주세요');
	} else {
		form2.submit();
	}
	
	
}

function writeForm_submit3() {
	var form3 = document.getElementById('writeForm3_form');
	
	var work_workers = '';
	var work_workers_id = '';
	$('#work_workers').val(work_workers);
	$('#work_workers_id').val(work_workers_id);
	$('.task_User_on').each(function(){
		work_workers += ($(this).text()+',');
		work_workers_id += ($(this).prev().val()+',');
	});
	$('#work_workers').val(work_workers);
	$('#work_workers_id').val(work_workers_id);
	
	if ($('#Form3_title').val() == '') {
		alert('업무명을 입력해주세요.');
	} else if (work_workers == '') {
		alert('담당자를 선택해주세요.');
	} else{
		
		form3.submit();
	}
	
}

function writeForm_submit4() {
	var form4 = document.getElementById('writeForm4_form');
	if ($('#writeForm4_title').val() == '') {
		alert('제목을 입력해주세요.');
	} else if ($('#sche_start_date').val() == '' || $('#sche_end_date').val() == '') {
		alert('일정을 선택해주세요.');
	} else {
		form4.submit();
	}
	
}


$(document).on('click','#writeForm5_submit',function(){
		
		var form5 = document.getElementById('writeForm5_form');
		var bl = true;
		$('#todoContent_external').find('input').each(function(){
			if ($(this).attr('class') == 'todo_content' && $(this).val() == '') {
				alert('할일을 입력해주세요.');
				bl = false;
				return false;
			} else if ($(this).attr('class') == 'todo_date' && $(this).val() == '') {
				alert('일자를 정해주세요.')
				bl = false;
				return false;
			} else if ($(this).attr('class') == 'todo_worker' && $(this).val() == '') {
				alert('담당자를 정해주세요.')
				bl = false;
				return false;
			}
		});
		if (bl == true) {
			var contents = ""; 
			$('.todo_content').each(function(){
				contents += ($(this).val())+',';
			});
			var dates = "";
			$('.todo_date').each(function(){
				dates += ($(this).val())+',';
			});
			var workers = "";
			$('.todo_worker').each(function(){
				workers += ($(this).val())+','; 
			});
			
			$('input[name=writeForm5_content]').attr('value',contents);
			$('input[name=writeForm5_date]').attr('value',dates);
			$('input[name=writeForm5_worker]').attr('value',workers);
			
			form5.submit();
		}
		
		
	});
	
