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
      width:46.8%;
    }
    
    .inputfour{
     width:50%;
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
        <h3 style="text-align: center;">接待对象新增</h3>
      </div>
    </div>
    
    <form action="${ctx}/ReceiveTarget/add.do" method="post" onsubmit="return verify()">
	    <div class="span12">
	      <div class="row-fluid">
			  <div class="span5 ">
			   	  <label class="labelroomnumber">对象类别：</label>
			      <select name="targetTypeID" class="cboone inputone">
		            <c:forEach items="${listOne}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==56}" >selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
			  </div>
			  <div class="span5">
			   	  <label class="labelroomnumber" style="margin-right:16px;">负责人：</label>
			      <input id="principalId" name="principal" class="textone inputone" 
			      style="height:26px;" type="text" onchange="onchangeOne()">
			      <div id="divOne">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div> 
		  </div>
	    </div>
	    <div class="span12">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber">团队名称：</label>
                  <input id="teamNameId" name="teamName" class="textone inputone"
                   style="height:26px;" type="text" onchange="onchangeOne()">
			      <div id="divTwo">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">团队编号：</label>
                  <input id="teamCodeId" name="teamCode" class="textone inputone" 
                  style="height:26px;" type="text" onchange="onchangeOne()" onblur="YZ(this.value)">
			      <div id="divThree">
			         <label class="yansered" style="margin-top:18px;">*</label>
			      </div>
			  </div>
			  
		  </div>
	    </div>
	    <div class="span12">
	      <div class="row-fluid">
	        <div class="span5">
	           <label class="labelroomnumber">登记时间：</label>
		       <input id="registerTimeId" name="registerTime" class="textone inputone" style="height:26px;" id="date" class="Wdate" type="text" 
		       onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})" onchange="onchangeOne()"/>
		       <div id="divFour">
			         <label class="yansered" style="margin-top:18px;">*</label>
			   </div>
		    </div>
		    <div class="span5">
			   	<label class="labelroomnumber">联系电话：</label>
                <input id="contactPhoneNUmberId" name="contactPhoneNUmber" class="textone inputone" 
                style="height:26px;" type="text" onchange="onchangeOne()">
		        <div id="divOne">
			         <label class="yansered" style="margin-top:18px;">*</label>
			    </div>
		    </div>
		  </div>
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
    if(document.getElementById("principalId").value==""){
	     alert("负责人  是必填项，不能为空哦！");
	     document.getElementById("principalId").focus();
	     return false;
      }else if(document.getElementById("teamNameId").value==""){
	     alert("团队名称  是必填项，不能为空哦！");
	     document.getElementById("teamNameId").focus();
	     return false;
      }else if(document.getElementById("teamCodeId").value==""){
	     alert("团队编号  是必填项，不能为空哦！");
	     document.getElementById("teamCodeId").focus();
	     return false;
      }else if(document.getElementById("registerTimeId").value==""){
	     alert("登记时间  是必填项，不能为空哦！");
	     document.getElementById("registerTimeId").focus();
	     return false;
      }else if(document.getElementById("contactPhoneNUmberId").value==""){
	     alert("联系电话  是必填项，不能为空哦！");
	     document.getElementById("contactPhoneNUmberId").focus();
	     return false;
      }else if(document.getElementById("principalId").value.length>10){
	     alert("你输入的    负责人   太过长了  请不要超出  10 位长度 ");
	     document.getElementById("principalId").focus();
	     return false;
      }else if(document.getElementById("teamNameId").value.length>15){
	     alert("你输入的    团队名称   太过长了  请不要超出  15 位长度");
	     document.getElementById("teamNameId").focus();
	     return false;
      }else if(document.getElementById("teamCodeId").value.length>15){
	     alert("你输入的    团队编号  太过长了  请不要超出  15 位长度");
	     document.getElementById("teamCodeId").focus();
	     return false;
      }else if(document.getElementById("registerTimeId").value.length>20){
	     alert("你输入的    登记时间   太过长了  请不要超出  20 位长度");
	     document.getElementById("registerTimeId").focus();
	     return false;
      }else if(document.getElementById("contactPhoneNUmberId").value.length>20){
	     alert("你输入的    联系电话     太过长了  请不要超出  20 位长度");
	     document.getElementById("contactPhoneNUmberId").focus();
	     return false;
      }else{
         return true;
      }
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/ReceiveTarget/tolist.do';
   }
   
   var shijian="";
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
        }
       
   
   function onchangeOne(){
     //负责人
     if(document.getElementById("principalId").value!=""){
       document.getElementById("divOne").style.display="none";
     }else{
       document.getElementById("divOne").style.display="block"; //显示
     }
     //团队名称
     if(document.getElementById("teamNameId").value!=""){
       document.getElementById("divTwo").style.display="none";
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //团队编号
     if(document.getElementById("teamCodeId").value!=""){
       document.getElementById("divThree").style.display="none";
     }else{
       document.getElementById("divThree").style.display="block"; //显示
     }
     //登记时间
     if(document.getElementById("registerTimeId").value!=""){
       document.getElementById("divFour").style.display="none";
     }else{
       document.getElementById("divFour").style.display="block"; //显示
     }
      //联系电话 
     if(document.getElementById("contactPhoneNUmberId").value!=""){
        if(!document.getElementById("contactPhoneNUmberId").value.trim().match("^[1][0-9]{10}$"))
	       {
	          document.getElementById("contactPhoneNUmberId").focus();
	          document.getElementById("contactPhoneNUmberId").value="";
	          alert("你输入的手机号码有误，请重新输入！");
	       }
     }
   }
   
   function YZ(value){
     if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/ReceiveTarget/YZ.do',       //地址 type 带参数
          data:"teamCode="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(result>=1){                                  
                   alert("已存在此团队编号，请另取团队编号！");                     //提示框
                   document.getElementById("teamCodeId").value="";     //这个id的文本框的值 将会清空
                   document.getElementById("teamCodeId").focus();      // 给这个id的文本框提供焦点
                   document.getElementById("divThree").style.display="block"; //显示
              }else{ }
          },
          error: function(data) { }
      });
     }
   }
  
 </script>
   
  </body>
</html>
