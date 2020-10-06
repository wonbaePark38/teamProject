

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
   var dataSize;
   var fileSize = obj.files[0].size;
   if (fileSize < 1048576) {
	   dataSize = "Kb";
	   fileSize = Math.ceil(fileSize/1024);
   } else if (fileSize > 1048576) {
	   dataSize = "Mb";
	   fileSize = Math.ceil(fileSize/1048576);
   }
   file_name_param.value = fileName;
   file_size_param.value = fileSize+dataSize;
   
   
   id.childNodes[1].childNodes[3].childNodes[1].innerText = fileName;
   id.childNodes[1].childNodes[3].childNodes[3].innerText = fileSize+dataSize;
   
   
   id.style.display = 'block';
   
   
}

