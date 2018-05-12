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
			      <input name="principal" class="textone inputone" style="height:26px;" type="text">
			  </div> 
		  </div>
	    </div>
	    <div class="span12">
	      <div class="row-fluid">
		      <div class="span5">
			   	  <label class="labelroomnumber">团队名称：</label>
                  <input name="teamName" class="textone inputone" style="height:26px;" type="text">
			  </div> 
			  <div class="span5">
			   	  <label class="labelroomnumber">团队编号：</label>
                  <input name="teamCode" class="textone inputone" style="height:26px;" type="text">
			  </div>
		  </div>
	    </div>
	    <div class="span12">
	      <div class="row-fluid">
	        <div class="span5">
	           <label class="labelroomnumber">登记时间：</label>
		       <input name="registerTime" class="textone inputone" style="height:26px;" id="date" class="Wdate" type="text" 
		       onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})" />
		    </div>
		    <div class="span5">
			   	  <label class="labelroomnumber">联系电话：</label>
                  <input name="contactPhoneNUmber" class="textone inputone" style="height:26px;" type="text">
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
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/ReceiveTarget/tolist.do';
   }
   
   var shijian="";
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
        }
       
 </script>
   
  </body>
</html>
