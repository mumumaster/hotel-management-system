<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	
<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
   
   <style>
   
   .container{
     margin-top: 10px;
   }
   
   .theadone{
     background-color: #CCFF99;
    }
   
   .floatont{
     float:left;
   }
   
   .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
    
    .marginrightone{
      margin-right: 33px;
    }
    
    .marginrighttwo{
      margin-right: 16.5px;
    }
    
    .marginrightthree{
      margin-right: 43px;
    }
    
   .textone{
    margin-top:12px;
    }
    
    .inputone{
    width:54.2%;
    }
    
    .inputtwo{
      width:46.8%;
    }
    
    .inputthree{
      width:46.8%;
    }
    
    .cboone{
      margin-top:10px;
      height: 27px;
    }
    
    .margin-top-one{
      margin-top: -10px;
    }
    
    .margin-top-two{
      margin-top: -20px;
    }
  
    .textwidth{
      width: 138px;
    }
    
    .radiusone{
     margin-left: -4px;
    }
    
     @media(min-width:731px) and (max-width:767px){
      .inputthree{
      width: 50.5%;
    }
    }
    
    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 49.2%;
    }
    }
    
    
     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 47.5%;
    }
    }
    
    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 46%;
    }
    }
    
     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 44%;
    }
    }
    
     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 40%;
    }
    }
    .span12{
      width:95%;
    }
    
    .yanseblue{
     color:blue;
    }
    .yansered{
      color:red;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
    <input type="hidden" id="id" value="${id}"/>
    <input type="hidden" id="isBillID" value="${list.isBillID}"/>
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">转为散客</h3>
        
      </div>
    </div>
    <form action="${ctx}/StayRegister/add.do" method="post" onsubmit="return verify()">
    
    <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="button" onclick="changOver()">
				   	 <li class="icon-check icon-white"></li>确定</button>
				  </div> 
				 
			  </div>
	  </div>
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>取消</button>
		   </div>
	     </div>
      </div>
       
    
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">房间号：</label>
		        <label class="yanseblue">${list.roomNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">接待对象：</label> <!-- 散客 -->
		        <label class="yanseblue">${list.receiveTeamName==""?"散客":list.receiveTeamName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客姓名：</label>
		        <label class="yanseblue">${list.passengerName}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">旅客类别：</label>
		        <label class="yanseblue">${list.passengerTypeName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客级别：</label>
		        <label class="yanseblue">${list.passengerLevelName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账单位：</label>
		        <label class="yanseblue">${list.billUnitName}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">结账方式：</label>
		        <label class="yanseblue">${list.payWayName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">登记时间：</label>
		        <label class="yanseblue">${list.registerTime}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">出租方式：</label>
		        <label class="yanseblue">${list.rentOutTypeName}</label>
		     </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">房价/天：</label>
		        <label class="yanseblue">${list.roomStandardPriceDay}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">房价/小时：</label>
		        <label class="yanseblue">${list.roomStandardPrice}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">首段价格：</label>
		        <label class="yanseblue">${list.roomFirstPrice}</label>
		     </div>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">天数或钟点数：</label>
		        <label class="yanseblue">${list.stayNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">住宿费：</label>
		        <label class="yanseblue">${zhuSuFei}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">换房费：</label>
		        <label class="yanseblue">${list.changRoomMoney}</label>
		     </div>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12" style="margin-top:10px;">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">其他消费：</label>
		        <label class="yanseblue">${qiTaXiaoFei}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客押金：</label>
		        <label class="yanseblue">${yaJin}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">总费用：</label>
		        <label class="yansered">${list.sumConst}</label>
		     </div>
		  </div>
	    </div>
  
 
 
 
 
 <script type="text/javascript">
    function verify(){
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+56;
   }
   
   function changOver(){
     var id=document.getElementById("id").value;
     var isBillID=document.getElementById("isBillID").value;
     if(isBillID==69){
       alert("很抱歉！该数据已经结账没法进行操作！");
       return;
     }
     var flag=window.confirm("您确定要将此房间转为散客吗？这样会此房间的押金会脱离团队押金的哦！");
     if(flag){
	     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/changOver.do?id='+id+
	     '&LvKeLeiXingId='+56;
     }
   }
 </script>
   
  </body>
</html>
