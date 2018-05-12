
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>欢迎登录酒店管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap-responsive.css"></link>
  <script type="text/javascript" src="${ctx}/bootstrap/js/jquery-1.7.2.js"></script>
  <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.js"></script>
  </head>
<style>
  .change{
  width:100%; 
  height:100%; 
  FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#FFF,endColorStr=#D1BBFF); /*IE*/ 
  background:-moz-linear-gradient(top,#FFF,#D1BBFF);/*火狐*/ 
  background:-webkit-gradient(linear, 0% 39.1%, 0% 100%,from(#FFF), to(#D1BBFF));/*谷歌*/ 
  }
</style>
  
  <body>
  
  <div class="container change">
  
  <div class="modal" id="login">
      <div class="modal-header">
        <h4>用户登录</h4>
      </div>
      <div class="modal-body">
          <form id="form1" class="form-horizontal" action="${ctx}/Login/tomain.do" method="post">
            <div class="control-group">
              <label class="control-label">用户名</label>
              <div class="controls">
                <input name="userName" type="text">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">密码</label>
              <div class="controls">
                <input name="password" type="password">
              </div>
            </div>
          </form>
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="$('#form1').submit()" class="btn btn-primary">登录</button>
      </div>
  </div>
  
</div>
  
 
  
    
  </body>
</html>
