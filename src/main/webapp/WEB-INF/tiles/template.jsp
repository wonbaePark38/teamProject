<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 layout</title>
<style>
	#header{
		height:80px;
	}
	
	#main{
	display: flex;
    flex-direction: row;
    margin: 0 auto;
    margin-top: -10px;
	}
</style>
</head>
<body>
<div id="header"><tiles:insertAttribute name="header" /></div>
	
		
 		<div id="main"><tiles:insertAttribute name="body" /></div> 


</body>
</html>