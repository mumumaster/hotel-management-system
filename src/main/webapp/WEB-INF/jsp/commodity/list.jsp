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
 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <link rel="stylesheet" href="${ctx}/css/amazeui.min.css" type="text/css"></link>
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
  <script type="text/javascript" src="${ctx }/js/layer/layer.js"></script>
  <script type="text/javascript" src="${ctx }/js/amazeui.min.js"></script>
  
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
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:16px;
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
    

  
  </style>
  
  </head>
 
  <body>
  <div class="container" >
    <div class="span4">
	    <div class="row-fluid">
		    <label class="labelroomnumber" style="font-size:16px;">商品名：</label>
		    <form action="" method="post" style="float: left;">
			   <input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button type="button" onclick="selectFunction()" class="btn btn-success  btn-small textone" style="margin-left:-5px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
		    </form>
	    </div>
    </div>
    <div class="span6">
      <div class="row-fluid">
       <div class="span5">
         <select id="selectCboId" name="commodityTypeID" class="dgvone" style="width:80%;" onchange="selectChange()">
            <c:forEach items="${listOne}" var="item">
	          <option value="${item.far_id}" <c:if test="${item.far_id==commodityType}">selected="selected"</c:if>>
	            ${item.attributeDetailsName}
	          </option>
	        </c:forEach> 
		  </select>
		  <button id="" class="textone"  data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0, width: 300, height: 600}"><li class="icon-plus"></li></button>
       </div>
       <div class="span2">
         <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>新增</button>
       </div>
       <div class="span2">
         <button class="btn btn-warning btn-small textone" type="button" onclick="updatefunction()"><li class="icon-pencil icon-white"></li>修改</button>
       </div>
       <div class="span2">
         <button class="btn btn-danger btn-small textone" type="button" onclick="deletefunction()"><li class="icon-remove icon-white"></li>删除</button>
       </div>
       
      </div>
    </div>
    <br>
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">商品名称</th>
	          <th rowspan="2">商品类别</th>
	          <th rowspan="2">计量单位</th>
	          <th rowspan="2">销售价格</th>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${list.result}" var="item">
		        <tr>
		          <td><input type="checkbox" name="id" value="${item.id}"></td>
		          <td>${item.commodityName}</td>
		          <td>${item.commodityTypeName}</td>
		          <td>${item.uOMName}</td>
		          <td>${item.salePrice}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 <div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
		  <div style="background:#fff" class="am-modal-dialog">
		    <div style="background:#0e90d2; color: #fff" class="am-modal-hd">商品类别操作
		      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    </div>
		    <!-- 内容 -->
		  <div>
<div class="container" >
  <div class="span3">
    <div class="span4">
	    <div class="row-fluid">
		    <label id="bie" class="labelroomnumber" style="margin-left: -20px; font-size: 15px;">商品名：</label>
		    <form action="" method="post" style="float: left;">
			   <input id="newtxtnameid" type="text" placeholder="请输入要新增的商品名称" style="width:120%;height: 26px;margin-top: 11px;">
		    </form>
	    </div>
    </div>
    <div >
       <button style="margin-top:-23px;" class="btn btn-info btn-small" type="button" onclick="newaddfunction()"><li class="icon-plus icon-white"></li>新增</button>
    
       <button style="margin-top:-23px;" class="btn btn-danger btn-small" type="button" onclick="newdeletefunction()"><li class="icon-remove icon-white"></li>删除</button>
    </div>
    <br>
    <div class="dgvone" style="margin-top:-18px;width:267px;height:443px;overflow:scroll;">
       <table class="table table-condensed table-bordered table-striped" id="tableid" style="width: 250px;height: 20px;">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">商品名称</th>
	      </thead>
	      <tbody id="tbody">
	        <c:forEach items="${listOne}" var="item">
		        <tr>
		          <td><input type="checkbox" name="newid" value="${item.far_id}"></td>
		          <td>${item.attributeDetailsName}</td>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
  </div>
 
  <div/>   
          <!-- 内容 -->  
<div/>
</div>
<div/>
 
 
 <script type="text/javascript">
   function addfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/Commodity/toadd.do';
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
		   parent.document.getElementById("Mainid").src='${ctx}/Commodity/toupdate.do?id='+chk_value;
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
  	  parent.document.getElementById("Mainid").src='${ctx}/Commodity/delete.do?id='+chk_value;
  	}
  	}else{
	  alert("请选择一条或多条数据进行删除");
	}
	
  }
  
  
  
   function selectChange(){
     var commodityTypeID=document.getElementById("selectCboId").value;
     parent.document.getElementById('Mainid').src='${ctx}/Commodity/tolist.do?commodityTypeID='+commodityTypeID;
   }
  
   
   /* 分页要用的 */
   $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
     var txtname=document.getElementById("txtnameid").value;
     var commodityTypeID=document.getElementById("selectCboId").value;
     location.href="${ctx}/Commodity/tolist.do?currentPage="+p+"&txtname="+txtname+"&commodityTypeID="+commodityTypeID;
     }
   });
   
   function selectFunction(){
     var txtname=document.getElementById("txtnameid").value;
     var commodityTypeID=document.getElementById("selectCboId").value;
     parent.document.getElementById('Mainid').src='${ctx}/Commodity/tolist.do?commodityTypeID='+commodityTypeID+'&txtname='+txtname;
   }
   
   
   function newaddfunction(){
   var txtname=document.getElementById("newtxtnameid").value;
     parent.document.getElementById('Mainid').src='${ctx}/Commodity/newadd.do?txtname='+txtname;
   }
   
   function newdeletefunction(){
   var chk_value=[];
  	$('input[name="newid"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
  	var flag=window.confirm("注意：您确定要永久删除该信息吗?");
     if(flag){
  	  parent.document.getElementById("Mainid").src='${ctx}/Commodity/newdelete.do?id='+chk_value;
  	}
  	}else{
	  alert("请选择一条或多条数据进行删除");
	}
	
  }
  
 </script>
   
  </body>
</html>
