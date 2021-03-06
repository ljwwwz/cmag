<%
	response.setStatus(403);
	//获取异常类
	Throwable ex = Exceptions.getThrowable(request);
	// 如果是异步请求或是手机端，则直接返回信息
	if (Servlets.isAjaxRequest(request)) {
		if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
			out.print(StringUtils.replace(ex.getMessage(), "msg:", ""));
		}else{
			out.print("您的操作权限不足，请您与管理员联系！");
		}
	}else {//输出异常信息页面
%>
<%@page import="com.coolshow.frm.jeesite.common.web.Servlets"%>
<%@page import="com.coolshow.frm.jeesite.common.utils.Exceptions"%>
<%@page import="com.coolshow.frm.jeesite.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>403 - 操作权限不足</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>操作权限不足.</h1></div>
		<%
			if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
				out.print("<div>"+StringUtils.replace(ex.getMessage(), "msg:", "")+" <br/> <br/></div>");
			}
		%>
		<div><a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a></div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>
<%
	} out = pageContext.pushBody();
%>