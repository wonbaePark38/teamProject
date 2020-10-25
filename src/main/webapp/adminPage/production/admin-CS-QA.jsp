<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">

    <link href="css/maps/myCss.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view" style="width: 100%;">
            
            <br />

            <!-- sidebar menu -->
            <a style="display: inline-block; width: 80px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;" onclick="changePass()">비밀번호변경</a>
	                <a style="display: inline-block; width: 60px; height: 20px; padding-top: 2px; margin-left: 10px; text-align: center; cursor: pointer; vertical-align: middle; color: white;" href="adminLogout.do">로그아웃</a>
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  
                 <li><a><i class="fa fa-edit"></i> 회원<span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="getUserManager.do">회원 관리</a></li>
	                      <li><a href="searchUser.do">회원 검색</a></li>
	                      <li><a href="getUserLog.do">회원 로그</a></li>
	                    </ul>
	                  </li>
	
	
	                  <li><a><i class="fa fa-desktop"></i> 프로젝트<span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="projectArticle.do">게시글</a></li>
	                      <li><a href="projectInfo.do">프로젝트</a></li>
	                    </ul>
	                  </li>
	                  
	                  <li><a><i class="fa fa-sitemap"></i> CS <span class="fa fa-chevron-down"></span></a>
	                    <ul class="nav child_menu">
	                      <li><a href="qnaBoardList.do">1:1 문의</a></li>
	                    </ul>
	                  </li>                  

                  
                  
                </ul>
              </div>

              

            </div>
            <!--  //side bar  -->
          </div>
        </div>

       

        <!-- page content -->
        <div class="right_col" role="main">
            <div style="width: 100%;">
                <div>
                  <span><h1><strong>고객 문의 QA</strong></h1></span>
                  <hr>
                </div>

                <div id="admin_cs_qa_contentArea">
                    <table>
                        <tr>
                            <th class="admin_cs_qa_contentArea_no">번호</th>
                            <th class="admin_cs_qa_contentArea_writer">작성자</th>
                            <th class="admin_cs_qa_contentArea_title">제목</th>
                            <th class="admin_cs_qa_contentArea_regDate">작성일</th>
                            <th class="admin_cs_qa_contentArea_reply">답변여부</th>
                        </tr>
                        <c:forEach var="board" items="${boardList }">
							<tr>
								<td class="admin_cs_qa_contentArea_no">${board.seq }</td>
								<td class="admin_cs_qa_contentArea_writer">${board.writer }</td>
								<td class="admin_cs_qa_contentArea_title"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
								<td class="admin_cs_qa_contentArea_regDate"><fmt:formatDate value="${board.time }" pattern="yyyy-MM-dd"/></td>
								<td class="admin_cs_qa_contentArea_reply">${board.reply }</td>
							</tr>
						</c:forEach>
                        
                    </table>
                    <div id="admin_cs_qa_contentArea_search">
                        <form action="qnaBoardList.do" method="post">
								<select name="searchCondition">
									<c:forEach items="${conditionMap }" var="option">
										<option value="${option.value }">${option.key }</option>
									</c:forEach>
								</select>
								<input type="text" name="searchKeyword" />
								<input type="submit" value="검색" />
						</form>
                    </div>
                </div>
                
            </div>
        </div>
        <!-- //page content -->
      </div>
    </div>

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <!-- DateJS -->
        <script src="../vendors/DateJS/build/date.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
