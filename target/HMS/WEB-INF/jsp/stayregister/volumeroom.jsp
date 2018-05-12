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
    
    .theadone{
     background-color: #CCFF99;
    }
    
     .table th,.table td{
       text-align: center; 
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
        <h3 style="text-align: center;">批量安排房间</h3>
        
      </div>
    </div>
    
    <form id="form1" method="post" onsubmit="return verify()">
          <input type="hidden" name="receiveTargetID" value="${tuanDuiID}"/>
    
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="button" onclick="tijiao()">
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
		        <label>接待对象：</label>
		        <input type="text" style="width:100%;height:25px;" readonly="readonly" value="${teamName}"> 
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
			          <option value="${item.far_id}" <c:if test="${item.far_id==28}">selected="selected"</c:if>>
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
	        <legend>
	                       房态：<button href="#xuanzhe" data-toggle="modal" class="btn btn-info btn-small" onclick="selectRoom()"><li class="icon-plus icon-white"></li>选择房间</button>
	                       </legend>
	      </fieldset>
	  </div>
	  
 <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
 
	   <div class="modal hide fade" id="xuanzhe" style="margin-top:10px;">
       <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
	    <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">房间号：</label>
			   <input id="txtnameid" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="selectRoom()" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()"><li class="icon-plus icon-white"></li>确定选择</button>
	       </div>
	    </div>
	   <div class="dgvone" style="width:93%; margin-top:10px;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >房间号</th>
	          <th >客房等级</th>
	          <th >房态</th>
	          <th >床位数</th>
	          <th >标准客房/天</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="idTwo" ></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    </div>

<!--  ———————————————————————————————————————————————————————————————————————————————————————— -->    
    
    <div style="width:100%;height:340px; overflow-x:auto;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">房间号</th>
	          <th rowspan="2">客房等级</th>
	          <th rowspan="2">床位数</th>
	          <th rowspan="2">标准客房/天</th>
	          <th colspan="4">钟点房价设置</th>
	          
	        </tr>
	        <tr>
	          <th >标准房价/小时</th>
	          <th >时长限制(小时)</th>
	          <th >首段时长(小时)</th>
	          <th >首段价格</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="id" value=""></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		          <td></td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
	   
    </div>
  
 
 
 
 
 <script type="text/javascript">
    function verify(){
   }
   
    function deletefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+56;
   }
   
   function allroomfunction(){
        var btn=document.createElement("button");
        btn.type="button";
        document.getElementById("dynamicid").appendChild(btn);
   }
   
   function selectRoom(){
    var tbody = document.getElementById("tbodyTwo");
    var name=document.getElementById("txtnameid").value;
    var i=0;
    $("#tbodyTwo").empty();                              // 删除 tbody 所有行
    $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/Predetermine/selectRoom.do',       //地址 type 带参数
          data:"roomNumber="+name,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
//        dataType:"json",                                       // json 数据类型提交 
          async:false,                                          // 是否 异步 提交
          success: function (result) {  
            for (var key in result) { 
                i++;               
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数
               
                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdroomNumber = tr.insertCell(-1);
                var tdguestRoomLevelName = tr.insertCell(-1);
                var tdroomName = tr.insertCell(-1);
                var tdroomAmount = tr.insertCell(-1);
                var tdstandardPriceDay = tr.insertCell(-1);
                
                tdcheckbox.innerHTML = "<input type='checkbox' name='idTwo' value='"+item.id+"'>";
                tdroomNumber.innerHTML = item.roomNumber;
                tdguestRoomLevelName.innerHTML = item.guestRoomLevelName;
                tdroomName.innerHTML =item.roomName;         //中间这个是数据
                tdroomAmount.innerHTML =item.roomAmount;
                tdstandardPriceDay.innerHTML ='￥'+item.standardPriceDay;
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据");
            }               
          },
          error: function(data) {
          
           }
      });     
   }
   
   
   function confirmfunction(){
      var chk_value=[];
      var tbody = document.getElementById("tbody");
      $('input[name="idTwo"]:checked').each(function(){             // 遍历获取input被checked的
	   	chk_value.push($(this).val());                             // 获取选中的ID
	  });
	  $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/StayRegister/ajaxSelectRoom.do',       //地址 type 带参数
          data:"id="+chk_value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
             for (var key in result) {
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数
               
                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdroomNumber = tr.insertCell(-1);
                var tdguestRoomLevelName = tr.insertCell(-1);
                var tdroomAmount = tr.insertCell(-1);
                var tdstandardPriceDay = tr.insertCell(-1);
                var tdstandardPrice=tr.insertCell(-1);
                var tdmaxDuration=tr.insertCell(-1);
                var tdfirstDuration=tr.insertCell(-1);
                var tdfirstPrice=tr.insertCell(-1);
                
                tdcheckbox.innerHTML = "<input type='checkbox' name='id' value='"+item.id+"'>";
                tdroomNumber.innerHTML = item.roomNumber;
                tdguestRoomLevelName.innerHTML = item.guestRoomLevelName;
                tdroomAmount.innerHTML =item.roomAmount;
                tdstandardPriceDay.innerHTML ='￥'+item.standardPriceDay;
                tdstandardPrice.innerHTML ='￥'+item.standardPrice;
                tdmaxDuration.innerHTML =item.maxDuration;
                tdfirstDuration.innerHTML =item.firstDuration;
                tdfirstPrice.innerHTML ='￥'+item.firstPrice;
            }
          },
          error: function(data) {
           }
      });
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
      if(document.getElementById("tbody").rows.length == 0){
         alert("还没有选择房间哦！");
         return false;
      }
      var chk_value=[];
      $('input[name="id"]').each(function(){             // 遍历获取input被checked的
	   	chk_value.push($(this).val());                             // 获取选中的ID
	  });
      form1.action="${ctx}/StayRegister/volumeroom.do?roomId="+chk_value;
      form1.submit();
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
   
   
   
   
   
   
   
   
   var shijian="";
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
        }
 </script>
   
  </body>
</html>
