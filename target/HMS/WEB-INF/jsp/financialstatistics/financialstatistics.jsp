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
  <script type="text/javascript" src="${ctx}/My97DatePicker/WdatePicker.js"></script>
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
    <div class="span12" style="margin-top:10px;">
       <div class="row-fluid">
           <div class="span5">
              <label style="float:left;">结账区段：</label>
	          <!--最大日期为 id="datemax"的选中值或者当前系统日期-->
	          <input style="width:25%;height:26px;" type="text" id="datemin" class="input-text Wdate"
	          onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" value="${min}"> ~ 
		      <!--最大日期为当前系统日期，最小日期为id="datemin选中值"-->
			  <input style="width:25.5%;height:26px;" type="text" id="datemax" class="input-text Wdate"
			  onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${max}">
	          <button onclick="timeSelect()" type="button" class="btn-success" style="margin-top:-12px;height:25px;"><li class="icon-search icon-white"></li>查询</button>
              <button onclick="particulars()" type="button" class="btn-info" style="margin-top:-12px;height:25px;"><li class="icon-zoom-in icon-white"></li>详情</button>
           </div>
	          <label style="float:left;">出租房间数：</label>
              <label style="float:left;margin-right:15px;">${chuZuFangJianShu}</label>
              <label style="float:left;">住宿人数：</label>
              <label style="float:left;margin-right:15px;">${zhuSuRenShu}</label>
              <label style="float:left;">消费金额总计：</label>
              <label style="float:left;margin-right:15px;color:blue;">${xiaoFeiJinE}</label>
              <label style="float:left;">结账金额总计：</label>
              <label style="float:left;color:red;">${JieZhangJinE}</label>
       </div>
    </div>
    <div class="span12" style="margin-top:10px;">
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th >选择</th>
	          <th >房间号</th>
	          <th style="width:15%;">接待对象</th>
	          <th >旅客姓名</th>
	          <th >换房次数</th>
	          <th >换房时间</th>
	          <th >登记时间</th>
	          <th >结账时间</th>
	          <th >总费用</th>
	        </tr>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr >
		          <td><input type="radio" name="id" value="${item.id}"></td>
		          <td>${item.roomNumber}</td>
		          <c:if test="${item.receiveTargetID==2}">
		              <td>${item.predetermineReceiveTargeTypeName}</td>
		          </c:if>
		          <c:if test="${item.receiveTargetID!=2}">
		              <td style="width:15%;">${item.receiveTeamName}</td>
		          </c:if>
		          <td>${item.passengerName}</td>
		          <td>${item.changingRoomNumber}</td>
		          <td>${item.changRoomTime}</td>
		          <td>${item.registerTime}</td>
		          <td>${item.payTime}</td>
		          <td>${item.sumConst}</td>
		          <td hidden>${item.stayregisterdetailsId}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    </div>
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
 

   function timeSelect(){
     var datemin=document.getElementById("datemin").value;
     var datemax=document.getElementById("datemax").value;
     parent.document.getElementById('Mainid').src='${ctx}/FinancialStatistics/tolist.do?datemin='+
     datemin+'&datemax='+datemax;
   }
   
   function particulars(){
     var id=[];
     var table=document.getElementById("tbody");
     var selectedIndex="";
     var stayregisterdetailsId="";
     var datemin=document.getElementById("datemin").value;
     var datemax=document.getElementById("datemax").value;
     $('input[name="id"]:checked').each(function(){             // 遍历获取input被checked的
  		id.push($(this).val());                             // 获取选中的ID
  	    selectedIndex=this.parentNode.parentNode.rowIndex;
  	    stayregisterdetailsId=table.rows[selectedIndex-1].cells[9].innerHTML;
  	});
  	if(stayregisterdetailsId==""){
  	   alert("请选择一个房间再按 详情");
  	   return false;
	}
  	if(id!=""){
  	   parent.document.getElementById('Mainid').src='${ctx}/FinancialStatistics/toinformation.do?id='
  	   +id+'&stayregisterdetailsId='+stayregisterdetailsId+'&min='+datemin+'&max='+datemax;
  	}else{
  	   alert("请选择一个房间再按 详情");
  	}
   }
   
   
   
   
  /* 分页要用的 */
  $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
	     var datemin=document.getElementById("datemin").value;
	     var datemax=document.getElementById("datemax").value;
	     location.href="${ctx}/FinancialStatistics/tolist.do?currentPage="+p+
	     "&datemin="+datemin+"&datemax="+datemax;
     }
   });
   
  
 </script>
   
  </body>
</html>
