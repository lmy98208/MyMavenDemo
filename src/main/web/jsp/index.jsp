<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2019/7/6
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>index</title>
    <link rel="stylesheet" href="<%=basePath%>static/plugin/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">@layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">招聘平台信息系统</a></li>
        </ul>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">

                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/user/userInfoTable.jsp"
                            mytitle="用户信息"><a>用户信息</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">公司管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/corp/infotable.jsp"
                            mytitle="公司信息"><a>公司信息</a></dd>
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/corp/infopic.html"
                            mytitle="公司信息可视化"><a>公司信息可视化</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">职位分类管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/jobClassify/infotable.jsp"
                            mytitle="职位分类信息"><a>职位分类信息</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">职位管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/job/myinfotable.jsp"
                            mytitle="职位信息"><a>职位信息</a></dd>
                        <%--<dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/jobClassify/infopic.jsp"--%>
                        <%--mytitle="职位分类信息可视化"><a>职位分类信息可视化</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">首页管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/home/infotable.jsp"
                            mytitle="首页信息"><a>首页信息</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">公告管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/ann/infotable.jsp"
                            mytitle="公告信息"><a>公告信息</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">广告管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/adv/infotable.jsp"
                            mytitle="广告信息"><a>广告信息</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">评论管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-nav-item leftdaohang" data-url="<%=basePath%>jsp/comment/comment.jsp"
                            mytitle="评论信息"><a>评论信息</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <!--tabs标签-->
        <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title"></ul>
            <div class="layui-tab-content" style="height: 600px;">

            </div>
        </div> 
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="<%=basePath%>static/plugin/layui/layui.all.js"></script>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                var htmlurl=$(this).attr('data-url');
                var mytitle=$(this).attr('mytitle');
                //先判断是否已经有了tab
                var arrayObj = new Array();　//创建一个数组  
                $(".layui-tab-title").find('li').each(function() {
                    var y = $(this).attr("lay-id");
                    arrayObj.push(y);
                });
//                    alert("遍历取到的数组："+arrayObj);
                var have=$.inArray(mytitle, arrayObj);  //返回 3,
                if (have>=0) {
                    //tab已有标签
//                        alert("遍历的已有标签："+mytitle);
                    element.tabChange('demo', mytitle); //切换到当前点击的页面
                } else{
                    //没有相同tab
//                      alert("遍历的没有相同tab："+mytitle);
                    element.tabAdd('demo', {
                        title:mytitle //用于演示
                        ,content: '<iframe style="width: 100%;height: 600px;" scrolling="no" src='+htmlurl+' ></iframe>'
                        ,id: mytitle //实际使用一般是规定好的id，这里以时间戳模拟下
                    })
                    element.tabChange('demo', mytitle); //切换到当前点击的页面
                }
            }

        };
        $(".leftdaohang").click(function(){
            var type="tabAdd";
            var othis = $(this);
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</body>
</html>
