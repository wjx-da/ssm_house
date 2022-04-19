var priceRange_manage_tool = null; 
$(function () { 
	initPriceRangeManageTool(); //建立PriceRange管理对象
	priceRange_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#priceRange_manage").datagrid({
		url : 'Rent/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "id",
		sortOrder : "desc",
		toolbar : "#priceRange_manage_tool",
		columns : [[
			{
				field : "hourseObj",
				title : "房屋id",
				width : 70,
			},
			{
				field : "hourseName",
				title : "房屋名称",
				width : 140,
			},
			{
				field : "userInfoObj",
				title : "租户",
				width : 140,
			},
			{
				field : "starttime",
				title : "开始时间",
				width : 140,
			},
			{
				field : "endtime",
				title : "结束时间",
				width : 140,
			},
			{
				field : "rentprice",
				title : "租金",
				width : 140,
			},
			{
				field : "nowtime",
				title : "合同签署时间",
				width : 140,
			}
		]],
	});

	$("#priceRangeEditDiv").dialog({
		title : "修改管理",
		top: "50px",
		width : 700,
		height : 515,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#priceRangeEditForm").form("validate")) {
					//验证表单 
					if(!$("#priceRangeEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#priceRangeEditForm").form({
						    url:"PriceRange/" + $("#priceRange_rangeId_edit").val() + "/update",
						    onSubmit: function(){
								if($("#priceRangeEditForm").form("validate"))  {
				                	$.messager.progress({
										text : "正在提交数据中...",
									});
				                	return true;
				                } else { 
				                    return false; 
				                }
						    },
						    success:function(data){
						    	$.messager.progress("close");
						    	console.log(data);
			                	var obj = jQuery.parseJSON(data);
			                    if(obj.success){
			                        $.messager.alert("消息","信息修改成功！");
			                        $("#priceRangeEditDiv").dialog("close");
			                        priceRange_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#priceRangeEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#priceRangeEditDiv").dialog("close");
				$("#priceRangeEditForm").form("reset"); 
			},
		}],
	});
});

function initPriceRangeManageTool() {
	priceRange_manage_tool = {
		init: function() {
		},
		reload : function () {
			$("#priceRange_manage").datagrid("reload");
		},
		redo : function () {
			$("#priceRange_manage").datagrid("unselectAll");
		},
		search: function() {
			$("#priceRange_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#priceRangeQueryForm").form({
			    url:"Rent/OutToExcel",
			});
			//提交表单
			$("#priceRangeQueryForm").submit();
		},
		remove : function () {
			var rows = $("#priceRange_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						$.ajax({
							type : "POST",
							url : "Rent/deletes",
							data : {
								hourseId:	rows[0].hourseObj,
							},
							beforeSend : function () {
								$("#priceRange_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#priceRange_manage").datagrid("loaded");
									$("#priceRange_manage").datagrid("load");
									$("#priceRange_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#priceRange_manage").datagrid("loaded");
									$("#priceRange_manage").datagrid("load");
									$("#priceRange_manage").datagrid("unselectAll");
									$.messager.alert("消息",data.message);
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		contract : function () {
			var rows = $("#priceRange_manage").datagrid("getSelections");
			if (rows.length > 0) {
				alert(rows[0].hourseObj);
				$.messager.confirm("确定操作", "您确定要查看出租的合同吗？", function (flag) {
					if (flag) {
						top.location.href="Rent/Check?hourseId="+rows[0].hourseObj;
					}
				});
			} else {
				$.messager.alert("提示", "请选择要查看出租的合同！", "info");
			}
		},
	};
}
