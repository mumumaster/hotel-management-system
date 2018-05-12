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
   
   .table th,.table td{
       text-align: center; 
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
  
  </style>
  
  </head>
  
 
  <body > 
  <div class="container" style="height:630px;overflow-x:auto;">
  
    <div class="span11" style=" border: solid; border-color: #DDDDDD;">
    <div class="span9 margin-top-one">
      <div class="row-fluid">
        <h3 style="text-align: center;">更换房间</h3>
        
      </div>
    </div>
    
    <input type="hidden" id="stayId" value="${stayId}">         <!-- 住宿ID -->
    <input type="hidden" id="roomId" >                          <!-- 房间ID -->
    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
    
		  <div class="span4" style="text-align:right;">
		      <div class="row-fluid">
			      <div class="span10" style="margin-bottom: 8px;">
				   	 <button class="btn btn-primary" onclick="confirmChangRoom()">
				   	 <li class="icon-check icon-white"></li>确定更换房间</button>
				  </div> 
			  </div>
	      </div>
	      
	      <div class="span3" style="text-align:center; float: left;">
		      <div class="row-fluid">
				   <div class="span10"  style="margin-bottom: 8px;"> 
				   	 <button class="btn btn-warning" type="button" onclick="deletefunction()">
				   	  <li class="icon-remove icon-white"></li>取消</button>
				   </div>
			   </div>
		  </div>
		  <div class="span3" style="text-align:left;">
		    <div class="row-fluid">
			  <div class="span10"  style="margin-bottom: 8px;"> 
		        <button style="margin-top:2px;" href="#xuanzhe" data-toggle="modal" onclick="selectRoom()"
		         class="btn btn-info"><li class="icon-plus icon-white"></li>选择房间</button>
              </div>
            </div>
          </div>
      
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>原房间号：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${list[0].roomNumber}"> 
		     </div>
		     <div class="span3">
		        <label>新房间号：</label>
		        <input id="newRoomNumberId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		      </div>
		     <div class="span3">
		        <label>新房价/天：</label>
		        <input id="roomPriceId" type="text" style="width:100%;height:27px;" readonly="readonly"> 
		     </div>
		     <div class="span3">
		        <label>换房时间：</label>
		        <input id="changRoomTimeId" type="text" style="width:100%;height:27px;" readonly="readonly" value="${timestamp}"> 
		     </div>
		  </div>
	    </div>
	   
      
      <div class="span12 ">
      <fieldset>
        <legend>原房间信息：</legend>
      </fieldset>
      </div>
      
      
      <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>原房间号：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${list[0].roomNumber}"> 
		     </div>
		     <div class="span3">
		        <label>旅客姓名：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${lvKeName}">
		      </div>
		     <div class="span3">
		        <label>接待对象：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" 
		        value="${list[0].receiveTargetID==2?'散客':list[0].receiveTeamName}"> 
		     </div>
		     <div class="span3">
               <label>出租方式：</label>
		       <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${list[0].rentOutTypeName}"> 
             </div>
		  </div>
	   </div>
	    
	    
	   <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>登记时间：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${list[0].registerTime}"> 
		     </div>
		     <div class="span3">
		        <label>房价/天：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${list[0].roomStandardPriceDay}">
		      </div>
		     <div class="span3">
		        <label>天数：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${zhuDianTianShu}"> 
		     </div>
		     <div class="span3">
               <label>住宿费：</label>
		       <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${zhuSuFei}"> 
             </div>
		  </div>
	    </div> 
	    
	    
	     <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>其他消费：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${shangPinXiaoFei}"> 
		     </div>
		     <div class="span3">
		        <label>押金：</label>
		        <input type="text" style="width:100%;height:27px;" readonly="readonly" value="${yaJin}"> 
		     </div>
		     <div class="span3">
		        <label>本次需交换房费：</label>
		        <input id="changRoomMoneyId" type="text" style="width:100%;height:27px;" readonly="readonly" value="${zhuSuFei}">
		      </div>
		       
		  </div>
	    </div> 
      
      
      
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
	          <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="changroomConfirmfunction()"><li class="icon-plus icon-white"></li>确定选择</button>
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
	      <tbody id="tbody">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="radio" name="id" value="${item.id}"></td>
		          <td>${item.roomNumber}</td>
		          <td>${item.guestRoomLevelName}</td>
		          <td>${item.roomName}</td>
		          <td>${item.roomAmount}</td>
		          <td>￥${item.standardPriceDay}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    </div>
    
    </div>
  
 
 
 
 
 <script type="text/javascript">
    function verify(){
   }
   
    function deletefunction(){
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+LvKeLeiXingId;
   }
   
     function selectRoom(){
     var tbody = document.getElementById("tbody");
    var name=document.getElementById("txtnameid").value;
    var i=0;
    $("#tbody").empty();                              // 删除 tbody 所有行
    $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/StayRegister/changRoomSelectPassenger.do',       //地址 type 带参数
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
                
                tdcheckbox.innerHTML = "<input type='radio' name='id' value='"+item.id+"'>";
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
   
   function changroomConfirmfunction(){
      var chk_value=[];
      var table=document.getElementById("tbody");
      var selectedIndex="";
      var roomPrice=""; 
      var roomNumber="";                                                     
	  $('input[name="id"]:checked').each(function(){             // 遍历获取input被checked的
	   	chk_value.push($(this).val());                             // 获取选中的ID
	    selectedIndex=this.parentNode.parentNode.rowIndex;
	    roomPrice=table.rows[selectedIndex-1].cells[5].innerHTML;
	    roomNumber=table.rows[selectedIndex-1].cells[1].innerHTML;
	  });
	  if(chk_value!=""){
        document.getElementById("roomId").value=chk_value;
        document.getElementById("newRoomNumberId").value=roomNumber;
        document.getElementById("roomPriceId").value=roomPrice;
	  }else{
	  }
   }
   
   function confirmChangRoom(){     //确定更换房间
     if(document.getElementById("newRoomNumberId").value==""){
       alert("请选择要更换到的房间！");
       return false;
     }
     var id=document.getElementById("stayId").value;
     var roomId=document.getElementById("roomId").value;
     var changRoomMoney=document.getElementById("changRoomMoneyId").value;
     var changRoomTime=document.getElementById("changRoomTimeId").value;
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/confirmChangRoom.do?id='+id+
     '&roomId='+roomId+'&changRoomMoney='+changRoomMoney+'&changRoomTime='+changRoomTime+'&LvKeLeiXingId='+LvKeLeiXingId
   }
   
 </script>
   
  </body>
</html>
