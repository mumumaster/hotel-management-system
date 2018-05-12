<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<title>欢迎使用酒店管理系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<meta name="description" content="概述及统计" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${ctx}/assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ctx}/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!--page specific plugin styles-->

		<!--fonts-->

		<!--ace styles-->

		<link rel="stylesheet" href="${ctx}/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="${ctx}/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${ctx}/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles related to this page-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	

	</head>

	<body>
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							<i class="icon-leaf"></i>
							欢迎使用酒店管理系统
						</small>
					</a><!--/.brand-->

				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>




		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-small btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-small btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-small btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
					<li>
						<a id="dateViewId" onclick="" class="dropdown-toggle">
						<i class="icon-dashboard"></i>
							<span class="menu-text">数据视图 </span>
							<b class="arrow icon-angle-down"></b>
						</a>
						<ul class="submenu">
							<li>
								<a id="yingYeJinEId" onclick="dateView()">
									<i class="icon-double-angle-right"></i>
									<span>营业金额</span>
								</a>
							</li>


						</ul>
					</li>


					<li>
						<a id="roomManageId" onclick="roomManage()" class="dropdown-toggle">
							<i class="icon-home"></i>
							<span class="menu-text">房间管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a id="roomSetId" onclick="roomSet()">
									<i class="icon-double-angle-right"></i>
									<span>客房设置</span>
								</a>
							</li>

							<li>
								<a id="commoditySetId" onclick="commoditySet()">
									<i class="icon-double-angle-right"></i>
									<span>商品设置</span>
								</a>
							</li>

						</ul>
					</li>
					
					
					
					<li>
						<a id="stayManageId" onclick="stayManage()" class="dropdown-toggle">
							<i class="icon-move"></i>
							<span class="menu-text">住宿管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>

						<ul class="submenu">
							<li>
								<a id="reservationsId" onclick="reservations()">
									<i class="icon-double-angle-right"></i>
									<span>客房预订</span>
								</a>
							</li>

							<li>
								<a id="personageId" onclick="personage()">
									<i class="icon-double-angle-right"></i>
									<span>住宿登记</span>
								</a>
							</li>
							
							<!-- <li>
								<a id="groupId" onclick="group()">
									<i class="icon-double-angle-right"></i>
									<span>团队住宿登记 </span>
								</a>
							</li> -->

						</ul>
					</li>
					
					<li>
						<a id="financeManageId" onclick="financeManage()" class="dropdown-toggle">
							<i class="icon-heart"></i>
							<span class="menu-text">财务管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						
						<ul class="submenu">

							<li>
								<a id="financeStatisticsId" onclick="financeStatistics()">
									<i class="icon-double-angle-right"></i>
									<span>财务统计 </span>
								</a>
							</li>

						</ul>
						
					</li>
					
					<li>
						<a id="passengerManageId" onclick="passengerManage()" class="dropdown-toggle">
							<i class="icon-user"></i>
							<span class="menu-text">旅客管理 </span>

							<b class="arrow icon-angle-down"></b>
						</a>
						
						<ul class="submenu">

							<li>
								<a id="passengerInformationId" onclick="passengerInformation()" href="#">
									<i class="icon-double-angle-right"></i>
								<span>旅客信息 </span>	
								</a>
							</li>
							<li>
								<a id="receiveTargetId" onclick="receiveTarget()" href="#">
									<i class="icon-double-angle-right"></i>
								<span>接待对象 </span>	
								</a>
							</li>

						</ul>
						
					</li>

					
					
				</ul><!--/.nav-list-->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a id="bigGuide" href="#"></a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li id="smallGuide" class="active"></li>
					</ul><!--.breadcrumb-->
							
					</ul><!--.breadcrumb-->

				</div>

				<div style="width:100%;height:100%;">
				  <iframe id="Mainid" src="${ctx}/Main/todata.do" style="width:100%;height:100%;"  frameBorder="0" scrolling="no"></iframe>
				</div>

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-class="default" value="#438EB9" />#438EB9
									<option data-class="skin-1" value="#222A2D" />#222A2D
									<option data-class="skin-2" value="#C6487E" />#C6487E
									<option data-class="skin-3" value="#D0D0D0" />#D0D0D0
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header">固定头部</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar">固定侧栏</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">左右互换</label>
						</div>
					</div>
				</div><!--/#ace-settings-container-->
			</div><!--/.main-content-->
		</div><!--/.main-container-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
        
		<!--<![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.10.2.min.js"></script>

<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${ctx}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${ctx}/assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--[if lte IE 8]>
		  <script src="${ctx}/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="${ctx}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="${ctx}/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="${ctx}/assets/js/jquery.slimscroll.min.js"></script>
		<script src="${ctx}/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="${ctx}/assets/js/jquery.sparkline.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="${ctx}/assets/js/flot/jquery.flot.resize.min.js"></script>
		
        <script src="${ctx}/assets/js/ace-extra.min.js"></script>
		

		<!--ace scripts-->

		<script src="${ctx}/assets/js/ace-elements.min.js"></script>
		<script src="${ctx}/assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
			
				
			
			
			
			 
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
				 
			 }
			
			
				
				
				
				drawPieChart(placeholder, data);
				
				 /**
				 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
				 so that's not needed actually.
				 */
				 placeholder.data('chart', data);
				 placeholder.data('draw', drawPieChart);
			 
			
			
			  var $tooltip = $("<div class='tooltip top in hide'><div class='tooltip-inner'></div></div>").appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
				
			 });
			
			
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').slimScroll({
					height: '300px'
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
				
			
			})
			
			
			
			
			function dateView(){
			     var a=document.getElementById("dateViewId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("yingYeJinEId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/DateView/tolist.do';
			}
			
			function passengerManage(){
			    
			}
			
			function passengerInformation(){
			     var a=document.getElementById("passengerManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("passengerInformationId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/Passenger/tolist.do';
			}
			function receiveTarget(){
			     var a=document.getElementById("passengerManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("receiveTargetId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/ReceiveTarget/tolist.do';
			}
			
			function roomManage(){
			    
			}
			function roomSet(){
			     var a=document.getElementById("roomManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("roomSetId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/RoomSet/tolist.do';
			}
			function commoditySet(){
			     var a=document.getElementById("roomManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("commoditySetId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/Commodity/tolist.do';
			}
			
			
			function stayManage(){
			    
			}
			function reservations(){
			     var a=document.getElementById("stayManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("reservationsId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/Predetermine/tolist.do';
			}
			function personage(){
			     var a=document.getElementById("stayManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("personageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/StayRegister/tolist.do';
			}
			function group(){
			     var a=document.getElementById("stayManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("groupId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			}
			
			
			function financeManage(){
			    
			}
			function financeStatistics(){
			     var a=document.getElementById("financeManageId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("bigGuide").innerHTML=a+"";
			     var s=document.getElementById("financeStatisticsId").getElementsByTagName('span')[0].innerHTML;
			     document.getElementById("smallGuide").innerHTML=s+"";
			     document.getElementById('Mainid').src='${ctx}/FinancialStatistics/tolist.do';
			}
	
			
		</script>
	</body>
</html>
