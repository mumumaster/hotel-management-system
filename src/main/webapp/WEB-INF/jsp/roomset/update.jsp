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
    float:left;
    }
    
    .inputtwo{
      width:46.8%;
    }
    
    .inputthree{
      width:38%;
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
    
    @media(min-width:550px) and (max-width:730px){
      .inputtwo{
      width: 46.2%;
    }
        .inputthree{
      width: 35.%;
    }
    }
    
    
     @media(min-width:431px) and (max-width:550px){
      .inputtwo{
      width: 43.2%;
    }
      .inputthree{
      width: 40%;
    }
    }
    
    @media(min-width:366px) and (max-width:430px){
      .inputtwo{
      width: 40.2%;
    }
      .inputthree{
      width: 33%;
    }
    }
    
     @media(min-width:285px) and (max-width:366px){
      .inputtwo{
      width: 37.2%;
    }
      .inputthree{
      width: 25%;
    }
    }
    
     @media(min-width:237px) and (max-width:285px){
      .inputtwo{
      width: 30%;
    }
      .inputthree{
      width: 20%;
    }
    }
    
    .yansered{
      color:red;
    }
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">客房修改</h3>
      </div>
    </div>
    
    <div class="span9 margin-top-two">
      <fieldset>
        <legend>标准房设置</legend>
      </fieldset>
    </div>
    
    <form action="${ctx}/RoomSet/update.do" method="post" onsubmit="return verify()">
	   <input type="hidden" name="id" value="${listPo.id}">
	    <div class="span12 margin-top-two">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber marginrighttwo">房间号：</label>
			      <input id="roomNumberId" name="roomNumber" class="textone inputone" onblur="YZ(this.value)"
			       style="height:26px;" type="text" value="${listPo.roomNumber}" onchange="onchangeOne()">
			      <div id="divOne" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			       </div>
			  </div> 
			  <div class="span5 ">
			   	  <label class="labelroomnumber marginrightone">房态：</label>
			      <select name="roomStateID" class="cboone inputone">
		            <c:forEach items="${listTwo}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==listPo.roomStateID}" >selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
			  </div>
		  </div>
	    </div>
	    <div class="span12 margin-top-one">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber marginrighttwo">床位数：</label>
			      <input id="roomAmountId" name="roomAmount" class="textone inputone" 
			      style="height:26px;" type="text" onblur="onchangeOne()" value="${listPo.roomAmount}">
			      <div id="divTwo" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			       </div>
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">客房等级：</label>
			      <select name="guestRoomLevelID" class="cboone inputone">
		            <c:forEach items="${listOne}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==listPo.guestRoomLevelID}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
			  </div>
		  </div>
	    </div>
	    <div class="span12 margin-top-one" >
	      <div class="row-fluid">
	           <div class="span2" style="height:1px; margin-top:-25px;"></div>
		       <div class="span6">
			   	  <label class="labelroomnumber">标准房价/天：</label>
			   	  <div class="input-prepend" style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="standardPriceDayId" name="standardPriceDay" class="textone inputtwo radiusone" onblur="onchangeOne()" value="${listPo.standardPriceDay}"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divThree" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			   </div> 
		  </div>
	    </div>
	    
	   <div class="span9 margin-top-one">
	      <fieldset>
	        <legend>钟点房设置</legend>
	      </fieldset>
	    </div>
	    
	    <div class="span12 margin-top-two">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber" style="margin-right:5px;">标准房价/小时：</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="standardPriceId" name="standardPrice" class="textone inputthree radiusone" onblur="onchangeOne()" value="${listPo.standardPrice}"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divFour" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">时长限制(小时)：</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="maxDurationId" name="maxDuration" class="textone inputthree radiusone" onblur="onchangeOne()" value="${listPo.maxDuration}"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divFive" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div>
		  </div>
	    </div>
	    <div class="span12 margin-top-one">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber marginrightthree">首段价格：</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="firstPriceId" name="firstPrice" class="textone inputthree radiusone" onblur="onchangeOne()" value="${listPo.firstPrice}"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divSix" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">首段时长(小时)：</label>
			      <div class="input-prepend"  style="float:left;">
			        <span class="add-on" style="margin-top: 12px; height: 16px;">&yen;</span>
			      </div>
			      <input id="firstDurationId" name="firstDuration" class="textone inputthree radiusone" onblur="onchangeOne()" value="${listPo.firstDuration}"
			      style="float:left;border-radius:0px; border-top-right-radius:4px; border-bottom-right-radius:4px; height:26px;" type="text">
			      <div id="divSeven" hidden>
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div>
		    </div>
	     </div>
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>修改</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      <div class="span4" style="text-align:center;">
      <div class="row-fluid">
		   <div class="span4"  style="margin-top: 10px;margin-bottom: 8px;"> 
		   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
		   	  <li class="icon-remove icon-white"></li>取消</button>
		   </div>
	     </div>
      </div>
       
    </div>
  
 
 
 
 
 <script type="text/javascript">
    var Name=document.getElementById("roomNumberId").value;
  
 
    function verify(){
    if(document.getElementById("roomNumberId").value==""){
	     alert("房间号  是必填项，不能为空哦！");
	     document.getElementById("roomNumberId").focus();
	     return false;
      }else if(document.getElementById("roomAmountId").value==""){
	     alert("床位数  是必填项，不能为空哦！");
	     document.getElementById("roomAmountId").focus();
	     return false;
      }else if(document.getElementById("standardPriceDayId").value==""){
	     alert("标准房价/天  是必填项，不能为空哦！");
	     document.getElementById("standardPriceDayId").focus();
	     return false;
      }else if(document.getElementById("standardPriceId").value==""){
	     alert("标准房价/小时  是必填项，不能为空哦！");
	     document.getElementById("standardPriceId").focus();
	     return false;
      }else if(document.getElementById("maxDurationId").value==""){
	     alert("时长限制（小时） 是必填项，不能为空哦！");
	     document.getElementById("maxDurationId").focus();
	     return false;
      }else if(document.getElementById("firstPriceId").value==""){
	     alert("首段价格  是必填项，不能为空哦！");
	     document.getElementById("firstPriceId").focus();
	     return false;
      }else if(document.getElementById("firstDurationId").value==""){
	     alert("首段时长  是必填项，不能为空哦！");
	     document.getElementById("firstDurationId").focus();
	     return false;
      }else if(parseFloat(document.getElementById("firstDurationId").value)>parseFloat(document.getElementById("maxDurationId").value)){
	     alert("首段时长 (小时) 不能大于  时长限制(小时)  的哦！");
	     document.getElementById("firstDurationId").focus();
	     return false;
      }else if(parseFloat(document.getElementById("firstPriceId").value)>parseFloat(document.getElementById("standardPriceDayId").value)){
	     alert("首段价格   不能大于  标准房价/天   的哦！");
	     document.getElementById("firstPriceId").focus();
	     return false;
      }else if(parseFloat(document.getElementById("standardPriceId").value)>parseFloat(document.getElementById("standardPriceDayId").value)){
	     alert("标准房价/小时     不能大于  标准房价/天   的哦！");
	     document.getElementById("standardPriceId").focus();
	     return false;
      }else if(document.getElementById("roomNumberId").value.length>8){
	     alert("你输入的  房间号   太过长了  请不要超出  8 位长度");
	     document.getElementById("roomNumberId").focus();
	     return false;
      }else if(document.getElementById("roomAmountId").value.length>8){
	     alert("你输入的  床位数   太过长了  请不要超出  8 位长度");
	     document.getElementById("roomAmountId").focus();
	     return false;
      }else if(document.getElementById("standardPriceDayId").value.length>8){
	     alert("你输入的   标准房价/天  太过长了  请不要超出  8 位长度");
	     document.getElementById("standardPriceDayId").focus();
	     return false;
      }else if(document.getElementById("standardPriceId").value.length>8){
	     alert("你输入的   标准房价/小时   太过长了  请不要超出  8 位长度");
	     document.getElementById("standardPriceId").focus();
	     return false;
      }else if(document.getElementById("maxDurationId").value.length>8){
	     alert("你输入的   时长限制（小时） 太过长了  请不要超出  8 位长度");
	     document.getElementById("maxDurationId").focus();
	     return false;
      }else if(document.getElementById("firstPriceId").value.length>8){
	     alert("你输入的    首段价格   太过长了  请不要超出  8 位长度");
	     document.getElementById("firstPriceId").focus();
	     return false;
      }else if(document.getElementById("firstDurationId").value.length>8){
	     alert("你输入的    首段时长   太过长了  请不要超出  8 位长度");
	     document.getElementById("firstDurationId").focus();
	     return false;
      } else{
         return true;
      } 
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/RoomSet/tolist.do';
   }
   
   
   function YZ(value){
     if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/RoomSet/YZ.do',       //地址 type 带参数
          data:"roomNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(Name==document.getElementById("roomNumberId").value){
              
              }else if(result>=1){                                  
                   alert("已存在此房间号，请另取房间号！");                     //提示框
                   document.getElementById("roomNumberId").value="";     //这个id的文本框的值 将会清空
                   document.getElementById("roomNumberId").focus();      // 给这个id的文本框提供焦点
                   document.getElementById("divOne").style.display="block"; //显示
              }else{ }
          },
          error: function(data) { }
      });
     }
   }
   
   
    //验证
   function onchangeOne(){
     //房间号 
     if(document.getElementById("roomNumberId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
     //床位数
     if(document.getElementById("roomAmountId").value!=""){
       document.getElementById("divTwo").style.display="none";
       if(!document.getElementById("roomAmountId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
       {
          document.getElementById("roomAmountId").focus();
          document.getElementById("roomAmountId").value="";
          document.getElementById("divTwo").style.display="block"; //显示
          alert("床位数:请输入正整数");
       }
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //标准房价/天 
     if(document.getElementById("standardPriceDayId").value!=""){
       document.getElementById("divThree").style.display="none";
       if(!document.getElementById("standardPriceDayId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("standardPriceDayId").focus();
          document.getElementById("standardPriceDayId").value="";
          document.getElementById("divThree").style.display="block"; //显示
          alert("标准房价/天 :请输入正数");
       }
     }else{
       document.getElementById("divThree").style.display="block"; //显示
     }
     //标准房价/小时
     if(document.getElementById("standardPriceId").value!=""){
       document.getElementById("divFour").style.display="none";
       if(!document.getElementById("standardPriceId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("standardPriceId").focus();
          document.getElementById("standardPriceId").value="";
          document.getElementById("divFour").style.display="block"; //显示
          alert("标准房价/小时:请输入正数");
       }
     }else{
       document.getElementById("divFour").style.display="block"; //显示
     }
     //时长限制（小时）
     if(document.getElementById("maxDurationId").value!=""){
       document.getElementById("divFive").style.display="none";
       if(!document.getElementById("maxDurationId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("maxDurationId").focus();
          document.getElementById("maxDurationId").value="";
          document.getElementById("divFive").style.display="block"; //显示
          alert("时长限制（小时）:请输入正数");
       }
     }else{
       document.getElementById("divFive").style.display="block"; //显示
     }
     //首段价格
     if(document.getElementById("firstPriceId").value!=""){
       document.getElementById("divSix").style.display="none";
       if(!document.getElementById("firstPriceId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("firstPriceId").focus();
          document.getElementById("firstPriceId").value="";
          document.getElementById("divSix").style.display="block"; //显示
          alert("首段价格:请输入正数");
       }
     }else{
       document.getElementById("divSix").style.display="block"; //显示
     }
     //首段时长（小时）
     if(document.getElementById("firstDurationId").value!=""){
       document.getElementById("divSeven").style.display="none";
       if(!document.getElementById("firstDurationId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("firstDurationId").focus();
          document.getElementById("firstDurationId").value="";
          document.getElementById("divSeven").style.display="block"; //显示
          alert("首段时长（小时）:请输入正数");
       }
     }else{
       document.getElementById("divSeven").style.display="block"; //显示
     }
   }
 </script>
   
  </body>
</html>
