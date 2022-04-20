<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/priceRange.css" /> 

<div id="Rent_manage"></div>
<div id="Rent_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="Rent_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="Rent_manage_tool.contract();">查看合同</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="Rent_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="Rent_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="Rent_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="priceRangeQueryForm" method="post">
		</form>	
	</div>
</div>

<div id="priceRangeEditDiv">
	<form id="priceRangeEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">房屋id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="Rent_hourseObj_edit" name="Rent.hourseObj" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">用户名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="Rent_userInfoObj_edit" name="Rent.userInfoObj" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">开始租房时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="Rent_starttime_edit" name="Rent.starttime" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">结束租房时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="Rent_endtime_edit" name="Rent.endtime" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">租金:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="Rent_rentprice_edit" name="Rent.rentprice" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">合同签订时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="Rent_nowtime_edit" name="Rent.nowtime" style="width:200px" />

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/Rent/house/js/Rent_manage.js"></script>
