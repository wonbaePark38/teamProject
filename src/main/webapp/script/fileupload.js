

$(function() {

   $('#writeForm1_file_add').click(function(e) {
	   
      e.preventDefault();
      

      $('#writeForm1_file').click();

   });

});



$(function() {

   $('#writeForm2_file_add').click(function(e) {

      e.preventDefault();

      $('#writeForm2_file').click();

   });

});



$(function() {

   $('#writeForm3_file_add').click(function(e) {

      e.preventDefault();

      $('#writeForm3_file').click();

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

