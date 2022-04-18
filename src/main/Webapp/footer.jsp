<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            	<a target=_blank>© wjx from 2022</a> |
				<a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=%E7%A7%9F%E6%88%BF%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A1%B9&fenlei=256&rsv_pq=98212bbd000103e4&rsv_t=579avMYSOZyIss3QeDB8aszooscPcLIJdrkpDm%2F3CssMOTWFAFUEWTHK3Gk&rqlang=cn&rsv_enter=1&rsv_dl=ib&rsv_sug3=2&rsv_sug1=1&rsv_sug7=001&rsv_n=2">租房注意事项</a> |
				<a href="<%=basePath%>login.jsp">后台登录</a>
            </div>
        </div>
    </div>
</footer>
<!--footer--> 

 


 