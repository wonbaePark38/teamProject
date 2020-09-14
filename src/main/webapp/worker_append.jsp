<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<div id="todo_div">
		<hr>
		<a onclick="" style="display: inline-block; width: 18px; height: 18px; background: url(images/btn_todo_checkbox.png) no-repeat 0 -85px;"></a>
		<input type="text" class="todo_content" placeholder="할일 입력" style="border-style: none; width: 70%; margin-left: 3px; margin-right: 5.5px;" oninput="writeForm5_content_arr(this,0)">
		<div id="todo_date_pick_div" style="width: 11%; display: inline-block;"><input type="text" class="todo_date hasDatepicker" placeholder="일자" readonly="true" style="width: 91%; margin-left: 0px;" onclick="javascript:$(this).datepicker({dateFormat: &quot;mm/dd&quot;});" onchange="writeForm5_date_arr(this,0)" id="dp1599982855958"></div>
		<div id="todo_worker_pick_div" style="width: 11%; display: inline-block; position: relative;"><input type="text" id="workerInputId" class="todo_worker" placeholder="인원" readonly="true" style="width: 91%; margin-left: 0px;" onclick="worker_pick(&quot;input_workerInputId&quot;)">
			<div id="input_workerInputId" class="todo_worker_select_div" style="display: block; z-index: 99; width: 150px; max-height: 140px; background-color: white; position: absolute; overflow-y: scroll; border-radius: 5px; border: 2px solid black;">
				<ul style="list-style: none; padding-left: 10px; position: absolute;">
					<li>
						<a id="member_a" name="장원종" >장원종</a>
					</li>
				</ul>	
			</div>
		</div>
	</div>
</html>