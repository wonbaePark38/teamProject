/**
 * 프로젝트 관리 페이지 자바스크립트 파일
 */
var memberList = [];
$(document).ready(function(){
	var myEmail = $('#my-email').val();
	sessionStorage.setItem("myEmail",myEmail);
	$("#mCSB_13_container > table > tbody > tr").click(function() {
		$('#mngr_tbody2').children().remove(); //초기화
		$(".bgmodal_wrap").css("display", "flex");
		
		$.ajax({
			type:'POST',
			url:'getMemberInfo.do'
		}).done(function(data){
			memberList = [];
			$.each(data,function(index,element){
				settingList(element);
				memberList.push(element);
			});
		}).fail(function(){
			alert('정보 가져오기 실패');
		});
	})

	$(".pop_close").click(function() {
		if($(".bgmodal").css("display") == "block") {
			$(".bgmodal").css("display", "none");
			$(".layer_popup_wrap").css("display", "none");	
		} else if($(".bgmodal_wrap").css("display") == "block") {
			$(".bgmodal_wrap").css("display", "none");
		}
	});

	$("#mngrAdd2").click(function() {
		$(".bgmodal").css("display", "block");
		$(".layer_popup_wrap").css("display", "block");
		$('#comm_user_tbody2').children().remove();
		
		$.each(memberList,function(index,element){
			if(element.managerStatus == 0){
				$('#comm_user_tbody2').append(
						"<tr>" +
							"<input type='hidden' value="+element.userId+">"+
							"<td class='nomal_name'>"+element.name+"</td>" +
							"<td class='nomal_email'>"+element.email+"</td>" +
							"<td>&nbsp;<a href='javascript:void(0)' class='out_bt tbold_uline admin-release' onclick='addManager();'>관리자 등록</a></td>" +
						"</tr>");
			}
		});
	});

	$('.modal_pop_close').click(function(){
		$('.bgmodal_wrap').css('display','none');
	})

	$('#cancel-bt').click(function(){
		$('.bgmodal_wrap').css('display','none');
	})
	
	$('.bgred').click(function(){
		var inputValue = confirm('프로젝트가 삭제됩니다. \n정말 삭제 하시겠습니까?');
		if(inputValue){
			$.ajax({
				type : 'POST',
				url : 'deleteProject.do'
			}).done(function(){
				location.href = 'projectdir.do';	
			}).fail(function(){
				alert('삭제 실패')
			})
		}
	});
	
	
	 
    $("#comm_user_srch_word2").keyup(function(e){ //검색
		  var searchCondition = $('#comm_user_catg2').val();
		  var keyword = $(this).val();
		  $('#comm_user_tbody2').children('tr').hide();
		  
		  if(searchCondition == '이름'){
			  var listDiv = $(".nomal_name:contains('" + keyword + "')");
		  }else if(searchCondition == '이메일'){
			  var listDiv = $(".nomal_email:contains('" + keyword + "')");
		  }
		  $(listDiv).parent().show();
	});
    
});

function settingList(element){
	if(element.managerStatus == 1){
		$('#mngr_tbody2').append(
				"<tr>" +
					"<input type='hidden' value="+element.userId+">"+
					"<td class='username'>"+element.name+"</td>" +
					"<td><span class='user_ids'>"+element.email+"</span></td>" +
					"<td>"+element.phoneNumber+"</td>" +
					"<td>"+element.companyName+"</td>" +
					"<td>"+element.department+"</td>" +
					"<td>&nbsp;<a href='javascript:void(0)' class='out_bt tbold_uline admin-release' onclick='deleteManager();'>관리자[해제]</a></td>" +
				"</tr>");
	}
}

function deleteManager(){
	var target = event.target;
	var name = $(target).parent().parent().children('.username').text();
	var targetId = $(target).parent().parent().children('input').val();
	var myId = $('#my-id').val();
	sessionStorage.setItem("myId",myId);
	
	if(targetId == myId){
		alert('자기 자신은 메니저에서 해임할 수 없습니다.');
		return false;
	}
	var inputValue = confirm(name+' 메니저에서 해임하시겠습니까?');
	
	var sendData = {
		userId : $(target).parent().parent().children('input').val()
	} 
	if(inputValue){
		$.ajax({
			type : 'POST',
			url : 'deleteManager.do',
			data : sendData
		}).done(function(){
			resetList(target);
			alert(name + ' 님이 메니저에서 해임되었습니다');
			location.reload();
			$.each(memberList,function(index,element){
				if(element.userId == targetId){
					element.managerStatus = 0;
				}
			});
		}).fail(function(){
			alert('통신실패');
		})
	}
}

function addManager(){
	var target = event.target;
	var name = $(target).parent().prev().prev().text();
	var targetId = $(target).parent().parent().children('input').val();
	var inputValue = confirm(name+' 메니저로 등록하시겠습니까?');
	var sendData = {
			userId : $(target).parent().parent().children('input').val()
		} 
	if(inputValue){
		$.ajax({
			type : 'POST',
			url : 'addManager.do',
			data : sendData
		}).done(function(){
			alert(name + ' 님이 메니저로 등록되었습니다.');
			$.each(memberList,function(index,element){
				if(element.userId == targetId){
					element.managerStatus = 1;
					settingList(element);
					appendManager(element.name);
				}
			});
			resetList(target);
		}).fail(function(){
			alert('통신실패');
		})
	}
}

function resetList(target){
	$(target).parent().parent().remove();
}

function appendManager(name){
	var managerName = $('#manager-name').text();
	managerName += ',' + name;
	$('#manager-name').text(managerName);
}


