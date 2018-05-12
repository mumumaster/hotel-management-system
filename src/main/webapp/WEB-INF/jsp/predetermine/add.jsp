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
  <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
  <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
   <style>
   
   .container{
     margin-top: 10px;
     margin-left:10px;
     width:88%;
     font-size:15px;
   }
   
    .labelroomnumber{
      position: relative;
      font-size: 15px;
      float: left;
      margin-top: 15px;
    }
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:15px;
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .dgvone{
      margin-top: 12px;
    }
    
    .roomnumberwidth{
      width:70%;
    }
    
    .heigthone{
      height:26px;
    }
    .widthone{
     width:95%;
     float:left;
    }
    .widthtwo{
     width:100%;
    }
    .yansered{
      color:red;
    }
  
  </style>
  </head>
 
 
  <body>
  <div class="container" style="height:630px;overflow-x:auto;border: solid; border-color: #DDDDDD;">
    
    <input id="lvkeorteamId" type="hidden" value="${id}" >  <!-- 是团队还是旅客的ID -->
    <input id="teamId" type="hidden" value="${type}" >  <!-- 是团队还是旅客 -->
    
    <div class="span12" style="text-align: center;">
      <div class="row-fluid">
        <h3>客房预订新增</h3>
      </div>
    </div>
    
    <form id="form1"  method="post">
    <div class="span12" >
      <div class="row-fluid">
        <div class="span1">
            <button class="btn btn-info btn-small" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>保存</button>
        </div>
         <div class="span1">
            <button class="btn btn-warning btn-small" type="button" onclick="lastStep()"><li class="icon-remove icon-white"></li>取消</button>
        </div>
         <div class="span2">
            <button href="#xuanzhe" data-toggle="modal" class="btn btn-info btn-small" onclick="selectRoom()"><li class="icon-plus icon-white"></li>选择房间</button>
        </div>
      </div>
    </div>
    
    
    <div class="span12" style="margin-top:12px;">
      <div class="row-fluid">
        <div class="span2">
          <label>预订对象/旅客：</label>
          <input name="commodityName" class="widthone" style="height: 26px;"  type="text" readonly="readonly" value="${name}">
        </div>
        <div class="span2">
           <label>预订天数：</label>
           <input id="predetermineDayId" name="predetermineDay" class="widthone" 
           style="height: 26px;"  type="text" onchange="onchangeOne()">
           <div id="divOne">
	          <label class="yansered" style="margin-top:12px;">*</label>
	       </div>
        </div>
        <div class="span2">
           <label>押金：</label>
           <div class="input-prepend">
			  <span class="add-on" style="float:left;height: 15px;">&yen;</span>
		      <input id="depositId" name="deposit" onchange="onchangeOne()"
		      style="width:78%;height: 25px; float:left;" type="text" >
		      <div id="divTwo">
	             <label class="yansered" style="margin-top:7px;">*</label>
	          </div>
		   </div>      
        </div>
        <div class="span2">
           <label>支付方式</label>
           <select name="payWayID" style="height:26px;width:100%;"> 
		            <c:forEach items="${listOne}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==21}" >selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		    </select>
        </div>
         <div class="span3">
           <label>抵达时间：</label>
          <input id="arriveTimeId" name="arriveTime" style="height:26px;float:left;" id="date" class="Wdate" type="text" onchange="onchangeOne()"
		       onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{\'%y-%M-%d\'}',onpicked:pickedFunc})" />
          <div id="divThree">
	          <label class="yansered" style="margin-top:12px;">*</label>
	      </div>
        </div>
      </div>
    </div>
    </form>
    
    
  
  
    <div class="span12">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableidOne">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >房间号</th>
	          <th >客房等级</th>
	          <th >床位数</th>
	          <th >标准客房/天</th>
	         
	      </thead>
	      <tbody id="tbodyOne">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="idOne" value=""></td>
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
    
    
     <div class="modal hide fade" id="xuanzhe" style="margin-top:10px;">
       <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
	    <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">房间号：</label>
			   <input id="txtnameid" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="selectRoom()" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>搜索</button>
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
    
    
    
    
    
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
   
 
  
   var shijian="";
   function pickedFunc() {
            shijian = $dp.cal.getNewDateStr();
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
   
   var roomIdShuZu=[];
   
   function confirmfunction(){
     /*  roomIdShuZu.empty(); */
      var chk_value=[];
      var tableOne=document.getElementById("tbodyOne");
      var table=document.getElementById("tbodyTwo");
      var selectedIndex="";
      var roomNumber=[];
      var roomLevel=[];
      var roomAmount=[];
      var roomPrice=[]; 
      $('#tbodyOne').empty();
	  $('input[name="idTwo"]:checked').each(function(){             // 遍历获取input被checked的
	   	chk_value.push($(this).val());                             // 获取选中的ID
	    roomIdShuZu=chk_value;
	    selectedIndex=this.parentNode.parentNode.rowIndex;
	    roomNumber.push(table.rows[selectedIndex-1].cells[1].innerHTML);
	    roomLevel.push(table.rows[selectedIndex-1].cells[2].innerHTML);
	    roomAmount.push(table.rows[selectedIndex-1].cells[4].innerHTML);
	    roomPrice.push(table.rows[selectedIndex-1].cells[5].innerHTML);
	  });
   	 for(var i=0;i<chk_value.length;i++){
        var tr = tableOne.insertRow(-1);            // FireFox必须使用-1这个参数
       
        var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
        var tdroomNumber = tr.insertCell(-1);
        var tdguestRoomLevelName = tr.insertCell(-1);
        var tdroomAmount = tr.insertCell(-1);
        var tdstandardPriceDay = tr.insertCell(-1);
        
        tdcheckbox.innerHTML = "<input type='radio' name='idOne' value='"+chk_value[i]+"'>";
        tdroomNumber.innerHTML = roomNumber[i];
        tdguestRoomLevelName.innerHTML = roomLevel[i];
        tdroomAmount.innerHTML =roomAmount[i];
        tdstandardPriceDay.innerHTML =roomPrice[i];
	 }
   }
   
   function addfunction(){
     if(document.getElementById("predetermineDayId").value==""){
	     alert("预订天数  是必填项，不能为空哦！");
	     document.getElementById("predetermineDayId").focus();
	     return false;
      }else if(document.getElementById("depositId").value==""){
	     alert("押金  是必填项，不能为空哦！");
	     document.getElementById("depositId").focus();
	     return false;
      }else if(document.getElementById("arriveTimeId").value==""){
	     alert("抵达时间  是必填项，不能为空哦！");
	     document.getElementById("arriveTimeId").focus();
	     return false;
      }else if(document.getElementById("predetermineDayId").value.length>10){
	     alert("你输入的   预订天数   太过长了  请不要超出  10 位长度");
	     document.getElementById("predetermineDayId").focus();
	     return false;
      }else if(document.getElementById("depositId").value.length>8){
	     alert("你输入的   押金   太过长了  请不要超出  8 位长度");
	     document.getElementById("depositId").focus();
	     return false;
      }else if(document.getElementById("arriveTimeId").value.length>20){
	     alert("你输入的   抵达时间   太过长了  请不要超出  20 位长度抵达时间");
	     document.getElementById("arriveTimeId").focus();
	     return false;
      }
      if(document.getElementById("tbodyOne").rows.length==0){
        alert("还没有添加房间哦！请选择房间");
        return false;
      }
     var id= document.getElementById("lvkeorteamId").value;
     var teamId= document.getElementById("teamId").value;
     
     form1.action="${ctx}/Predetermine/add.do?id="+id+"&type="+teamId+"&roomIdShuZu="+roomIdShuZu;
     form1.submit();
   }
   
   function lastStep(){
     parent.document.getElementById('Mainid').src='${ctx}/Predetermine/tolist.do';
   }
   
   

   //验证
   function onchangeOne(){
     //预订天数
     if(document.getElementById("predetermineDayId").value!=""){
       document.getElementById("divOne").style.display="none";
       if(!document.getElementById("predetermineDayId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
       {
          document.getElementById("predetermineDayId").focus();
          document.getElementById("predetermineDayId").value="";
          document.getElementById("divOne").style.display="block"; //显示
          alert("预订天数:请输入正整数");
       }
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //押金
     if(document.getElementById("depositId").value!=""){
       document.getElementById("divTwo").style.display="none";
       if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
       {
          document.getElementById("depositId").focus();
          document.getElementById("depositId").value="";
          document.getElementById("divTwo").style.display="block"; //显示
          alert("押金 :请输入正数");
       }
     }else{
       document.getElementById("divTwo").style.display="block"; //显示
     }
     //抵达时间 
     if(document.getElementById("arriveTimeId").value!=""){
       document.getElementById("divThree").style.display="none";
     }else{
       document.getElementById("divThree").style.display="block"; //显示
     }
   }
   
   
 </script>
   
  </body>
</html>
