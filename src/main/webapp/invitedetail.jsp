<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/invite_css.css">
</head>
<body>

	<div class="prdbx_wrap center-popup" id="inviteBox" style="width: 500px; height: 620px; z-index: 1100; display: block;">
    <input type="hidden" id="_INVITE_LINK" value="https://flow.team/Invite/1C7cg1u3dX0z1h3nj7oD9CK"> <!-- 링크 생성 -->
    <div class="prdbx_default" style="display:block">
        <div class="prdbx_df_top">
            <h1 id="invitePrjName">메인프로젝트</h1>
            <a class="btn_close" id="inviteBoxClose" title="닫기"></a>
        </div>
        <div class="prdbx_df_cn">
            <ul>
                <li id="emplDvsnInvite" class=""><!-- 활성화클래스 on -->
                    <span class="ico ico1"></span>
                    <span class="business"></span>
                    <p class="tit" data-langcode="CLP1173">팀, 직원 동료 초대</p>
                    <p class="txt" data-langcode="CLP1174">회사 직원 또는 조직도를 확인하고 초대할 수 있습니다.</p>
                </li>
                <li id="sendienceInvite" class="on">
                    <span class="ico ico2"></span>
                    <p class="tit" data-langcode="CLP1175">프로젝트 참여자</p>
                    <p class="txt" data-langcode="CLP1176">프로젝트를 함께 했던 사람을 초대할 수 있습니다.</p>
                </li>
                <li id="emailInvite" class="on">
                    <span class="ico ico3"></span>
                    <p class="tit" data-langcode="CLP1177">이메일로 초대장 발송</p>
                    <p class="txt" data-langcode="CLP1178">초대장을 이메일로 발송할 수 있습니다.</p>
                </li>
                <li id="inviteLink" class="on">
                    <span class="ico ico4"></span>
                    <p class="tit" data-langcode="CLP1179">초대링크</p>
                    <p class="txt"><a id="linkUrl" class="ellipsis">https://flow.team/Invite/1C7cg1u3dX0z1h3nj7oD9CK</a><a class="btn_url_copy"><span class="blind" data-langcode="CLP1180">복사하기</span></a></p>
                </li>
            </ul>
        </div>
    </div>
</div>




<!-- 프로젝트 참여자 부분 -->


	<div class="prdbx_wrap center-popup" id="inviteDetail" style="width: 500px; height: 620px; z-index: 1101; display: block;">


<!-- //초대하기 상세 -->

    <div class="prdbx_hd">
        <!-- 상단 타이틀 영역 -->
        <div class="prdbx_hd_top">
            <h1 data-langcode="CD780">초대하기</h1>
            <div class="btn_l"></div>
            <div class="btn_r"></div>
        </div>
        <!-- //상단 타이틀 영역 -->
        <!-- 검색영역 -->
        <div class="prdbx_hd_sch" id="invtSrchBox" style="display: block;">
            <div class="prd_schbx_in">
                <span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span><input type="text" id="invtSrchTxt" value="" class="ui-autocomplete-input" autocomplete="off" placeholder="함께 프로젝트를 진행했었던 사람들을 찾아보세요!">
                <div id="clearInvtSrchTxt" style="cursor: pointer; display: none; position: absolute; right: 16px; margin-top: 6px; background: url(&quot;images/btn_sch_del.png&quot;) 0px 0px / 15px no-repeat; width: 25px; height: 25px;"></div>
            </div>
        </div>
        <!-- //검색영역 -->
    </div>
    <div class="prdbx_cn" style="height: 464px;">
        <!-- 탭영역 -->
        <div class="prd_tab_wrap" id="tabForEmplDvsn" style="display: none;">
            <ul>
                <li class="on" id="empl"><a data-langcode="CL638">구성원</a></li><!-- 활성화클래스 on -->
                <li id="dvsn"><a data-langcode="FIL1572">조직도</a></li>
            </ul>
        </div>
        <!-- //탭영역 -->

        <!-- 참여자 선택 -->
        <div class="prd_namebx bline mCustomScrollbar _mCS_13 mCS_no_scrollbar" id="selectedItemList" style="display: none;"><div id="mCSB_13" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 90px;" tabindex="0"><div id="mCSB_13_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr"><!-- 라인있는 경우 bline 클래스 추가 -->
            <div class="prd_name_cn" id="selectedRcvrList">

            </div>
            <div class="prd_name_btn">
                <a class="all_del" data-langcode="FIL1573">전체 삭제</a>
            </div>
        </div><div id="mCSB_13_scrollbar_vertical" class="mCSB_scrollTools mCSB_13_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_13_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
        <!-- //참여자 선택 -->

        <!-- 조직도 부서 선택시 -->
        <div class="prd_gr_v" style="display:none;">
            <a id="btnDvsnDetailBack" style="display:inline-block;width:15px;height:15px;background:url(../img_rn/invite/btn_prd_gr_minus.gif?2);background-repeat: no-repeat;position:absolute;margin-top: 26px;"></a>
            <div class="prd_gr_txt" style="left: 25px;">
                <!-- 				<span class="ico_group on"></span>활성화클래스 on -->
                <strong></strong>
                <span class="no" style="display:none;"></span>
            </div>
            <div class="btn_r"><a class="btn_prd_add" data-langcode="FIL1574">전체 추가</a></div>
        </div>
        <!-- //조직도 부서 선택시 -->

        <!-- 동료(직원) 없음 -->
        <div class="prd_result_bx type2" style="display:none;" id="noResult">
            <div class="bg" style="background-image:none;">
                <p class="txt" data-langcode="FIL1575">동료(직원)을 초대해서 즐겁게 일하세요.</p>
                <p class="link" style="display:none;"><a id="teamUrl">http://madrascheck.flow.team</a></p>
            </div>
        </div>
        <!-- //동료(직원) 없음 -->

        <!-- 검색결과 없음 -->
        <div class="prd_result_bx" style="display:none;" id="noSrchResult">
            <div class="bg" style="background-image:none;">
                <p class="txt" data-langcode="FIL1576">검색결과가 존재하지 않습니다.</p>
            </div>
        </div>
        <!-- //검색결과 없음 -->

        <!-- 선택된 참여자 아이템 -->
        <div id="selectedItem" style="display:none;">
            <div class="nameTag_s" style="display:none;">
                <img src="/design3/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'">
                <strong data-langcode="H331">이름</strong>
                <button><span class="blind" data-langcode="H381">삭제</span></button>
            </div>
        </div>
        <!-- //선택된 참여자 아이템 -->

        <!-- 참여자/조직도 리스트 -->
        <div class="prdcn_scroll mCustomScrollbar _mCS_14" id="willBeInvitedItemList" style="height: 460px; display: block;"><div id="mCSB_14" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_14_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr"><!-- 기본 높이 464px / 탭만 있는 경우 412px / 탭 , 조직도 부서선택 있는경우 340px / 참여자 선택,탭 모두 있는 경우 290px -->
            <div class="prdcn_list">
                <ul><li class="invite_li on" style="display: block; cursor: pointer;" id="person_kakao_1396248157"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="/design3/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'" style="object-fit: cover;">
                <div class="prdcn_txt">
                    <p class="info"><strong>김경일</strong></p>
                    <p class="info_more" data-langcode="FIL1580"></p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443" rcvr_cd="kakao_1396248157" rcvr_nm="김경일" rcvr_gb="U">추가</a>
                </div>
            </li><li class="invite_li" style="display: block; cursor: pointer;" id="person_berlet52gmailcom"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="/design3/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'" style="object-fit: cover;">
                <div class="prdcn_txt">
                    <p class="info"><strong>김준형</strong>test</p>
                    <p class="info_more" data-langcode="FIL1580">test | test</p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443" rcvr_cd="berlet52@gmail.com" rcvr_nm="김준형" rcvr_gb="U">추가</a>
                </div>
            </li><li class="invite_li" style="display: block; cursor: pointer;" id="person_dbhssqogmailcom"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="/design3/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'" style="object-fit: cover;">
                <div class="prdcn_txt">
                    <p class="info"><strong>박원배</strong></p>
                    <p class="info_more" data-langcode="FIL1580"></p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443" rcvr_cd="dbhssqo@gmail.com" rcvr_nm="박원배" rcvr_gb="U">추가</a>
                </div>
            </li><li class="invite_li" style="display: block; cursor: pointer;" id="person_ahncountgmailcom"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="/design3/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'" style="object-fit: cover;">
                <div class="prdcn_txt">
                    <p class="info"><strong>안세영</strong></p>
                    <p class="info_more" data-langcode="FIL1580"></p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443" rcvr_cd="ahncount@gmail.com" rcvr_nm="안세영" rcvr_gb="U">추가</a>
                </div>
            </li><li class="invite_li" style="display: block; cursor: pointer;" id="person_madrascheck"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="https://platform.bizplay.co.kr/wecloud/20160629_22e7988a-7150-4585-a03c-3ec77106e66b_thum_300x300.jpg" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'" style="object-fit: cover;">
                <div class="prdcn_txt">
                    <p class="info"><strong>운영자</strong></p>
                    <p class="info_more" data-langcode="FIL1580">웹케시(주)</p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443" rcvr_cd="madrascheck" rcvr_nm="운영자" rcvr_gb="U">추가</a>
                </div>
            </li><li class="invite_li" style="display: block; cursor: pointer;" id="person_97dnjswhdgmailcom"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="https://flow.team/flowImg/FLOW_20200722826857_39de1aaa-f30e-494e-b525-fc6c3fa2219d.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'" style="object-fit: cover;">
                <div class="prdcn_txt">
                    <p class="info"><strong>홍길동</strong></p>
                    <p class="info_more" data-langcode="FIL1580"></p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443" rcvr_cd="97dnjswhd@gmail.com" rcvr_nm="홍길동" rcvr_gb="U">추가</a>
                </div>
            </li></ul>
            </div>
            <div class="prd_gr_list" style="display:none;">
                <ul></ul>
            </div>
        </div><div id="mCSB_14_scrollbar_vertical" class="mCSB_scrollTools mCSB_14_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><a href="#" class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div id="mCSB_14_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a href="#" class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
        <!-- //참여자/조직도 리스트 -->

        <!-- 리스트의 사람 아이템 -->
        <ul id="peopleItem" style="display:none;">
            <li class="invite_li"><!-- 활성화클래스 on --><!--  class="bg depth1 depth2 depth3" -->
                <span class="bg"></span>
                <img id="prflImg" src="/design3/img_rn/img_photo_null32.png" alt="" onerror="this.src='/design3/img_rn/img_photo_null32.png'">
                <div class="prdcn_txt">
                    <p class="info"><strong data-langcode="H331">이름</strong> <span data-langcode="CB1248">직책</span></p>
                    <p class="info_more" data-langcode="FIL1580">회사이름 | 부서명</p>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnPersonAdd" data-langcode="FA1443">추가</a>
                </div>
            </li>
        </ul>
        <!-- //리스트의 사람 아이템 -->

        <!-- 리스트의 부서 아이템 -->
        <ul id="dvsnItem" style="display:none;">
            <li class="invite_li"><!-- 활성화클래스 on -->
                <span class="bg"></span>
                <a class="btn_plus" id="treeOpenBtn" style="display:block;"></a><!-- btn_plus/btn_minus -->
                <div class="prd_gr_txt">
                    <!-- 		<span class="ico_group"></span> -->
                    <strong title="핀테크 그룹핀테크" data-langcode="FIL1582">핀테크 그룹핀테크</strong>
                    <span class="no" style="display:none;">155</span>
                </div>
                <div class="btn_r">
                    <a class="btn_prd_add" id="btnDvsnAdd" data-langcode="FIL1574">전체 추가</a>
                </div>
            </li>
        </ul>
        <!-- //리스트의 부서 아이템 -->


        <!-- 동료(직원) 없음 -->
        <div class="prd_result_bx type2" id="noEmpl" style="display:none;">
            <div class="bg" style="background-image:none;">
                <p class="txt" data-langcode="FIL1575">동료(직원)을 초대해서 즐겁게 일하세요.</p>
                <p class="link"><a href="#none">http://madrascheck.flow.team</a></p>
            </div>
        </div>
        <!-- //동료(직원) 없음 -->

        <!-- 검색결과 없음 -->
        <div class="prd_result_bx" id="noSrchResult" style="display:none;">
            <div class="bg" style="background-image:none;">
                <p class="txt" data-langcode="FIL1576">검색결과가 존재하지 않습니다.</p>
            </div>
        </div>
        <!-- //검색결과 없음 -->


        <div id="inviteViaEmail" style="z-index: 1002; display: none;">
            <!-- 초대장 발송 이메일목록 -->
            <div class="ivtemail_list_wrap">
                <div class="ivtemail_list">
                    <ul>
                        <li><input type="text" placeholder="example@flow.team"><a class="lineplus">추가</a><em>|</em><a class="linedelete" data-langcode="H381">삭제</a></li>
                        <li><input type="text" placeholder="example@flow.team"><a class="lineplus">추가</a><em>|</em><a class="linedelete" data-langcode="H381">삭제</a></li>
                        <li><input type="text" placeholder="example@flow.team"><a class="lineplus">추가</a><em>|</em><a class="linedelete" data-langcode="H381">삭제</a></li>
                        <li><input type="text" placeholder="example@flow.team"><a class="lineplus">추가</a><em>|</em><a class="linedelete" data-langcode="H381">삭제</a></li>
                        <li class="last"><input type="text" placeholder="example@flow.team" style="width: 372px;"><a class="lineplus" data-langcode="FA1443" style="display: inline;">추가</a><em style="display: inline;">|</em><a class="linedelete" data-langcode="H381">삭제</a></li>
                    </ul>
                </div>
            </div><!-- //초대장 발송 이메일목록 -->

            <!-- 초대장 내용 -->
            <div class="ivtemail_cont_wrap">
                <div style="color: blue;font-weight: bold;padding-bottom: 5px;padding-left:10px;">[<span data-langcode="FIL1583">아래 내용은 편집하실 수 있습니다.</span>]</div>
                <textarea class="ivtemail_cont">				</textarea>
            </div>
            <!-- //초대장 내용 -->
        </div>

    </div>
    <div class="prdbx_ft">
        <a class="btn_prd_sty1_b" id="inviteSelectedItem"><span data-langcode="CLP1085">초대</span></a>
    </div>
</div>



</body>
</html>