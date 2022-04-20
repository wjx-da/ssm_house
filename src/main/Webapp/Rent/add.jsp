<%@ page import="com.wanjiaxin.po.WantHourseInfo" %>
<%@ page import="com.wanjiaxin.po.Hourse" %>
<%@ page import="com.wanjiaxin.po.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    WantHourseInfo wantHourseInfo = (WantHourseInfo) request.getAttribute("wantHourseInfo");
    UserInfo userInfo = (UserInfo) request.getAttribute("user_rent");
%>
<html>
<head>
    <title>添加合同信息：</title>
    <link rel="stylesheet" type="text/css" href="house/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="house/css/main.css"/>
    <script type="text/javascript" src="house/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="house/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="house/js/jquery-ui-datepicker.js"></script>
    <script type="text/javascript" src="house/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="house/css/jquery-ui.css"/>
    <style>
        .smart-green {
            margin-left: auto;
            margin-right: auto;
            max-width: 500px;
            background: #F8F8F8;
            padding: 30px 30px 20px 30px;
            font: 12px Arial, Helvetica, sans-serif;
            color: #666;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
        }

        .smart-green h1 {
            font: 24px "Trebuchet MS", Arial, Helvetica, sans-serif;
            padding: 20px 0px 20px 40px;
            display: block;
            margin: -30px -30px 10px -30px;
            color: #FFF;
            background: #9DC45F;
            text-shadow: 1px 1px 1px #949494;
            border-radius: 5px 5px 0px 0px;
            -webkit-border-radius: 5px 5px 0px 0px;
            -moz-border-radius: 5px 5px 0px 0px;
            border-bottom: 1px solid #89AF4C;
        }

        .smart-green h1 > span {
            display: block;
            font-size: 11px;
            color: #FFF;
        }

        .smart-green label {
            display: block;
            margin: 0px 0px 5px;
        }

        .smart-green label > span {
            float: left;
            margin-top: 10px;
            color: #5E5E5E;
        }

        .smart-green input[type="text"], .smart-green input[type="email"], .smart-green textarea, .smart-green select {
            color: #555;
            height: 30px;
            line-height: 15px;
            width: 100%;
            padding: 0px 0px 0px 10px;
            margin-top: 2px;
            border: 1px solid #E5E5E5;
            background: #FBFBFB;
            outline: 0;
            -webkit-box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
            box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
            font: normal 14px/14px Arial, Helvetica, sans-serif;
        }

        .smart-green textarea {
            height: 100px;
            padding-top: 10px;
        }


        .smart-green .button {
            background-color: #9DC45F;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-border-radius: 5px;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            text-shadow: 1px 1px 1px #949494;
        }

        .smart-green .button:hover {
            background-color: #80A24A;
        }

    </style>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/background.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/user/My97DatePicker/WdatePicker.js"></script>
<div style="width: 980px; margin: -190px 0 0 -540px; top: 50%; left: 50%; position: absolute; z-index: 10">
<form action="/Rent/addRent" method="post"   class="smart-green" >
<input type="text" id="wantHourseInfo" name="wantHourseInfoId" class="error" value="<%=wantHourseInfo.getWantHourseId()%>" readonly></br>
<input type="text" id="hourse" name="hourseId" class="form-control"value="<%=wantHourseInfo.getHourseId()%>" readonly></br>
<input type="text" id="userInfo" name="userName" class="form-control" value="<%=userInfo.getUser_name()%>" readonly></br>
<input type="text" id="starttime" name="starttime" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请输入开始出租时间"></br>

<input type="text" id="endtime" name="endtime" class="form-control"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请输入租期结束时间"></br>
<input type="text" id="rentprice" name="rentprice" class="form-control" placeholder="请输入租价"></br>
    <button type="submit"  class="button"   value="提交合同信息"> 提交合同信息</button>
    <input  onclick="history.go(-1)" value="返回"  style="margin-left:250px;" class="button"  type="button">
</form>

</div>
</body>
</html>
