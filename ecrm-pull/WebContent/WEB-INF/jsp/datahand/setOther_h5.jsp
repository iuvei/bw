<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>修改定时任务器</title>
	<link rel="stylesheet"  href="${ctx }/jquerymobile/jquery.mobile-1.3.2.min.css">
	<link rel="stylesheet" href="${ctx }/jquerymobile/jqm-demos.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<script src="${ctx }/jquerymobile/jquery.js"></script>
	<script src="${ctx }/jquerymobile/index.js"></script>
	<script src="${ctx }/jquerymobile/jquery.mobile-1.3.2.min.js"></script>
	
</head>
	
<body >


<div data-role="page" id="page1">
<div data-role="header" style="overflow:hidden;">
    <h1>修改定时任务器</h1>
    <h3>AG和OG不支持更新</h3>
    <p><font color="red">${messages }</font></p>
    <!-- <div data-role="navbar">
        <ul>
            <li><a href="#">One</a></li>
            <li><a href="#">Two</a></li>
            <li><a href="#">Three</a></li>
        </ul>
    </div> --><!-- /navbar -->
</div><!-- /header -->

<div data-role="content">
	
	<input type="hidden" name="handlecode" id="handlecode" value="${handlecode }"/>
	<textarea cols="40" rows="10" name="updatetime" id="updatetime" placeholder="请根据具体任务的时间格式进行编辑" ></textarea>
	
	<p></p><p></p><p></p><p></p>
	<input type="button" value="保存定时器" data-theme="b" onclick="dosubmit()" maxlength="12" required="required">
	<br /><br /><br /><br /><br /><br /><br />
	
	
	<div data-role="popup" id="confirm" data-position-to="window" data-inline="true" data-transition="pop" data-overlay-theme="a" >
		<div data-role="header" data-theme="a">
			<h1>提醒</h1>
		</div>
		<div data-role="content">
			<h1>是否确认操作？</h1>
			<p>请确保输入的时间格式符合对应采集任务的时间格式，否则会出现错误</p>
			<a href="javascript:dosubmit2();" data-role="button" data-theme="b">确认</a>       
			<a href="javascript:;" data-role="button" data-rel="back" data-theme="c">取消</a>    
		</div>
	</div>	
	<div data-role="popup" id="alert" data-inline="true" data-transition="pop" data-overlay-theme="b" data-position-to="#updatetime">
		<p>请输入完整的格式。</p>
	</div>	
	<div data-role="popup" id="result" data-inline="true" data-transition="pop" data-overlay-theme="b" data-position-to="window">
		操作结果
	</div>

</div><!--/content -->

<div data-role="footer" style="overflow:hidden;" data-position="fixed">
    <div data-role="navbar">
        <ul>
            <li><a href="${ctx }/datahand/listTask.do" data-ajax="false">定时任务</a></li>
            <li><a href="${ctx }/datahand/list.do" data-ajax="false">平台维护情况</a></li>
            <li><a href="${ctx }/datahand/listTag.do" data-ajax="false">AG定时任务</a></li>
            <li><a href="${ctx }/datahand/gosetTag.do" data-ajax="false">AG批量修改</a></li>
        </ul>
    </div><!-- /navbar -->
    <h4 style="text-align:center;">监控管理窗口</h4>
</div><!-- /footer -->
</div>




    	
</body>

<script language="JavaScript"> 

function dosubmit() {
	
	if($("#updatetime").val() == "" ) {
		$("#alert").popup("open");
		return ;
	}
	$("#confirm").popup("open");
}

function dosubmit2() {
	$("#confirm").popup("close");
	$.ajax({
		url: "${ctx}/datahand/setOther.do",
		type:"post",
		data:{"updatetime": $("#updatetime").val() , "handlecode":$("#handlecode").val() },
		dataType:"json",
		success:function(data){
			//alert(data.msg);
			
			$("#result").text(data.msg);
			$("#result").popup("open");
		}
	});
}

</script> 

</html>
