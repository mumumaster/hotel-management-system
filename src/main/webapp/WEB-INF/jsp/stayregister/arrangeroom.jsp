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
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css" type="text/css"></link>
  
  <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
  
 
  <!-- 右键功能  start  .css -->
  <%-- <link rel="stylesheet" href="${ctx}/css/youjian/default.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/youjian/font-awesome.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/youjian/github-light.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/youjian/highlight-8.6.default.min.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/youjian/normalize.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/youjian/styles.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/youjian/toastr.css" type="text/css"></link> --%>
  <!-- 右键功能  end  .css -->
  
  <!-- 右键功能  start  .js -->
  <%-- <script type="text/javascript" src="${ctx}/js/youjian/BootstrapMenu.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/youjian/highlight-8.6.default.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/youjian/scale.fix.js"></script>
  <script type="text/javascript" src="${ctx}/js/youjian/toastr.js"></script> --%>
  <!-- 右键功能  end  .js -->
  
   
   <style>
   
   .container{
     margin-top: 10px;
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
    
    .yansered{
      color:red;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">安排房间</h3>
        
      </div>
    </div>
    
    <form id="form1" method="post" onsubmit="return verify()">
          <input type="hidden" name="receiveTargetID" value="${tuanDuiID}"/>
          <input id="roomId" name="roomID" type="hidden" >
          <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
          
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="button" onclick="tijiao()"">
				   	 <li class="icon-check icon-white"></li>保存</button>
				  </div> 
			  </div>
	      </div>
	      
	       <div class="span4" style="text-align:center;">
	      <div class="row-fluid">
			   <div class="span4"  style="margin-bottom: 8px;"> 
			   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
			   	  <li class="icon-remove icon-white"></li>取消</button>
			   </div>
		  </div>
      </div>
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>房间号：</label>
		        <input id="roomNameId" name="roomName" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		     </div>
		     <div class="span3">
		        <label>登记时间：</label>
		        <input id="registerTimeId" name="registerTime" id="date" style="width:97%; height:27px;float:left;" class="Wdate" type="text" 
		        onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})" onchange="onchangeOne()"/>
		        <div id="divOne">
			         <label class="yansered" style="margin-top:12px;">*</label>
			    </div>
		     </div>
		     <div class="span3">
		        <label>出租方式：</label>
		        <select name="rentOutTypeID" style="width:100%;height:27px;">
		            <c:forEach items="${listRentOutType}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==26}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>旅客类别：</label>
		         <select name="passengerTypeID" style="width:100%;height:27px;">
		            <c:forEach items="${listPassengerType}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==29}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>标准房价：</label>
		        <input id="biaoZhunFangJiaId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		     </div>
		     <div class="span3">
		        <label>钟点房间/小时：</label>
		        <input id="zhongDianFangId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		      </div>
		     <div class="span3">
		        <label>首段价格：</label>
		        <input id="shouDuanJiaGeId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		     </div>
		     <div class="span3">
		        <label>首段时长：</label>
		        <input id="shouDuanShiChangId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	     <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>住店天数/小时：</label>
		       <input id="stayNumberId" name="stayNumber" type="text" onchange="onchangeOne()"
		       style="width:97%;height:27px;float:left;" placeholder="最低时间参考首段时长"> 
		        <div id="divTwo">
			       <label class="yansered" style="margin-top:12px;">*</label>
			    </div>
		     </div>
		     <div class="span3">
		        <label>押金：</label>
		        <input id="depositId" name="deposit" type="text" onchange="onchangeOne()"
		        style="width:97%;height:27px;float:left;"> 
		        <div id="divThree">
			       <label class="yansered" style="margin-top:12px;">*</label>
			    </div>
		     </div>
		      <div class="span3">
		        <label>结账单位：</label>
		         <select name="billUnitID" style="width:100%;height:27px;">
		            <c:forEach items="${listBillUnit}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==27}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>支付方式：</label>
		        <select name="depositPayWayID" style="width:100%;height:27px;">
		            <c:forEach items="${listPayWay}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==21}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		      </div>
		  </div>
	    </div>
      </form>
      
      <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
     
      <div class="span12">
	      <fieldset>
	        <legend>房态：</legend>
	      </fieldset>
	    </div>
	
	   <div class="span12" style="margin-top:-17px;">
        <div class="row-fluid">
          <button class="btn btn-info btn-small" type="button" onclick="allroomfunction()">所有房间</button>
          <button class="btn btn-info btn-small" type="button" onclick="onefunction()">单人普通房</button>
          <button class="btn btn-info btn-small" type="button" onclick="twofunction()">单人标准间</button>
          <button class="btn btn-info btn-small" type="button" onclick="threefunction()">二人普通房</button>
          <button class="btn btn-info btn-small" type="button" onclick="fourfunction()">二人标准间</button>
          <button class="btn btn-info btn-small" type="button" onclick="fivefunction()">豪华间</button>
          <button class="btn btn-info btn-small" type="button" onclick="sixfunction()">会议室</button>
          <button class="btn btn-info btn-small" type="button" onclick="sevenfunction()">总统套房</button>
        </div>
       </div>
      
       <div class="span12" id="dynamicid" style="height:270px;overflow-x:auto;">
         <div class="row-fluid" id="div1">
         <c:forEach items="${list}" var="item">
	       <c:if test="${item.roomStateID==1}">
	         <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666;  float:left;margin:2px; background:#99FF99;">
	             <input style="display: none;" value="${item.id}" />
	             <input style="display: none;" value="${item.roomStateID}" />
	             <label>${item.roomNumber}</label>
	             <label style="margin-top:-5px;">${item.roomName}</label>
	             <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
	             <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	             <input style="display: none;" value="${item.standardPrice}" />
	             <input style="display: none;" value="${item.firstPrice}" />
	             <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
	       <c:if test="${item.roomStateID==2}">
	         <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#DDDDDD;">
	             <input style="display: none;" value="${item.id}" />
	             <input style="display: none;" value="${item.roomStateID}" />
	             <label>${item.roomNumber}</label>
	             <label style="margin-top:-5px;">${item.roomName}</label>
	             <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
	             <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	             <input style="display: none;" value="${item.standardPrice}" />
	             <input style="display: none;" value="${item.firstPrice}" />
	             <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
	       <c:if test="${item.roomStateID==4}">
	           <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FFFF;">
		           <input style="display: none;" value="${item.id}" />
		           <input style="display: none;" value="${item.roomStateID}" />
		           <label>${item.roomNumber}</label>
		           <label style="margin-top:-5px;">${item.roomName}</label>
		           <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
		           <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	             <input style="display: none;" value="${item.standardPrice}" />
	             <input style="display: none;" value="${item.firstPrice}" />
	             <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
	       <c:if test="${item.roomStateID==5}">
	           <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#BBBB00;">
		           <input style="display: none;" value="${item.id}" />
		           <input style="display: none;" value="${item.roomStateID}" />
		           <label>${item.roomNumber}</label>
		           <label style="margin-top:-5px;">${item.roomName}</label>
		           <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
		           <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	               <input style="display: none;" value="${item.standardPrice}" />
	               <input style="display: none;" value="${item.firstPrice}" />
	               <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
	       <c:if test="${item.roomStateID==6}">
	           <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF7744;">
		           <input style="display: none;" value="${item.id}" />
		           <input style="display: none;" value="${item.roomStateID}" />
		           <label>${item.roomNumber}</label>
		           <label style="margin-top:-5px;">${item.roomName}</label>
		           <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
		           <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	               <input style="display: none;" value="${item.standardPrice}" />
	               <input style="display: none;" value="${item.firstPrice}" />
	               <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
	       <c:if test="${item.roomStateID==7}">
	           <button onclick="suibian(this)"  style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF0088;">
		           <input style="display: none;" value="${item.id}" />
		           <input style="display: none;" value="${item.roomStateID}" />
		           <label>${item.roomNumber}</label>
		           <label style="margin-top:-5px;">${item.roomName}</label>
		           <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
		           <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	               <input style="display: none;" value="${item.standardPrice}" />
	               <input style="display: none;" value="${item.firstPrice}" />
	               <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
	       <c:if test="${item.roomStateID==65}">
	           <button onclick="suibian(this)" style="width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF00FF;">
		           <input style="display: none;" value="${item.id}" />
		           <input style="display: none;" value="${item.roomStateID}" />
		           <label>${item.roomNumber}</label>
		           <label style="margin-top:-5px;">${item.roomName}</label>
		           <label style="margin-top:-5px;">${item.guestRoomLevelName}</label>
		           <label style="margin-top:-5px;">￥${item.standardPriceDay}</label>
	               <input style="display: none;" value="${item.standardPrice}" />
	               <input style="display: none;" value="${item.firstPrice}" />
	               <input style="display: none;" value="${item.firstDuration}" />
	         </button>
	       </c:if>
         </c:forEach>
         </div>
       </div>
      
     
       
    </div>
  
 
 
 
 
 <script type="text/javascript">
   var shijian="";
   var guestRoomLevelID=0;
    function verify(){
   }
   
    function deletefunction(){
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+LvKeLeiXingId;
   }
   
   function suibian(ss){
     if(ss.children[1].value==1){
   		var parentNodes=ss.parentNode.children;
   		for(var i=0;i<parentNodes.length;i++){
   			parentNodes[i].style.borderColor="#666666";
   		}
   		ss.style.borderColor="#00FFFF";
   		document.getElementById("roomId").value=ss.children[0].value;
   		document.getElementById("roomNameId").value=ss.children[2].textContent;
   		document.getElementById("biaoZhunFangJiaId").value=ss.children[5].textContent;
   		document.getElementById("zhongDianFangId").value='￥'+ss.children[6].value;
   		document.getElementById("shouDuanJiaGeId").value='￥'+ss.children[7].value;
   		document.getElementById("shouDuanShiChangId").value=ss.children[8].value;
	 }else{
	    alert("不是空房不可以安排房间的哦！");
	 }
   		
   		
   		var roomid=ss.children[0].value;  //获取这个
   }
   
   function tijiao(){
       if(document.getElementById("registerTimeId").value==""){
	     alert("登记时间  是必填项，不能为空哦！");
	     document.getElementById("registerTimeId").focus();
	     return false;
      }else if(document.getElementById("stayNumberId").value==""){
	     alert("住店天数/小时  是必填项，不能为空哦！");
	     document.getElementById("stayNumberId").focus();
	     return false;
      }else if(document.getElementById("depositId").value==""){
	     alert("押金  是必填项，不能为空哦！");
	     document.getElementById("depositId").focus();
	     return false;
      }else if(document.getElementById("registerTimeId").value.length>20){
	     alert("你输入的    登记时间   太过长了  请不要超出  20 位长度");
	     document.getElementById("registerTimeId").focus();
	     return false;
      }else if(document.getElementById("stayNumberId").value.length>10){
	     alert("你输入的    住店天数/小时   太过长了  请不要超出  10 位长度");
	     document.getElementById("stayNumberId").focus();
	     return false;
      }else if(document.getElementById("depositId").value.length>8){
	     alert("你输入的   押金  太过长了  请不要超出  8 位长度  ");
	     document.getElementById("depositId").focus();
	     return false;
      }
      if(document.getElementById("roomNameId").value==""){
         alert("还没有选择房间哦！");
         return false;
      }
      var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
      form1.action="${ctx}/StayRegister/arrangeroom.do?LvKeLeiXingId="+LvKeLeiXingId;
      form1.submit();
   }
   
   
   
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
        }
        
   function allroomfunction(){
     guestRoomLevelID=0;
     tenfunction();
   }
        
   function onefunction(){
      guestRoomLevelID=8;
      tenfunction();
   }
   
   function twofunction(){
      guestRoomLevelID=9;
      tenfunction();
   }
   
   function threefunction(){
      guestRoomLevelID=10;
      tenfunction();
   }
   
   function fourfunction(){
      guestRoomLevelID=11;
      tenfunction();
   }
   
   function fivefunction(){
      guestRoomLevelID=12;
      tenfunction();
   }
   
   function sixfunction(){
      guestRoomLevelID=13;
      tenfunction();
   }
   
   function sevenfunction(){
      guestRoomLevelID=14;
      tenfunction();
   }
   
   function tenfunction(){
      $("#div1").empty();
      $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/StayRegister/guestRoomLevelSelectRoom.do',       //地址 type 带参数
          data:"guestRoomLevelID="+guestRoomLevelID,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
             for (var key in result) {
                var item = result[key];
                if(item.roomStateID==1){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FF99;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
                if(item.roomStateID==2){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#DDDDDD;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
                if(item.roomStateID==4){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#99FFFF;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
                if(item.roomStateID==5){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#BBBB00;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
                if(item.roomStateID==6){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF7744;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
                if(item.roomStateID==7){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF0088;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
                if(item.roomStateID==65){
                var btn=$("<button onclick='suibian(this)' style='width:95px;;height:93px;border: 3px solid #666666; float:left;margin:2px; background:#FF00FF;'>"+
			      "<input style='display: none;' value="+item.id+" />"+
			      "<input style='display: none;' value="+item.roomStateID+" />"+
			      "<label>"+item.roomNumber+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.roomName+"</label>"+
			      "<label style='margin-top:-5px;'>"+item.guestRoomLevelName+"</label>"+
			      "<label style='margin-top:-5px;'>"+"￥"+item.standardPriceDay+"</label>"+
			      "<input style='display: none;' value="+item.standardPrice+" />"+
			      "<input style='display: none;' value="+item.firstPrice+" />"+
			      "<input style='display: none;' value="+item.firstDuration+" />"+
			     "</button>")
    			 $("#div1").append(btn);
                }
             }
          },
          error: function(data) {
          
           }

      });
   }
   
   
   
   function onchangeOne(){
     //登记时间
     if(document.getElementById("registerTimeId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
     //住店天数/小时
     if(document.getElementById("stayNumberId").value!=""){
       document.getElementById("divTwo").style.display="none";
       if(!document.getElementById("stayNumberId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
       {
          document.getElementById("stayNumberId").focus();
          document.getElementById("stayNumberId").value="";
          document.getElementById("divTwo").style.display="block"; //显示
          alert("住店天数/小时:请输入正整数");
       }
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //押金
     if(document.getElementById("depositId").value!=""){
       document.getElementById("divThree").style.display="none";
       if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("depositId").focus();
          document.getElementById("depositId").value="";
          document.getElementById("divThree").style.display="block"; //显示
          alert("押金 :请输入正数");
       }
     }else{
       document.getElementById("divThree").style.display="block"; //显示
     }
   }
  
 </script>
   
  </body>
</html>
