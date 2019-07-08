<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2019/7/6
  Time: 9:02
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
    <title>公司信息可视化</title>
    <link rel="stylesheet" href="<%=basePath%>static/plugin/layui/css/layui.css">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=gCGOXNZjGKeWRv3a6y7jIMfZosgrMdFq"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
</head>
<body>
    <div id="container"></div>
    <div id="r-result">
        <input type="button"  onclick="openHeatmap();" value="显示热力图"/><input type="button"  onclick="closeHeatmap();" value="关闭热力图"/>
    </div>
    <script>
        var points = [
            {"count":"22","lat":31.239756844260476,"lng":121.52442620017312},
            {"count":"21","lat":31.164539064679825,"lng":121.11865997314453},
            {"count":"171","lat":31.224994079411378,"lng":121.42311934978642},
            {"count":"106","lat":31.214110266487552,"lng":121.4750428829553},
            {"count":"30","lat":31.196668116251626,"lng":121.44845072428386},
            {"count":"23","lat":31.20098694511082,"lng":121.44674549932066},
            {"count":"27","lat":31.218530301694518,"lng":121.41113055193865},
            {"count":"63","lat":31.3215939355275,"lng":121.39285048227461},
            {"count":"92","lat":31.199304974597432,"lng":121.44609691785729},
            {"count":"29","lat":31.241107151426117,"lng":121.5120376060749},
            {"count":"19","lat":31.230695824874076,"lng":121.4991599635074},
            {"count":"28","lat":31.279854433877126,"lng":121.46756962367466},
            {"count":"76","lat":31.234056522971706,"lng":121.48667496129086},
            {"count":"69","lat":31.21312962407651,"lng":121.41374969482422},
            {"count":"23","lat":31.308742440265156,"lng":121.52185257621433},
            {"count":"25","lat":31.234710998535157,"lng":121.40862884521485},
            {"count":"24","lat":31.209338506062824,"lng":121.39758777618408},
            {"count":"56","lat":31.23933666093009,"lng":121.48483371734619},
            {"count":"59","lat":31.229821479926674,"lng":121.48867177155059},
            {"count":"18","lat":31.226101027594673,"lng":121.44797473483615},
            {"count":"22","lat":31.205617037686434,"lng":121.56094256314364},
            {"count":"29","lat":31.214250893428407,"lng":121.5269309734476},
            {"count":"28","lat":31.230042116982595,"lng":121.45067432948521},
            {"count":"69","lat":31.23625810595526,"lng":121.46887505572775},
            {"count":"44","lat":31.137581261721525,"lng":121.40708125721325}
        ];
        var map = new BMap.Map("container");          // 创建地图实例

        var point = new BMap.Point(121.474791,31.223083);
        map.centerAndZoom(point, 11);             // 初始化地图，设置中心点坐标和地图级别
        map.enableScrollWheelZoom(); // 允许滚轮缩放

        if(!isSupportCanvas()){
            alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
        }
        heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});
        map.addOverlay(heatmapOverlay);
        heatmapOverlay.setDataSet({data:points,max:230});
        //是否显示热力图
        function openHeatmap(){
            heatmapOverlay.show();
        }
        function closeHeatmap(){
            heatmapOverlay.hide();
        }
        closeHeatmap();
        function setGradient(){
            var gradient = {};
            var colors = document.querySelectorAll("input[type='color']");
            colors = [].slice.call(colors,0);
            colors.forEach(function(ele){
                gradient[ele.getAttribute("data-key")] = ele.value;
            });
            heatmapOverlay.setOptions({"gradient":gradient});
        }
        //判断浏览区是否支持canvas
        function isSupportCanvas(){
            var elem = document.createElement('canvas');
            return !!(elem.getContext && elem.getContext('2d'));
        }
    </script>
</body>
</html>
