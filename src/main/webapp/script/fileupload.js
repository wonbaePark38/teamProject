

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

      $('#writeForm2_file').click();

   });

});

$(function() {

   $('#writeForm2_img_add').click(function(e) {

      e.preventDefault();

      $('#writeForm1_img').click();

   });

});


$(function() {

   $('#writeForm3_file_add').click(function(e) {

      e.preventDefault();

      $('#writeForm3_file').click();

   });

});

$(function() {

   $('#writeForm3_img_add').click(function(e) {

      e.preventDefault();

      $('#writeForm3_img').click();

   });

});







function fileCheck(obj,id) {
   
   var file_name_param = obj.parentNode.parentNode.parentNode.childNodes[1];
   var file_size_param = obj.parentNode.parentNode.parentNode.childNodes[3];
   
   var filePoint = obj.value.lastIndexOf('\\');
   var fileName = obj.value.substring(filePoint + 1, obj.length);
   
   var fileSize = obj.files[0].size;
   
   file_name_param.value = fileName;
   file_size_param.value = fileSize;
   
   console.log(file_name_param.value);
   console.log(file_size_param.value);
   
   
   id.childNodes[1].childNodes[3].childNodes[1].innerText = fileName;
   id.childNodes[1].childNodes[3].childNodes[3].innerText = fileSize + ' bytes';
   
   console.log(id);
   
   id.style.display = 'block';
   
   
}

function imgCheck(obj,id) {
   
   var img_name_param = obj.parentNode.parentNode.parentNode.childNodes[5];
   var img_size_param = obj.parentNode.parentNode.parentNode.childNodes[7];
   console.log(obj);
   console.log(img_name_param);
   console.log(img_size_param);
   imgPoint = obj.value.lastIndexOf('.');
   extName = obj.value.substring(imgPoint + 1,obj.length);
   fileType = extName.toLowerCase();
   
   var imgPointCut = obj.value.lastIndexOf('\\');
   var imgName = obj.value.substring(imgPointCut + 1, obj.length);
   var imgSize = obj.files[0].size;
   console.log(imgName);
   console.log(fileType);
   
   if(fileType == 'jpg'||fileType == 'png'||fileType == 'gif'){
      img_name_param.value = imgName;
      img_size_param.value = imgSize;
      console.log('test : ',id.childNodes[1].childNodes[5].childNodes[3]);
      
      console.log(id);
      
      id.childNodes[1].childNodes[5].childNodes[1].innerText = imgName;
      id.childNodes[1].childNodes[5].childNodes[3].innerText = imgSize + ' bytes';
         
      
      
      id.style.display = 'block';
   }else{
      alert('이미지 파일이 아닙니다.');
      return false;
   }
   
   id = null;
}
