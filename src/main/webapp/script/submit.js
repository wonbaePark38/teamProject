//submit

function writeForm_submit1() {
	var form1 = document.getElementById('writeForm1_form');
	
	
	
	form1.submit();
}

function writeForm_submit2() {
	var form2 = document.getElementById('writeForm2_form');
	
	
	
	form2.submit();
}

function writeForm_submit3() {
	var form3 = document.getElementById('writeForm3_form');
	if ($('#work_workers').attr('value')== null) {
		alert('담당자를 선택해주세요.');
	} else{
		form3.submit();
	}
	
}

function writeForm_submit4() {
	var form4 = document.getElementById('writeForm4_form');
	if ($('#writeForm4_title').attr('value') == null) {
		alert('제목을 입력해주세요.');
	} else if ($('#sche_start_date').attr('value') == null || $('#sche_end_date').attr('value') != null) {
		alert('일정을 선택해주세요.');
	} else {
		form4.submit();
	}
	
}

function writeForm_submit5() {
	var form5 = document.getElementById('writeForm5_form');
	
	if ($('#todo_title').attr('value') == null) {
		alert('제목을 입력해주세요');
	} else if ($('#todo_content').attr('value') == null) {
		alert('할일을 입력해주세요.');
	} else if ($('#todo_date').attr('value') == null) {
		alert('일자를 정해주세요.')
	} else if ($('#workerInputId').attr('value') == null) {
		alert('담당자를 정해주세요.')
	} else {
		var contents = null; 
		$('.todo_content').each(function(){
			contents += ($(this).attr('value'))+',';
		});
		var dates = null;
		$('.todo_date').each(function(){
			dates += ($(this).attr('value'))+',';
		});
		var workers = null;
		$('.workerInputId').each(function(){
			workers = ($(this).attr('value'))+','; 
		});
		
		contents = contents.slice(0,-1);
		dates = dates.slice(0,-1);
		workers = workers.slice(0,-1);
		$('input[name=writeForm5_content]').attr('value',contents);
		$('input[name=writeForm5_date]').attr('value',dates);
		$('input[name=writeForm5_worker]').attr('value',workers);
		
		form5.submit();
	}
	
}