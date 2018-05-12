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
  <script type="text/javascript" src="${ctx}/js/common.js"></script>


   <style>
   
   .container{
     margin-top: 10px;
     margin-left:0px;
     margin-right:0px;
     width:98%;
     font-size:15px;
   }
   .span12{
     width:98%;
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
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CCFF99;
    }
    
    .roomnumberwidth{
      width:60%;
    }
    
    .heigthone{
      height:25px;
    }
    .widthone{
     width:100%;
    }
    .widthtwo{
     width:100%;
    }
    
    .XuanXiangKa{
      .active
    }
  
  </style>
  
 
 
  <body>
  <div class="container" style="height:630px;overflow-x:auto;">
    
    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
    <input id="tuanDuiId" type="hidden" value="${tuanDui}">
    
    <div class="span12">
    <div class="tabbable" >  <!-- style="border:1px solid red"  -->
      <ul class="nav nav-tabs">
        <li class="active"><a id="oneid" href="#tab1" data-toggle="tab" onclick="lvKefunction()">散客登记</a></li>
        <li ><a id="twoid" href="#tab2" data-toggle="tab" onclick="teamfunction()">团队登记</a></li>
      </ul>
      
      <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <label style="float:left;">房间号：</label>
		    <form action="" method="post" style="width:18%;float: left;">
			   <input id="txtnameid" name="txtname" class="roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="selectfunction()" type="button" class="btn-success" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>查询</button>
			   </div>
		    </form>
		    <select id="isBillID" style="width:10%;height:27px; float:left;" onchange="selectChange()">
	            <c:forEach items="${listOne}" var="item">
		          <option value="${item.far_id}" <c:if test="${item.far_id==isBillID}">selected="selected"</c:if>>
		            ${item.attributeDetailsName}
		          </option>
		        </c:forEach> 
		    </select>
		    <div class="span1" style="margin-right: 4px;">
		      <button class="btn btn-info btn-small" type="button" onclick="registerfunction()"><li class="icon-plus icon-white"></li>登记</button>
		    </div>
		    <button class="btn btn-info btn-small" type="button" onclick="arrangefunction()"><li class="icon-plus icon-white"></li>安排房间</button>
		    <button class="btn btn-info btn-small" type="button" onclick="changroomfunction()"><li class="icon-refresh icon-white"></li>换房</button>
            <button class="btn btn-info btn-small" type="button" onclick="depositfunction()"><li class="icon-eye-open icon-white"></li>押金记录</button>
            <button class="btn btn-info btn-small" type="button" onclick="consumptionfunction()"><li class="icon-gift icon-white"></li>旅客消费</button>
            <button class="btn btn-info btn-small" type="button" onclick="payfunction()"><li class="icon-heart icon-white"></li>结账</button>
            <button class="btn btn-info btn-small" type="button" onclick="shiftteamfunction()"><li class="icon-refresh icon-white"></li>转入团队 / 房间信息</button>
        </div>
        <div class="tab-pane" id="tab2">
       
        <div class="span12" style="margin-left:0px;">
          <div class="row-fluid">
             <div class="span2">
	              <label>接待对象：</label>
			      <input id="teamNameId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${teamNameId}">
             </div>
              <div class="span2">
                  <label>团队编号：</label>
			      <input id="teamCodeId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${teamCodeId}">
             </div>
              <div class="span2">
                  <label>负责人：</label>
			      <input id="principalId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${principalId}">
             </div>
              <div class="span2">
                  <label>联系电话：</label>
			      <input id="contactPhoneNUmberId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${contactPhoneNUmberId}">
             </div>
              <div class="span2">
                  <label>登记时间：</label>
			      <input id="registerTimeId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${registerTimeId}">
             </div>
              <div class="span2">
                  <label>总费用：</label>
			      <input id="sumConstId" class="widthone" style="height: 25px;"  type="text" readonly="readonly" value="${teamSumConst}">
             </div>
            </div>
         </div>
         <div class="span12" style="margin-left:0px;">
          <div class="row-fluid">
            <label style="float:left;">房间号：</label>
		    <form action="" method="post" style="width:16%; float: left;">
			   <input id="roomNumberId" class="roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="teamSelect()" type="button" class="btn-success" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>查询</button>
			   </div>
		    </form>
		    <select id="teamIsBillId" style="width:8%;height:27px; float:left; margin-right:5px;" onchange="teamSelect()">
	            <c:forEach items="${listOne}" var="item">
		          <option value="${item.far_id}" <c:if test="${item.far_id==isBillID}">selected="selected"</c:if>>
		            ${item.attributeDetailsName}
		          </option>
		        </c:forEach> 
		    </select>
            <a href="#duixiang" data-toggle="modal" class="btn btn-info btn-small" onclick="selectTarget()"><li class="icon-plus icon-white"></li>选择对象</a>
		    <button class="btn btn-info btn-small" type="button" onclick="teamRegisterfunction()"><li class="icon-plus icon-white"></li>登记</button>
		    <button class="btn btn-info btn-small" type="button" onclick="teamArrangefunction()"><li class="icon-plus icon-white"></li>安排房间</button>
		    <button class="btn btn-info btn-small" type="button" onclick="volumeroomfunction()"><li class="icon-plus icon-white"></li>批量安排房间</button>
		    <button class="btn btn-info btn-small" type="button" onclick="teamChangroomfunction()"><li class="icon-refresh icon-white"></li>换房</button>
            <button class="btn btn-info btn-small" type="button" onclick="teamDepositfunction()"><li class="icon-eye-open icon-white"></li>押金记录</button>
            <button class="btn btn-info btn-small" type="button" onclick="teamConsumptionfunction()"><li class="icon-gift icon-white"></li>旅客消费</button>
            <button class="btn btn-info btn-small" type="button" onclick="teampayfunction()"><li class="icon-heart icon-white"></li>结账</button>
            <button class="btn btn-info btn-small" type="button" onclick="shiftpersonagefunction()"><li class="icon-refresh icon-white"></li>转为散客</button>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
    <div class="span12">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >房间号</th>
	          <th >客房等级</th>
	          <th >床位数</th>
	          <th style="width:12%;">接待对象</th>
	          <th >旅客姓名</th>
	          <th >旅客类别</th>
	          <th >换房次数</th>
	          <th >换房费</th>
	          <th >换房时间</th>
	          <th >登记时间</th>
	          <th >总费用</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <c:if test="${item.remind==1}">
			        <tr style="color: red;">
			          <td><input type="checkbox" name="id" value="${item.id}"></td>
			          <td>${item.roomNumber}</td>
			          <td>${item.roomGuestRoomLevelName}</td>
			          <td>${item.roomAmount}</td>
			          <c:if test="${item.receiveTargetID==2}">
			              <td>${item.predetermineReceiveTargeTypeName}</td>
			          </c:if>
			          <c:if test="${item.receiveTargetID!=2}">
			              <td style="width:12%;">${item.receiveTeamName}</td>
			          </c:if>
			          <td>${item.passengerName}</td>
			          <td>${item.passengerTypeName}</td>
			          <td>${item.changingRoomNumber}</td>
			          <td>${item.changRoomMoney}</td>
			          <td>${item.changRoomTime}</td>
			          <td>${item.registerTime}</td>
			          <td>${item.sumConst}</td>
			          <td hidden>${item.isBillID}</td>
			          <td hidden>${item.stayregisterdetailsId}</td>
			        </tr>
		        </c:if>
		        <c:if test="${item.remind==0}">
			        <tr >
			          <td><input type="checkbox" name="id" value="${item.id}"></td>
			          <td>${item.roomNumber}</td>
			          <td>${item.roomGuestRoomLevelName}</td>
			          <td>${item.roomAmount}</td>
			          <c:if test="${item.receiveTargetID==2}">
			              <td>${item.predetermineReceiveTargeTypeName}</td>
			          </c:if>
			          <c:if test="${item.receiveTargetID!=2}">
			              <td>${item.receiveTeamName}</td>
			          </c:if>
			          <td>${item.passengerName}</td>
			          <td>${item.passengerTypeName}</td>
			          <td>${item.changingRoomNumber}</td>
			          <td>${item.changRoomMoney}</td>
			          <td>${item.changRoomTime}</td>
			          <td>${item.registerTime}</td>
			          <td>${item.sumConst}</td>
			          <td hidden>${item.isBillID}</td>
			          <td hidden>${item.stayregisterdetailsId}</td>
			        </tr>
		        </c:if>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    
    
    
    
    <div class="modal hide fade" id="duixiang" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
            <div class="span8">
		      <label class="labelroomnumber">团队名称：</label>
			   <input id="txtnameidTwo" name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字">
			   <div class="input-append">  
			      <button class="btn-success textone" style="margin-left:-4px;height:26px;" onclick="selectTarget()"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="confirmRarget()" data-dismiss="modal"><li class="icon-plus icon-white"></li>确定选择</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">对象类别</th>
	          <th rowspan="2">团队名称</th>
	          <th rowspan="2">团队编号</th>
	          <th rowspan="2">负责人</th>
	          <th rowspan="2">登记时间</th>
	          <th rowspan="2">电话号码</th>
	        </tr>
	      </thead>
	      <tbody id="tbodyTwo">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="radio" id="idTwo" value=""></td>
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
    </div>
    
    
    <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：</label>
			   <input name="txtname" class="textone" style="width:60%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button type="submit" class="btn-success textone" style="margin-left:-4px;height:26px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>确定</button>
	       </div>
	    </div>
	     <div class="dgvone" style="width:93%;">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >姓名</th>
	          <th >性别</th>
	          <th >证件类型</th>
	          <th >证件号码</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="" var="item">
		        <tr>
		          <td><input type="checkbox" name="twoid" value="${item.id}"></td>
		          <td>${item.roomNumber}</td>
		          <td>${item.guestRoomLevelName}</td>
		          <td>${item.roomName}</td>
		          <td>${item.roomAmount}</td>
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
 
   function registerfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var roomNumber="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		roomNumber=table.rows[selectedIndex-1].cells[1].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！");
       return;
     }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("登记只能根据一个房间登记");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toregister.do?id='+chk_value+
		   '&roomNumber='+roomNumber+'&LvKeLeiXingId='+55;
		}
	}else{
	  alert("请选择一条房间进行登记");
	}
     /* parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toregister.do'; */
   }
   
   function teamRegisterfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var roomNumber="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		roomNumber=table.rows[selectedIndex-1].cells[1].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！");
       return;
     }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("登记只能根据一个房间登记");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toregister.do?id='+chk_value+
		   '&roomNumber='+roomNumber+'&LvKeLeiXingId='+56;
		}
	}else{
	  alert("请选择一条房间进行登记");
	}
     /* parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toregister.do'; */
   }
   
   
 
   function addfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Predetermine/toadd.do';
   }
   
   function arrangefunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toarrangeroom.do?LvKeLeiXingId='+55;
   }
   
   function teamArrangefunction(){
     var tuanDuiID=document.getElementById("tuanDuiId").value;
     if(tuanDuiID!=""){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toarrangeroom.do?tuanDuiID='+tuanDuiID+
        '&LvKeLeiXingId='+56;
     }else{
        alert("请选择对象再安排房间！");
     }
   }
   
   function changroomfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！");
       return;
     }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间进行换房哦");
		}else{
		   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tochangroom.do?id='+
		   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+55;
		}
	}else{
	  alert("请选择一条数据进行换房");
	}
   }
   
   function teamChangroomfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！");
       return;
     }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间进行换房哦");
		}else{
		   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tochangroom.do?id='+
		   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+56;
		}
	}else{
	  alert("请选择一条数据进行换房");
	}
   }
   
   
   
   function depositfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间查看押金记录哦");
		}else{
		   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/todeposit.do?id='+
		   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+55;
		}
	}else{
	  alert("请选择一条数据进行查看押金记录");
	}
   }
   
   function teamDepositfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间查看押金记录哦");
		}else{
		   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/todeposit.do?id='+
		   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+56;
		}
	}else{
	  alert("请选择一条数据进行查看押金记录");
	}
   }
   
   
   
   function consumptionfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var roomNumber="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  		roomNumber=table.rows[selectedIndex-1].cells[1].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间添加消费哦");
		}else{
		    if(lvKeName==""){
			   alert("请先登记");
			}else{
			   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toconsumption.do?id='+
			   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+55+'&roomNumber='+roomNumber+'&isBillID='+TOF;
		   }
		}
	}else{
	  alert("请选择一条数据进行添加消费");
	}
   }
   
   function teamConsumptionfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var roomNumber="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  		roomNumber=table.rows[selectedIndex-1].cells[1].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间添加消费哦");
		}else{
			if(lvKeName==""){
			   alert("请先登记");
			}else{
			   parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toconsumption.do?id='+
			   chk_value+'&lvKeName='+lvKeName+'&LvKeLeiXingId='+56+'&roomNumber='+roomNumber+'&isBillID='+TOF;
			}
		}
	}else{
	  alert("请选择一条数据进行添加消费");
	}
   }
   
   
   
   function payfunction(){
     var chk_value=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var lvKeName="";
     var TOF=0;
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		lvKeName=table.rows[selectedIndex-1].cells[5].innerHTML;
  		TOF=table.rows[selectedIndex-1].cells[12].innerHTML;
  	});
  	if(TOF==69){
       alert("很抱歉！该数据已经结账没法进行此操作！");
       return;
     }
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个房间进行结账哦");
		}else{
		    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/topay.do?id='+chk_value+'&lvKeName='+lvKeName;
		}
	}else{
	  alert("请选择一条数据进行结账");
	}
   }
   
   function volumeroomfunction(){
     var tuanDuiID=document.getElementById("tuanDuiId").value;
     var teamName=document.getElementById("teamNameId").value;
     if(tuanDuiID!=""){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tovolumeroom.do?tuanDuiID='+
        tuanDuiID+'&teamName='+teamName;
     }else{
        alert("请选择对象再安排房间！");
     }
   }
   
   function teamdepositfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toteamdeposit.do';
   }
   
   function teampayfunction(){
     var tuanDuiID=document.getElementById("tuanDuiId").value;
     var teamIsBillId=document.getElementById("teamIsBillId").value;
     if(teamIsBillId==69){
       alert("很抱歉！该状态为已结账没法进行此操作！");
       return;
     }
     if(tuanDuiID!=""){
        parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toteampay.do?tuanDuiID='+tuanDuiID;
     }else{
        alert("请选择对象再结账！");
     }
   }
   
    function shiftpersonagefunction(){
	    var id=[];
	    var table=document.getElementById("tbody");
	    var selectedIndex="";
	    var stayregisterdetailsId="";
	  	$('input[name="id"]:checked').each(function(){
	  		id.push($(this).val());
	  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		    stayregisterdetailsId=table.rows[selectedIndex-1].cells[13].innerHTML;
	  	});
	  	if(stayregisterdetailsId==""){
	  	   alert("此房间还没有登记哦！不能进行此操作");
	  	   return false;
	  	}
	  	if(id!=""){
	  	  if(id.toString().indexOf(",")>0){
			   alert("转为散客只能选择一条");
			}else{
			    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toshiftpersonage.do?id='+id+
		    '&stayregisterdetailsId='+stayregisterdetailsId
			}
	  	}else{
		  alert("请选择一条数据进行转为散客");
		}
   }
   
   
   function shiftteamfunction(){
    var id=[];
    var table=document.getElementById("tbody");
    var selectedIndex="";
    var stayregisterdetailsId="";
  	$('input[name="id"]:checked').each(function(){
  		id.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;
  		stayregisterdetailsId=table.rows[selectedIndex-1].cells[13].innerHTML;
  	});
  	if(stayregisterdetailsId==""){
  	   alert("此房间还没有登记哦！不能进行此操作");
  	   return false;
  	}
  	if(id!=""){
  	  if(id.toString().indexOf(",")>0){
		   alert("转入团队只能选择一条");
		}else{
		    parent.document.getElementById('Mainid').src='${ctx}/StayRegister/toshiftteam.do?id='+id+
		    '&stayregisterdetailsId='+stayregisterdetailsId;
		}
  	}else{
	  alert("请选择一条数据进行转入团队");
	}
   }

   
   function updatefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("修改只能选择一条");
		}else{
		   parent.document.getElementById("Mainid").src='${ctx}/ReceiveTarget/toupdate.do?id='+chk_value;
		}
	}else{
	  alert("请选择一条数据进行修改");
	}
  }
  
   function deletefunction(){
   var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
  	var flag=window.confirm("注意：您确定要永久删除该信息吗?");
     if(flag){
  	  parent.document.getElementById("Mainid").src='${ctx}/ReceiveTarget/delete.do?id='+chk_value;
  	}
  	}else{
	  alert("请选择一条或多条数据进行删除");
	}
	
  }
  
  
 if(${LvKeLeiXingId==55}){
    $('#oneid').tab('show');
  }else if(${LvKeLeiXingId==56}){
    $('#twoid').tab('show');
  } 

  
  
  function selectChange(){
    var isBillID=document.getElementById("isBillID").value;
    parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?isBillID='+isBillID+
    '&LvKeLeiXingId='+55;
  }
  
  
  function selectfunction(){
    var isBillID=document.getElementById("isBillID").value;
    var txtname=document.getElementById("txtnameid").value;
    parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+55+
    '&isBillID='+isBillID+"&txtname="+txtname;
  }
  
  
  function teamSelect(){
    var isBillID=document.getElementById("teamIsBillId").value;
    var txtname=document.getElementById("roomNumberId").value;
    var tuanDuiID=document.getElementById("tuanDuiId").value;
    var teamNameId=document.getElementById("teamNameId").value;
  	var teamCodeId=document.getElementById("teamCodeId").value;
  	var principalId=document.getElementById("principalId").value;
  	var contactPhoneNUmberId=document.getElementById("contactPhoneNUmberId").value;
  	var registerTimeId=document.getElementById("registerTimeId").value;
    parent.document.getElementById("Mainid").src='${ctx}/StayRegister/toteamlist.do?LvKeLeiXingId='+56+
    '&isBillID='+isBillID+"&txtname="+txtname+"&tuanDuiID="+tuanDuiID+"&teamNameId="+teamNameId
    +"&teamCodeId="+teamCodeId+"&principalId="+principalId+
    "&contactPhoneNUmberId="+contactPhoneNUmberId+"&registerTimeId="+registerTimeId;
  }
  
  
  function teamfunction(){
     parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+56;
  }
   function lvKefunction(){
     parent.document.getElementById("Mainid").src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+55;
  }
  
  
  function selectTarget(){
     var tbody = document.getElementById("tbodyTwo");
     var name=document.getElementById("txtnameidTwo").value;
     var i=0;
     $("#tbodyTwo").empty();
     $.ajax({      
         cache:false,
         type: "POST",
         url: '${ctx}/Predetermine/selectTarget.do',
         data:"txtname="+name,
         async:false,
         success: function (result) { 
            for (var key in result) { 
                i++;               
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数
               
                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdTargetTypeName = tr.insertCell(-1);
                var tdTeamName = tr.insertCell(-1);
                var tdTeamCode = tr.insertCell(-1);
                var tdPrincipal = tr.insertCell(-1);
                var tdRegisterTime = tr.insertCell(-1);
                var tdContactPhoneNUmber=tr.insertCell(-1);
                
                tdcheckbox.innerHTML = "<input type='radio' name='idTwo' value='"+item.id+"'>";
                tdTargetTypeName.innerHTML = item.targetTypeName;
                tdTeamName.innerHTML = item.teamName;
                tdTeamCode.innerHTML =item.teamCode;         //中间这个是数据
                tdPrincipal.innerHTML =item.principal;
                tdRegisterTime.innerHTML =new Date(item.registerTime).Format("yyyy-MM-dd hh:mm:ss");
                tdContactPhoneNUmber.innerHTML=item.contactPhoneNUmber;
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据");
            }               
          },
          error: function(data) {
           }
     });
   }
   
   
   function confirmRarget(){
    var chk_value=[];
    var table=document.getElementById("tbodyTwo");                         
    var selectedIndex="";                     
	var teamName="";
    var teamCode="";
    var principal="";
    var contactPhoneNUmber="";
    var registerTime="";
  	$('input[name="idTwo"]:checked').each(function(){
  		chk_value.push($(this).val());
  		selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
  		teamName=table.rows[selectedIndex-1].cells[2].innerHTML;     // 获取选中的索引的 单元格的值
  		teamCode=table.rows[selectedIndex-1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
  		principal=table.rows[selectedIndex-1].cells[4].innerHTML;     // 获取选中的索引的 单元格的值
  		contactPhoneNUmber=table.rows[selectedIndex-1].cells[6].innerHTML;     // 获取选中的索引的 单元格的值
  		registerTime=table.rows[selectedIndex-1].cells[5].innerHTML;     // 获取选中的索引的 单元格的值
  	});
  	document.getElementById("tuanDuiId").value=chk_value;
  	document.getElementById("teamNameId").value=teamName;
  	document.getElementById("teamCodeId").value=teamCode;
  	document.getElementById("principalId").value=principal;
  	document.getElementById("contactPhoneNUmberId").value=contactPhoneNUmber;
  	document.getElementById("registerTimeId").value=registerTime;
  	
  	var isBillID=document.getElementById("teamIsBillId").value;
    var tuanDuiID=document.getElementById("tuanDuiId").value;
  	teamSelect();
  	/* $.ajax({
  	      cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/StayRegister/ajaxSelectTeamSumcont.do',   //地址 type 带参数
          data:"tuanDuiID="+tuanDuiID+"&isBillID="+isBillID,     // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {  
             document.getElementById("sumConstId").value=result;    
          },
          error: function(data) {
        }
  	}); */
   }
   
   
  
  
  $('#duixiang').modal().css({
       'width':'72%',
	   'margin-left':function(){
	   return -($(this).width()/2);
	   }
   });
 $('#duixiang').modal('hide');
  
   
   
   
   
   
  /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
      var isBillID=document.getElementById("isBillID").value;
      var txtname=document.getElementById("txtnameid").value;
      var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
     location.href="${ctx}/StayRegister/tolist.do?currentPage="+p+"&txtname="+txtname+
     "&isBillID="+isBillID+"&LvKeLeiXingId="+LvKeLeiXingId;
     }
   });
   
  
 </script>
   
  </body>
</html>
