<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newsInfo.css" /> 

<div id="newsInfo_manage"></div>
<div id="newsInfo_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="newsInfo_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="newsInfo_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="newsInfo_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="newsInfo_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="newsInfo_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="newsInfoQueryForm" method="post">
			标题：<input type="text" class="textbox" id="newsTitle" name="newsTitle" style="width:110px" />
			发布日期：<input type="text" id="newsDate" name="newsDate" class="easyui-datebox" editable="false" style="width:100px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="newsInfo_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="newsInfoEditDiv">
	<form id="newsInfoEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">记录编号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="newsInfo_newsId_edit" name="newsInfo.newsId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">标题:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="newsInfo_newsTitle_edit" name="newsInfo.newsTitle" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">新闻内容:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="newsInfo_newsContent_edit" name="newsInfo.newsContent" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">发布日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="newsInfo_newsDate_edit" name="newsInfo.newsDate" />

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="NewsInfo/js/newsInfo_manage.js"></script> 
