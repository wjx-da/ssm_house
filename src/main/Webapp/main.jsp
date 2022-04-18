<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="check_logstate.jsp"/>
 
<!DOCTYPE html>
<html>
<head>
<title>房屋租赁系统管理系统</title>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/admin.css" />
	<link rel="stylesheet" href="css/style1.css">
</head>
<body class="easyui-layout">

<div data-options="region:'north',title:'header',split:true,noheader:true" style="height:60px;background : url(images/background/t.gif)">
	<div class="logo">房屋租赁系统后台管理</div>
	<div class="logout">您好，尊敬的<%=session.getAttribute("username")%> 管理员| <a href="logout">退出</a></div>
</div>   
<div data-options="region:'south',title:'footer',split:true,noheader:true" style="height:35px;line-height:30px;text-align:center;">
	@wjx
</div>    
<div data-options="region:'west',title:'导航',split:true,iconCls:'icon-world'" style="width:200px;padding:10px; background: url(images/background/R-A.gif)">
	<ul id="nav"></ul>
</div>   
<div data-options="region:'center'" style="overflow:hidden">
	<div id="tabs">
		<div title="起始页" iconCls="icon-house" style="padding:0 10px;display:block;font-size:70px">
			<canvas  id="canvas"></canvas>
			<h1>欢迎来到后台管理系统！</h1>
		</div>
	</div>
</div> 


<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js" ></script>
<script type="text/javascript" src="js/admin.js"></script>
<script src="js/script.js"></script>
</body>
</html>
