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
  <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="${ctx}/js/common.js"></script>
   
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
      margin-top:3px;
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
      margin-top: -15px;
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
    
    .table th,.table td{
       text-align: center; 
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
    <input type="hidden" id="minId" value="${min}"/>
    <input type="hidden" id="maxId" value="${max}"/>
    
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">房间信息详情</h3>
        
      </div>
    </div>
    
    <div class="span4" >
      <div class="row-fluid" >
		   <div class="span4 pull-right"  style="margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>取消</button>
		   </div>
	   </div>
    </div>
    
    <div class="span6">
      <div class="row-fluid">
		   <div class="span4"  style="margin-bottom:8px;"> 
		   	 <button id="btn1" class="btn btn-warning btn-small pull-right" type="button" onclick="hedden()">
		   	  <li class="icon-chevron-down icon-white"></li>显示</button>
		   	  <button id="btn2" class="btn btn-inverse btn-small pull-right" type="button" onclick="hedden2()">
		   	  <li class="icon-chevron-up icon-white"></li>隐藏</button>
		   </div>
	   </div>
    </div>
    
    <form action="${ctx}/StayRegister/add.do" method="post" onsubmit="return verify()">
        <div id="divhidden" hidden>
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">房间号：</label>
		        <label class="yanseblue">${list[0].roomNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">客房等级：</label>
		        <label class="yanseblue">${list[0].roomGuestRoomLevelName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">接待对象：</label> <!-- 散客 -->
		        <label class="yanseblue">${list[0].receiveTeamName==""?"散客":list[0].receiveTeamName}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">团队编码：</label>
		        <label class="yanseblue">${list[0].receiveTeamCode}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">负责人：</label>
		        <label class="yanseblue">${list[0].receivePrincipal}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">团队电话：</label> <!-- 团队 -->
		        <label class="yanseblue">${list[0].receiveTargetID==2?"":list[0].receiveContactPhoneNUmber}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
	         <div class="span4">
		        <label class="floatont">旅客姓名：</label>
		        <label class="yanseblue">${list[0].passengerName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客性别：</label>
		        <label class="yanseblue">${list[0].passengerGenderName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">证件类型：</label>
		        <label class="yanseblue">${list[0].passengerPapersName}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
	         <div class="span4">
		        <label class="floatont">证件号码：</label>
		        <label class="yanseblue">${list[0].passengerPapersNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客电话：</label>
		        <label class="yanseblue">${list[0].pssengerContactPhoneNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">旅客类别：</label>
		        <label class="yanseblue">${list[0].passengerTypeName}</label>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">旅客级别：</label>
		        <label class="yanseblue">${list[0].passengerLevelName}</label>
		     </div>
		      <div class="span4">
		        <label class="floatont">登记时间：</label>
		        <label class="yanseblue">${list[0].registerTime}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">出租方式：</label>
		        <label class="yanseblue">${list[0].rentOutTypeName}</label>
		     </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">结账方式：</label>
		        <label class="yanseblue">${list[0].payWayName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">结账单位：</label>
		        <label class="yanseblue">${list[0].billUnitName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">是否预订：</label>
		        <label style="color:orange">${list[0].predetermineID==null?"否":"是"}</label>
		     </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">房价/天：</label>
		        <label class="yanseblue">${list[0].roomStandardPriceDay}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">房价/小时：</label>
		        <label class="yanseblue">${list[0].roomStandardPrice}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">首段价格：</label>
		        <label class="yanseblue">${list[0].roomFirstPrice}</label>
		     </div>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">天数或钟点数：</label>
		        <label class="yanseblue">${list[0].stayNumber}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">住宿费：</label>
		        <label class="yanseblue">${zhuSuFei}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">换房费：</label>
		        <label class="yanseblue">${list[0].changRoomMoney}</label>
		     </div>
		  </div>
	    </div>
	     <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
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
		        <label class="yansered">${list[0].sumConst}</label>
		     </div>
		  </div>
	    </div>
        
        <div class="span10 margin-top-one">
	      <fieldset>
	        <legend >预订信息：</legend>
	      </fieldset>
	    </div>
	     <div class="span12">
	      <div class="row-fluid">
		     <div class="span4">
		        <label class="floatont">预订者姓名：</label>
		        <label class="yanseblue">${list[0].predeterminePassengerName}</label>
		     </div>
		     <div class="span4">
		        <label class="floatont">证件号码：</label>
		        <label class="yanseblue">${list[0].predeterminePassengerPapersNumber}</label>
		     </div>
		     <div class="span3">
		        <label class="floatont">联系电话：</label>
		        <label class="yansered">${list[0].predeterminePassengerContactPhoneNumber}</label>
		     </div>
		  </div>
	    </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	   <div class="span10 margin-top-one">
	      <fieldset>
	        <legend>押金记录：</legend>
	      </fieldset>
	    </div>
	   <div class="span12">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">接待对象</th>
	          <th rowspan="2">押金</th>
	          <th rowspan="2">支付方式</th>
	          <th rowspan="2">押金时间</th>
	          
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${listDeposit}" var="item">
		        <tr>
		          <c:if test="${item.receiveTargetID==2}">
		             <td>${item.receiveTargeTypeName}</td>
		          </c:if>
		          <c:if test="${item.receiveTargetID!=2}">
		             <td>${item.receiveTeamName}</td>
		          </c:if>
		          <td>${item.deposit}</td>
		          <td>${item.depositPayWayName}</td>
		          <td>${item.depositRegisterTime}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	    </div>
	    <div class="span10 margin-top-one">
	      <fieldset>
	        <legend>消费记录：</legend>
	      </fieldset>
	    </div>
	    
	    <div class="dgvone">
	    <div class="span12">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >商品名称</th>
	          <th >商品类别</th>
	          <th >计量单位</th>
	          <th >消费数量</th>
	          <th >销售价格</th>
	          <th >总计</th>
	          <th >消费时间</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">
	        <c:forEach items="${listXiaoFei}" var="item">
		        <tr>
		          <td>${item.commodityName}</td>
		          <td>${item.commodityTypeName}</td>
		          <td>${item.commodityUOMName}</td>
		          <td>${item.consumptionNumber}</td>
		          <td>${item.commoditySalePrice}</td>
		          <td>${item.consumptionMoney}</td>
		          <td>${item.consumptionTime}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    </div>
	    
	
		  
    </form>
      
    </div>
  
 
 
 
 
 <script type="text/javascript">
 
 document.getElementById("btn2").style.display="none"; //隐藏
 
 
 
 function deletefunction(){
     var datemin=document.getElementById("minId").value;
     var datemax=document.getElementById("maxId").value;
     parent.document.getElementById('Mainid').src='${ctx}/FinancialStatistics/tolist.do?datemin='+
     datemin+'&datemax='+datemax;
 }
 

 
 
   function hedden(){
     document.getElementById("divhidden").style.display="block"; //显示
     document.getElementById("btn2").style.display="block"; //隐藏
     document.getElementById("btn1").style.display="none"; //隐藏
   }
   function hedden2(){
     document.getElementById("divhidden").style.display="none"; //显示
     document.getElementById("btn2").style.display="none"; //隐藏
     document.getElementById("btn1").style.display="block"; //隐藏
   }
 </script>
   
  </body>
</html>
