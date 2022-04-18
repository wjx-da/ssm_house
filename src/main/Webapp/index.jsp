<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <title>房屋租赁系统首页</title>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
</head>
<body>
<div class="container" >
<jsp:include page="header.jsp"></jsp:include>
 <!-- 广告轮播开始 -->
  <section id="main_ad" class="carousel slide" data-ride="carousel">
    <!-- 下面的小点点，活动指示器 -->
    <ol class="carousel-indicators">
      <li data-target="#main_ad" data-slide-to="0" class="active"></li>
      <li data-target="#main_ad" data-slide-to="1"></li>
      <li data-target="#main_ad" data-slide-to="2"></li>
      <li data-target="#main_ad" data-slide-to="3"></li>
    </ol>
    <!-- 轮播项 -->
    <div class="carousel-inner" role="listbox">  
      <div class="item active" data-image-lg="<%=basePath %>images/slider/A-A.jpg" data-image-xs="<%=basePath %>images/slider/slide_01_640x340.jpg"></div>
      <div class="item" data-image-lg="<%=basePath %>images/slider/A-B.jpg" data-image-xs="<%=basePath %>images/slider/A-B.jpg"></div>
      <div class="item" data-image-lg="<%=basePath %>images/slider/A-C.jpg" data-image-xs="<%=basePath %>images/slider/A-C.jpg"></div>
      <div class="item" data-image-lg="<%=basePath %>images/slider/A-E.jpg" data-image-xs="<%=basePath %>images/slider/A-E.jpg"></div>
    </div> 
    <!-- 控制按钮 -->
    <a class="left carousel-control" href="#main_ad" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">上一页</span>
    </a>
    <a class="right carousel-control" href="#main_ad" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">下一页</span>
    </a>
  </section>
  <!-- /广告轮播结束 -->
  

<!-- 特色介绍开始 -->
  <section id="tese">
    <div class="container">
      <div class="row">
        <div class="col-xs-6 col-md-4">
          <a href="#">
            <div class="media">
              <div class="media-left">
                <i class="icon-uniE907"></i>
              </div>
              <div class="media-body">
                <h4 class="media-heading">舒适温馨</h4>
                <p>属于你的家</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
          <a href="#">
            <div class="media">
              <div class="media-left">
                <i class="icon-uniE907"></i>
              </div>
              <div class="media-body">
                <h4 class="media-heading">优质精选</h4>
                <p>海量优质好房等你</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
          <a href="#">
            <div class="media">
              <div class="media-left">
                <i class="icon-uniE907"></i>
              </div>
              <div class="media-body">
                <h4 class="media-heading">便宜舒适</h4>
                <p>为每一位租客服务</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
          <a href="#">
            <div class="media">
              <div class="media-left">
                <i class="icon-uniE907"></i>
              </div>
              <div class="media-body">
                <h4 class="media-heading">交通便利</h4>
                <p>上下班不再有阻挠</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
          <a href="#">
            <div class="media">
              <div class="media-left">
                <i class="icon-uniE907"></i>
              </div>
              <div class="media-body">
                <h4 class="media-heading">装修精良</h4>
                <p>为您身心舒畅</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-xs-6 col-md-4">
          <a href="#">
            <div class="media">
              <div class="media-left">
                <i class="icon-uniE907"></i>
              </div>
              <div class="media-body">
                <h4 class="media-heading">家具齐全</h4>
                <p>打包即能入住</p>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </section>
  <!-- /特色介绍 结束-->

<jsp:include page="footer.jsp"></jsp:include>

</div>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>js/index.js"></script>
</body>
</html>
