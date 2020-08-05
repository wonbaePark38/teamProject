$(function() {

	$('#writeForm1_file_add').click(function(e) {

		e.preventDefault();

		$('#writeForm1_file').click();

	});

});

$(function() {

	$('#writeForm1_img_add').click(function(e) {

		e.preventDefault();

		$('#writeForm1_img').click();

	});

});


$(function() {

	$('#writeForm2_file_add').click(function(e) {

		e.preventDefault();

		$('#writeForm1_file').click();

	});

});

$(function() {

	$('#writeForm2_img_add').click(function(e) {

		e.preventDefault();

		$('#writeForm1_img').click();

	});

});









function fileCheck(obj) {
	
	var file_div = obj.parentNode.parentNode.childNodes[5];
	
	var filePoint = obj.value.lastIndexOf('\\');
	var fileName = obj.value.substring(filePoint + 1, obj.length);
	
	var fileSize = obj.files[0].size;
	
	
	console.log(fileName);
	console.log(fileSize);
	
	var ext_file_div = document.createElement('div');
	ext_file_div.setAttribute('style','width: 100%; padding: 10px; border: 1px solid black;');
	
		var ext_file_div_hidden = document.createElement('input');
		ext_file_div_hidden.setAttribute('type','hidden');
		ext_file_div_hidden.setAttribute('name','file_name');
		ext_file_div_hidden.setAttribute('value',fileName);
		
		ext_file_div.append(ext_file_div_hidden);
		
		var ext_file_div_img = document.createElement('img');
		ext_file_div_img.setAttribute('src','images/file_icon2_down.png');
		ext_file_div_img.setAttribute('style','display: inline-block');
		
		ext_file_div.append(ext_file_div_img);
		
		var ext_file_div_div = document.createElement('div');
		ext_file_div_div.setAttribute('style','display: inline-block; margin-left: 10px');
		
			var ext_file_div_div_p1 = document.createElement('p');
			ext_file_div_div_p1.innerText = fileName;
			ext_file_div_div_p1.setAttribute('style','display:block; margin-top: 0px; margin-bottom: 0px; font-size: 13px;');
		
			ext_file_div_div.append(ext_file_div_div_p1);
			
			var ext_file_div_div_p2 = document.createElement('p');
			ext_file_div_div_p2.innerText = fileSize + ' byte';
			ext_file_div_div_p2.setAttribute('style','margin-top: 0px; margin-bottom: 0px; font-size: 12px;');
			
			ext_file_div_div.append(ext_file_div_div_p2);
		
		ext_file_div.append(ext_file_div_div);
		
		var ext_file_div_cancle = document.createElement('div');
		ext_file_div_cancle.setAttribute('style','display: inline-block; text-align:right; padding-bottom: 7px;');
		
			var ext_file_div_cancle_a = document.createElement('a');
			ext_file_div_cancle_a.setAttribute('style','display: inline-block; text-align: center; vertical-align: middle; border: 1px solid black; width: 50px; height: 20px; padding-bottom: 3px; border-radius: 20px;');
			
			ext_file_div_cancle.append(ext_file_div_cancle_a);
		
		ext_file_div.append(ext_file_div_cancle);
		
		file_div.appendChild(ext_file_div);
}

function imgCheck(obj) {
	
	imgPoint = obj.value.lastIndexOf('.');
	extName = obj.value.substring(imgPoint + 1,obj.length);
	fileType = extName.toLowerCase();
	
	var imgPointCut = obj.value.lastIndexOf('\\');
	var imgName = obj.value.substring(imgPointCut + 1, obj.length);
	
	if(fileType == 'jpg'||fileType == 'png'||fileType == 'gif'){
		
		var ext_file_div = document.createElement('div');
		ext_file_div.setAttribute('style','width: 100%; padding: 10px; border: 1px solid black;');
		
			var ext_file_div_hidden = document.createElement('input');
			ext_file_div_hidden.setAttribute('type','hidden');
			ext_file_div_hidden.setAttribute('name','img_name');
			ext_file_div_hidden.setAttribute('value',imgName);
			
			ext_file_div.append(ext_file_div_hidden);
			
			var ext_file_div_img = document.createElement('img');
			ext_file_div_img.setAttribute('src','images/file_icon2_down.png');
			ext_file_div_img.setAttribute('style','display: inline-block');
			
			ext_file_div.append(ext_file_div_img);
			
			var ext_file_div_div = document.createElement('div');
			ext_file_div_div.setAttribute('style','display: inline-block; margin-left: 10px');
			
				var ext_file_div_div_p1 = document.createElement('p');
				ext_file_div_div_p1.innerText = imgName;
				ext_file_div_div_p1.setAttribute('style','display:block; margin-top: 0px; margin-bottom: 0px; font-size: 13px;');
			
				ext_file_div_div.append(ext_file_div_div_p1);
				
				var ext_file_div_div_p2 = document.createElement('p');
				
				ext_file_div_div_p2.setAttribute('style','margin-top: 0px; margin-bottom: 0px; font-size: 12px;');
				
				ext_file_div_div.append(ext_file_div_div_p2);
			
			ext_file_div.append(ext_file_div_div);
			
			var ext_file_div_cancle = document.createElement('div');
			ext_file_div_cancle.setAttribute('style','display: inline-block; text-align:right; padding-bottom: 7px;');
			
				var ext_file_div_cancle_a = document.createElement('a');
				ext_file_div_cancle_a.setAttribute('style','display: inline-block; text-align: center; vertical-align: middle; border: 1px solid black; width: 50px; height: 20px; padding-bottom: 3px; border-radius: 20px;');
				
				ext_file_div_cancle.append(ext_file_div_cancle_a);
			
			ext_file_div.append(ext_file_div_cancle);
			
		document.getElementById('writeForm1_uploadImg').appendChild(ext_file_div);
		

			
	}else{
		alert('이미지 파일이 아닙니다.')
		return false;
	}
}
