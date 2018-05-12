
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <script type="text/javascript" src="${ctx}/js/echarts/echarts.min.js"></script>
  </head>
<style>
  
</style>
 <body>
  
  <div id="main" style="width: 95%;height:82%;"></div>
  
  
  <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '收益金额折线图'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:['散客','团队']
            },
            toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
            xAxis: {
                type : 'category',
          	    boundaryGap : false,
                data: ['${year12}','${year11}','${year10}','${year9}','${year8}','${year7}',
                       '${year6}','${year5}','${year4}','${year3}','${year2}','${year1}']
            },
            yAxis:[{
	            type : 'value'
	        }] ,
            series: [
            {
	            name:'散客',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${sZongFeiYong12}, ${sZongFeiYong11}, ${sZongFeiYong10}, ${sZongFeiYong9}, 
	                  ${sZongFeiYong8}, ${sZongFeiYong7}, ${sZongFeiYong6}, ${sZongFeiYong5},
	                  ${sZongFeiYong4}, ${sZongFeiYong3}, ${sZongFeiYong2}, ${sZongFeiYong1}]
	        },
	        {
	            name:'团队',
	            type:'line',
	            stack: '总量',
	            label: {
                normal: {
	                    show: true,
	                    position: 'top'
	                }
	            },
	            areaStyle: {normal: {}},
	            data:[ ${tZongFeiYong12}, ${tZongFeiYong11}, ${tZongFeiYong10}, ${tZongFeiYong9}, 
	                   ${tZongFeiYong8}, ${tZongFeiYong7}, ${tZongFeiYong6}, ${tZongFeiYong5},
	                   ${tZongFeiYong4}, ${tZongFeiYong3}, ${tZongFeiYong2}, ${tZongFeiYong1}]
	        }
	        ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
 </body>
</html>
