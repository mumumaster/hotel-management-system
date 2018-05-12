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
        <h3 style="text-align: center;">旅客登记</h3>
        
      </div>
    </div>
    <a href="#lvke" style="margin-left:20px;margin-top:10px;" data-toggle="modal" class="btn btn-info btn-small" onclick="souSuo()"><li class="icon-plus icon-white"></li>选择旅客</a>
    <form id="form1" method="post" onsubmit="return verify()">
    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    
	    <input id="lvKeId" name="lvKeID" type="hidden">                                       <!-- 旅客ID -->
	    <input id="stayRegisterId" name="stayRegisterID" type="hidden" value="${stayRegisterId}">     <!-- 住宿登记ID -->
	    <input id="LvKeLeiXingId" type="hidden" value="${LvKeLeiXingId}">
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>房间号：</label>
		        <input type="text" style="width:100%;height:25px;" readonly="readonly" value="${roomNumber}"> 
		     </div>
		     <div class="span3">
		        <label>姓名：</label>
		        <input id="nameId" name="name" onblur="nameOne(this.value)" 
		        type="text" style="width:97%;height:27px;" onchange="onchangeOne()">
		        <div id="divOne" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>
		     <div class="span3">
		        <label>性别：</label>
		        <select id="genderId" name="genderID" onchange="gender(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listGender}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==31}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>民族：</label>
		         <select id="nationId" name="nationID" onchange="nation(this.value)" style="width:100%;height:27px;">
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
		        <input id="faZhengId" name="licenceIssuingAuthorty" onblur="licenceIssuingAuthortyOne(this.value)" type="text" style="width:100%;height:27px;"> 
		     </div>
		     <div class="span3">
		        <label>证件有效期：</label>
		        <input id="papersValidityId" name="papersValidity" onblur="papersValidityOne(this.value)" type="text" style="width:100%;height:27px;"  placeholder="年-月-日 至 年-月-日"> 
		      </div>
		     <div class="span3">
		        <label>职业：</label>
		        <input id="professionId" name="profession" onblur="professionOne(this.value)" type="text" style="width:100%;height:27px;">
		     </div>
		     <div class="span3">
		        <label>文化程度：</label>
		         <select id="educationDegreeId" name="educationDegreeID" onchange="educationDegree(this.value)" style="width:100%;height:27px;">
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
		         <select id="passengerLevelId" name="passengerLevelID" onchange="passengerLevel(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listPassengerLevel}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==52}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		     </div>
		     <div class="span3">
		        <label>证件类型：</label>
		        <select id="papersId" name="papersID" onchange="papers(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listPapers}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==37}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		        
		      </div>
		     <div class="span3">
		        <label>证件号码：</label>
		        <input id="papersNumberId" name="papersNumber" onblur="papersNumberOne(this.value)" 
		        type="text" style="width:97%;height:27px;" onchange="onchangeOne()"> 
		        <div id="divTwo" style="float:right;">
			         <label class="yansered" style="margin-top:7px;">*</label>
			    </div> 
		     </div>
		     <div class="span3">
		        <label>单位或住址：</label>
		         <input id="unitsOrAddressId" name="unitsOrAddress" onblur="unitsOrAddressOne(this.value)" type="text" style="width:100%;height:27px;">  
		     </div>
		  </div>
	    </div>
	   <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		     <div class="span3">
		        <label>出生日期：</label>
		        <input id="birthDateId" name="birthDate" onblur="birthDateOne(this.value)" type="text" style="width:100%;height:27px;" placeholder="年-月-日"> 
		     </div>
		     <div class="span3">
		        <label>事由：</label>
		        <select id="thingReasonId" name="thingReasonID" onchange="thingReason(this.value)" style="width:100%;height:27px;">
		            <c:forEach items="${listThingReason}" var="item">
			          <option value="${item.far_id}" <c:if test="${item.far_id==51}">selected="selected"</c:if>>
			            ${item.attributeDetailsName}
			          </option>
			        </c:forEach> 
		          </select>
		        
		      </div>
		     <div class="span3">
		        <label>从何处来：</label>
		       <input id="whereAreFromId" name="whereAreFrom" onblur="whereAreFromOne(this.value)" type="text" style="width:100%;height:27px;"> 
		     </div>
		     <div class="span3">
		        <label>到哪里去：</label>
		        <input id="whereToGoId" name="whereToGo" onblur="whereToGoOne(this.value)" type="text" style="width:100%;height:27px;">
		     </div>
		  </div>
	    </div>
	    <!--  ———————————————————————————————————————————————————————————————————————————————————————— -->
	    <div class="span12">
	      <div class="row-fluid">
		    <div class="span3">
		   	   <label class="labelroomnumber" style="font-size:15px">联系电话：</label>
	           <input id="contactPhoneNUmberId" name="contactPhoneNUmber" onblur="contactPhoneNUmberOne(this.value)" 
	           style="width:100%;height:27px;" type="text" onchange="onchangeOne()">
			</div>
	      </div>
	    </div>
	    <div class="span12">
	      <label style="float: left;">备注：</label>
	      <input id="remarksId" name="remarks" onblur="remarksOne(this.value)" type="text" style="width:100%;height:27px;"> 
	    </div>
	    
	
		  <div class="span6" style="text-align:center;">
		      <div class="row-fluid">
			      <div class="span12" style="margin-top: 10px;margin-bottom: 8px;">
				   	 <button class="btn btn-primary" type="button" onclick="tijiao()">
				   	 <li class="icon-check icon-white"></li>保存</button>
				  </div> 
				 
			  </div>
	      </div>
      </form>
      
      
      <div class="modal hide fade" id="lvke" style="text-align: center;">
      <div class="span5" style="width:98%;height:480px; overflow-x:auto;">
         <div class="row-fluid">
		   <div class="span8">
		      <label class="labelroomnumber">旅客姓名：</label>
			   <input id="txtnameid" name="txtname" class="textone" style="width:55%; border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:27px;" type="text" placeholder="请输入关键字" value="${txtname}">
			   <div class="input-append">  
			      <button onclick="souSuo()" class="btn-success textone" style="margin-left:-4px;height:27px;"><li class="icon-search icon-white"></li>搜索</button>
			   </div>
	       </div>
	       <div class="span4">
	          <button data-dismiss="modal" class="btn btn-info btn-small textone" type="button" onclick="confirmfunction()"><li class="icon-plus icon-white"></li>确定选择</button>
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
	        <c:forEach items="${list}" var="item">
		        <tr>
		          <td><input type="radio" name="id" value="${item.id}"></td>
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
    var Name="";
    function verify(){
   }
   
    function deletefunction(){
     var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
     parent.document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do?LvKeLeiXingId='+LvKeLeiXingId;
   }
   
   
   
   function souSuo(){
     var tbody = document.getElementById("tbody");
     var name=document.getElementById("txtnameid").value;
     var i=0;
     $("#tbody").empty();
     $.ajax({      
         cache:false,
         type: "POST",
         url: '${ctx}/StayRegister/selectPassenger.do',
         data:"txtname="+name,
         async:false,
         success: function (result) { 
            for (var key in result) { 
                i++;               
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数
               
                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdName = tr.insertCell(-1);
                var tdGender = tr.insertCell(-1);
                var tdPapersName = tr.insertCell(-1);
                var tdPapersNumber = tr.insertCell(-1);
                
                tdcheckbox.innerHTML = "<input type='radio' name='id' value='"+item.id+"'>";
                tdName.innerHTML = item.name;
                tdGender.innerHTML = item.genderName;
                tdPapersName.innerHTML =item.papersName;         //中间这个是数据
                tdPapersNumber.innerHTML =item.papersNumber;
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据");
            }               
          },
          error: function(data) {
           }
     });
   }
   
   var xingMing="";
   var xingBie="";
   var minZu="";
   var faZhengJiGuang="";
   var zhengJiaYouXiaoQi="";
   var jiYe="";
   var wenHuaChengDu="";
   var lvKeJiBie="";
   var zhengJianLeiXing="";
   var zhengJianHaoMa="";
   var danWeiHuoZhuChu="";
   var chuShengRiQi="";
   var shiYou="";
   var congHeChuLai="";
   var daoNaLiQu="";
   var lianXiDianHua="";
   var beiZhu="";
   
   function confirmfunction(){
     var chk_value=[];
  	$('input[name="id"]:checked').each(function(){
  		chk_value.push($(this).val());
  	});
  	if(chk_value!=""){
		if(chk_value.toString().indexOf(",")>0){
		   alert("只能选择一个用户");
		}else{
		 
	        $.ajax({      
	         cache:false,
	         type: "POST",
	         url: '${ctx}/StayRegister/confirmPassenger.do',
	         data:"id="+chk_value,
	         async:false,
	         success: function (result) {
	         
	            Name=result.papersNumber;
	            document.getElementById("divTwo").style.display="none";
	            document.getElementById("divOne").style.display="none";
	        
	            document.getElementById("lvKeId").value=result.id;
	            
	            document.getElementById("nameId").value=result.name;
	            document.getElementById("genderId").value=result.genderID;
	            document.getElementById("nationId").value=result.nationID;
	            document.getElementById("faZhengId").value=result.licenceIssuingAuthorty;
	            document.getElementById("professionId").value=result.profession;
	            document.getElementById("papersValidityId").value=result.papersValidity;
	            document.getElementById("educationDegreeId").value=result.educationDegreeID;
	            document.getElementById("passengerLevelId").value=result.passengerLevelID;
	            document.getElementById("papersId").value=result.papersID;
	            document.getElementById("papersNumberId").value=result.papersNumber;
	            document.getElementById("unitsOrAddressId").value=result.unitsOrAddress;
	            document.getElementById("birthDateId").value=result.birthDate;
	            document.getElementById("thingReasonId").value=result.thingReasonID;
	            document.getElementById("whereAreFromId").value=result.whereAreFrom;
	            document.getElementById("whereToGoId").value=result.whereToGo;
	            document.getElementById("contactPhoneNUmberId").value=result.contactPhoneNumber;
	            document.getElementById("remarksId").value=result.remarks;
	            
	            document.getElementById("genderId").style.color='blue';
	            document.getElementById("nationId").style.color='blue';
	            document.getElementById("educationDegreeId").style.color='blue';
	            document.getElementById("passengerLevelId").style.color='blue';
	            document.getElementById("papersId").style.color='blue';
	            document.getElementById("thingReasonId").style.color='blue';
	            
	            xingMing=result.name;
	            xingBie=result.genderID;
	            minZu=result.nationID;
	            faZhengJiGuang=result.licenceIssuingAuthorty;
	            zhengJiaYouXiaoQi=result.papersValidity;
	            jiYe=result.profession;
	            wenHuaChengDu=result.educationDegreeID;
	            lvKeJiBie=result.passengerLevelID;
	            zhengJianLeiXing=result.papersID;
	            zhengJianHaoMa=result.papersNumber;
	            danWeiHuoZhuChu=result.unitsOrAddress;
	            chuShengRiQi=result.birthDate;
	            shiYou=result.thingReasonID;
	            congHeChuLai=result.whereAreFrom;
	            daoNaLiQu=result.whereToGo;
	            lianXiDianHua=result.contactPhoneNumber;
	            beiZhu=result.remarks;
	            
	            if(result.name!=""){
	              document.getElementById("nameId").style.color='blue';
	            }else{
	             document.getElementById("nameId").style.color='black';
	            }
	            if(result.licenceIssuingAuthorty!=""){
	              document.getElementById("faZhengId").style.color='blue';
	            }else{
	             document.getElementById("faZhengId").style.color='black';
	            }
	            if(result.profession!=""){
	              document.getElementById("professionId").style.color='blue';
	            }else{
	              document.getElementById("professionId").style.color='black';
	            }
	            if(result.papersValidity!=""){
	              document.getElementById("papersValidityId").style.color='blue';
	            }else{
	              document.getElementById("papersValidityId").style.color='black';
	            }
	            if(result.papersNumber!=""){
	              document.getElementById("papersNumberId").style.color='blue';
	            }else{
	              document.getElementById("papersNumberId").style.color='black';
	            }
	            if(result.unitsOrAddress!=""){
	              document.getElementById("unitsOrAddressId").style.color='blue';
	            }else{
	              document.getElementById("unitsOrAddressId").style.color='black';
	            }
	            if(result.birthDate!=""){
	              document.getElementById("birthDateId").style.color='blue';
	            }else{
	              document.getElementById("birthDateId").style.color='black';
	            }
	            if(result.whereAreFrom!=""){
	              document.getElementById("whereAreFromId").style.color='blue';
	            }else{
	              document.getElementById("whereAreFromId").style.color='black';
	            }
	            if(result.whereToGo!=""){
	              document.getElementById("whereToGoId").style.color='blue';
	            }else{
	              document.getElementById("whereToGoId").style.color='black';
	            }
	            if(result.contactPhoneNumber!=""){
	              document.getElementById("contactPhoneNUmberId").style.color='blue';
	            }else{
	              document.getElementById("contactPhoneNUmberId").style.color='black';
	            }
	            if(result.remarks!=""){
	              document.getElementById("remarksId").style.color='blue';
	            }else{
	              document.getElementById("remarksId").style.color='black';
	            }
	            
	          },
	          error: function(data) {
	           }
	         });		 
		}
	}else{
	  alert("你还没有选择旅客哦！");
	}
   }
   
   function nameOne(value){
     if(value!=xingMing){
       document.getElementById("nameId").style.color='black';
     }else{
       document.getElementById("nameId").style.color='blue';
     }
   }
   
   function licenceIssuingAuthortyOne(value){
     if(value!=faZhengJiGuang){
       document.getElementById("faZhengId").style.color='black';
     }else{
       document.getElementById("faZhengId").style.color='blue';
     }
   }
   
   function papersValidityOne(value){
     if(value!=zhengJiaYouXiaoQi){
       document.getElementById("papersValidityId").style.color='black';
     }else{
       document.getElementById("papersValidityId").style.color='blue';
     }
   }
   
   function professionOne(value){
     if(value!=jiYe){
       document.getElementById("professionId").style.color='black';
     }else{
       document.getElementById("professionId").style.color='blue';
     }
   }
   
   function papersNumberOne(value){
     if(value!=zhengJianHaoMa){
       document.getElementById("papersNumberId").style.color='black';
     }else{
       document.getElementById("papersNumberId").style.color='blue';
     }
      if(value!=""){
       $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/Passenger/YZ.do',       //地址 type 带参数
          data:"papersNumber="+value,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
          async:false,                                          // 是否 异步 提交
          success: function (result) {                          // 不出现异常 进行立面方
              if(Name==document.getElementById("papersNumberId").value){
              
              }else if(result>=1){                                  
                   alert("此身份证已登记过了，你还可以选择旅客哦！");                     //提示框
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
          error: function(data) { }
      });
     }
   }
   
   function unitsOrAddressOne(value){
     if(value!=danWeiHuoZhuChu){
       document.getElementById("unitsOrAddressId").style.color='black';
     }else{
       document.getElementById("unitsOrAddressId").style.color='blue';
     }
   }
   
   function birthDateOne(value){
     if(value!=chuShengRiQi){
       document.getElementById("birthDateId").style.color='black';
     }else{
       document.getElementById("birthDateId").style.color='blue';
     }
   }
   
   function whereAreFromOne(value){
     if(value!=congHeChuLai){
       document.getElementById("whereAreFromId").style.color='black';
     }else{
       document.getElementById("whereAreFromId").style.color='blue';
     }
   }
   
   function whereToGoOne(value){
     if(value!=daoNaLiQu){
       document.getElementById("whereToGoId").style.color='black';
     }else{
       document.getElementById("whereToGoId").style.color='blue';
     }
   }
            
   function contactPhoneNUmberOne(value){
     if(value!=lianXiDianHua){
       document.getElementById("contactPhoneNUmberId").style.color='black';
     }else{
       document.getElementById("contactPhoneNUmberId").style.color='blue';
     }
   }
   
   function remarksOne(value){
     if(value!=beiZhu){
       document.getElementById("remarksId").style.color='black';
     }else{
       document.getElementById("remarksId").style.color='blue';
     }
   }
   
   
    function gender(value){
     if(value!=xingBie){
       document.getElementById("genderId").style.color='black';
     }else{
       document.getElementById("genderId").style.color='blue';
     }
   }
   
    function nation(value){
     if(value!=minZu){
       document.getElementById("nationId").style.color='black';
     }else{
       document.getElementById("nationId").style.color='blue';
     }
   }
   
    function educationDegree(value){
     if(value!=wenHuaChengDu){
       document.getElementById("educationDegreeId").style.color='black';
     }else{
       document.getElementById("educationDegreeId").style.color='blue';
     }
   }
   
    function papers(value){
     if(value!=zhengJianLeiXing){
       document.getElementById("papersId").style.color='black';
     }else{
       document.getElementById("papersId").style.color='blue';
     }
   }
   
    function passengerLevel(value){
     if(value!=lvKeJiBie){
       document.getElementById("passengerLevelId").style.color='black';
     }else{
       document.getElementById("passengerLevelId").style.color='blue';
     }
   }
   
    function thingReason(value){
     if(value!=shiYou){
       document.getElementById("thingReasonId").style.color='black';
     }else{
       document.getElementById("thingReasonId").style.color='blue';
     }
   }
   
   
   function tijiao(){
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
        }else if(document.getElementById("faZhengId").value.length>25){
	     alert("你输入的   发证机关  太过长了  请不要超出  25  位长度");
	     document.getElementById("faZhengId").focus();
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
        }else if(document.getElementById("remarksId").value.length>50){
	     alert("你输入的   备注  太过长了  请不要超出  50 位长度");
	     document.getElementById("remarksId").focus();
	     return false;
        }
      var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
      form1.action="${ctx}/StayRegister/register.do?LvKeLeiXingId="+LvKeLeiXingId;
      form1.submit();
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
     if(document.getElementById("contactPhoneNUmberId").value!=""){
        if(!document.getElementById("contactPhoneNUmberId").value.trim().match("^[1][0-9]{10}$"))
	       {
	          document.getElementById("contactPhoneNUmberId").focus();
	          document.getElementById("contactPhoneNUmberId").value="";
	          alert("你输入的手机号码有误，请重新输入！");
	       }
     }
   }
   
   
  
   

 </script>
   
  </body>
</html>
