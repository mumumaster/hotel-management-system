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
        <h3 style="text-align: center;">旅客新增</h3>
        
      </div>
    </div>
    
    <form action="${ctx}/Passenger/add.do" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>姓名：</label>
		        <input id="nameId" name="name" type="text" style="width:97%;height:27px;float:left;" onchange="onchangeOne()">
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		      </div>
		     <div class="span3">
		        <label>性别：</label>
		        <select name="genderID" style="width:100%;height:27px;">
		            <c:forEach items="${listGender}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==31}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>出生日期：</label>
		        <input id="birthDateId" name="birthDate" type="text" style="width:100%;height:27px;" placeholder="年-月-日"> 
		     </div>
		     <div class="span3">
		        <label>民族：</label>
		         <select name="nationID" style="width:100%;height:27px;">
		            <c:forEach items="${listNation}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==33}">selected="selected"</c:if>>
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
		        <label>发证机关：</label>
		        <input id="JGID" name="licenceIssuingAuthorty" type="text" style="width:100%;height:27px;"> 
		     </div>
		     <div class="span3">
		        <label>证件有效期：</label>
		        <input id="papersValidityId" name="papersValidity" type="text" style="width:100%;height:27px;"  placeholder="年-月-日 至 年-月-日"> 
		      </div>
		     <div class="span3">
		        <label>职业：</label>
		        <input id="professionId" name="profession" type="text" style="width:100%;height:27px;">
		     </div>
		     <div class="span3">
		        <label>文化程度：</label>
		         <select name="educationDegreeID" style="width:100%;height:27px;">
		            <c:forEach items="${listEducationDegree}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==43}">selected="selected"</c:if>>
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
		        <label>旅客级别：</label>
		         <select name="passengerLevelID" style="width:100%;height:27px;">
		            <c:forEach items="${listPassengerLevel}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==52}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>证件类型：</label>
		        <select id="papersId" name="papersID" style="width:100%;height:27px;">
		            <c:forEach items="${listPapers}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==37}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		        
		      </div>
		     <div class="span3">
		        <label>证件号码：</label>
		        <input id="papersNumberId" name="papersNumber" type="text" onblur="YZ(this.value)"
		         style="width:97%;height:27px;float:left;" onchange="onchangeOne()"> 
		        <div id="divTwo" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>
		     <div class="span3">
		        <label>单位或住址：</label>
		        <input id="unitsOrAddressId" name="unitsOrAddress" type="text" style="width:100%;height:27px;"> 
		     </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>事由：</label>
		        <select name="thingReasonID" style="width:100%;height:27px;">
		            <c:forEach items="${listThingReason}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==51}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		        
		      </div>
		     <div class="span3">
		        <label>从何处来：</label>
		       <input id="whereAreFromId" name="whereAreFrom" type="text" style="width:100%;height:27px;"> 
		     </div>
		     <div class="span3">
		        <label>到哪里去：</label>
		         <input id="whereToGoId" name="whereToGo" type="text" style="width:100%;height:27px;"> 
		     </div>
		     <div class="span3">
		        <label>联系电话：</label>
		         <input id="contactPhoneNumberId" name="contactPhoneNumber" type="text" 
		         style="width:100%;height:27px;"  placeholder="只能为手机号码" onchange="onchangeOne()"> 
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <label style="float: left;">备注：</label>
	      <input name="remarks" type="text" style="width:100%;height:27px;"> 
	    </div>
	    
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="submit">
				   	 <li class="icon-check icon-white"></li>保存</button>
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
    function verify(){
	    if(document.getElementById("nameId").value==""){
	       alert("姓名  是必填项，不能为空哦！");
	       document.getElementById("nameId").focus();
	       return false;
	    }else if(document.getElementById("papersNumberId").value==""){
	       alert("证件号码  是必填项，不能为空哦！");
	       document.getElementById("papersNumberId").focus();
	       return false;
	    }else if(document.getElementById("nameId").value.length>10){
	     alert("你输入的   姓名  太过长了  请不要超出  10  位长度");
	     document.getElementById("nameId").focus();
	     return false;
        }else if(document.getElementById("birthDateId").value.length>10){
	     alert("你输入的   出生日期  太过长了  请不要超出  10  位长度：例如（2000-01-01）");
	     document.getElementById("birthDateId").focus();
	     return false;
        }else if(document.getElementById("JGID").value.length>25){
	     alert("你输入的   发证机关  太过长了  请不要超出  25  位长度");
	     document.getElementById("JGID").focus();
	     return false;
        }else if(document.getElementById("unitsOrAddressId").value.length>25){
	     alert("你输入的   单位或住址  太过长了  请不要超出  25  位长度");
	     document.getElementById("unitsOrAddressId").focus();
	     return false;
        }else if(document.getElementById("papersValidityId").value.length>25){
	     alert("你输入的   证件有效期  太过长了  请不要超出  25  位长度");
	     document.getElementById("papersValidityId").focus();
	     return false;
        }else if(document.getElementById("professionId").value.length>10){
	     alert("你输入的   职业  太过长了  请不要超出  10  位长度");
	     document.getElementById("professionId").focus();
	     return false;
        }else if(document.getElementById("whereAreFromId").value.length>50){
	     alert("你输入的   从何处来  太过长了  请不要超出  50 位长度");
	     document.getElementById("whereAreFromId").focus();
	     return false;
        }else if(document.getElementById("whereToGoId").value.length>50){
	     alert("你输入的   到哪里去  太过长了  请不要超出  50 位长度");
	     document.getElementById("whereToGoId").focus();
	     return false;
        }else if(document.getElementById("remarks").value.length>50){
	     alert("你输入的   备注  太过长了  请不要超出  50 位长度");
	     document.getElementById("remarks").focus();
	     return false;
        }else{
	       return true;
	    }
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Passenger/tolist.do';
   }
   
   function onchangeOne(){
     //姓名
     if(document.getElementById("nameId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
     //证件号码
     if(document.getElementById("papersNumberId").value!=""){
       document.getElementById("divTwo").style.display="none";
       if(document.getElementById("papersId").value==37){
	       if(!document.getElementById("papersNumberId").value.trim().match(
	       "^[1-9][0-9]{5}(([1][9][0-9][0-9])|([2][0](([0][0-9])|([1][0-7]))))"+
       "(([0][1-9])|([1][0,1,2]))(([0][1-9])|([1|2][0-9])|([3][0|1]))+[0-9]{3}([0-9]|[X]|[x])$"))
	       {
	          document.getElementById("papersNumberId").focus();
	          document.getElementById("papersNumberId").value="";
	          document.getElementById("divTwo").style.display="block"; //显示
	          alert("你输入的身份证号码有误，请重新输入！");
	       }
       }
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //联系电话 
     if(document.getElementById("contactPhoneNumberId").value!=""){
        if(!document.getElementById("contactPhoneNumberId").value.trim().match("^[1][0-9]{10}$"))
	       {
	          document.getElementById("contactPhoneNumberId").focus();
	          document.getElementById("contactPhoneNumberId").value="";
	          alert("你输入的手机号码有误，请重新输入！");
	       }
     }
   }
   
   
   function YZ(value){
   console.log(11);
     if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/Passenger/YZ.do',       //地址 type 带参数
          data:"papersNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(result>=1){                                  
                   alert("此身份证已登记过了！");                     //提示框
                   document.getElementById("papersNumberId").value="";     //这个id的文本框的值 将会清空
                   document.getElementById("papersNumberId").focus();      // 给这个id的文本框提供焦点
                   document.getElementById("divTwo").style.display="block"; //显示
              }else{
              var N=document.getElementById("papersNumberId").value.substring(6,10);
	          var Y=document.getElementById("papersNumberId").value.substring(10,12);
	          var D=document.getElementById("papersNumberId").value.substring(12,14);
	          document.getElementById("birthDateId").value=N+"-"+Y+"-"+D;
           }
          },
          error: function(data) {  }
      });
     }
   }
 </script>
   
  </body>
</html>
