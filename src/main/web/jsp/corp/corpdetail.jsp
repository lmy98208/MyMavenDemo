<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2019/7/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>static/plugin/layui/css/layui.css">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=gCGOXNZjGKeWRv3a6y7jIMfZosgrMdFq"></script>
</head>
<body>
    <%--顶部--%>
    <div style="flex-direction: row;display:flex;background-color: #2F4056;
    padding: 15px 25%;justify-content: space-between">
        <div style="flex-direction: column;display:flex;">
            <div id="corpname" style="color: white;font-size: 35px;margin-bottom: 5px"></div>
            <div id="scale" style="color: #9F9F9F;margin-bottom: 5px"></div>
            <button class="layui-btn-sm layui-btn-radius layui-btn layui-btn-danger" id="tags"></button>
        </div>
        <div style="color: white;vertical-align: middle;flex-direction: column;display:flex">
            <div id="jobsCnt" style="font-size: 35px;margin-top: 15px"></div>
            <div>在招职位</div>
        </div>
    </div>
    <%--主体--%>
    <div style="padding: 15px 25%">
        <blockquote class="layui-elem-quote" style="font-weight: bolder;font-size: larger">公司简介</blockquote>
        <div class="layui-card" style="border:2px solid #e2e2e2;">
            <div class="layui-card-body">
                <div id="intro"></div>
            </div>
        </div>
        <blockquote class="layui-elem-quote" style="font-weight: bolder;font-size: larger">工商信息</blockquote>
        <div class="layui-card" style="border:2px solid #e2e2e2;">
            <div class="layui-card-header" id="fullname"></div>
            <div class="layui-card-body">
                <div id="legalperson"></div>
                <div id="scope"></div>
            </div>
        </div>
        <blockquote class="layui-elem-quote" style="font-weight: bolder;font-size: larger">公司地址</blockquote>
        <div style="border:2px solid #e2e2e2;">
            <div style="width:100%;height:250px;" id="map"></div>
            <div style="flex-direction: row;display:flex;padding: 8px 5px 0;">
                <div><i class="layui-icon layui-icon-location" style="font-size: 15px;color: #d2361f"></i></div>
                <div id="address" style="font-size: 15px;"></div>
            </div>
        </div>
        <div style="height: 50px"></div>
    </div>>


    <script src="<%=basePath%>static/plugin/layui/layui.js"></script>
    <script>
        //一般直接写在一个js文件中
        var map,lat,lng;
        var corpdetail;
        var thisURL = document.URL;
        var getval = thisURL.split('?')[1];
        var id = getval.split("=")[1];
        layui.use(['layer', 'form','jquery'], function(){
            var layer = layui.layer,
                form = layui.form,
                $=layui.jquery;
            $.ajax({
                url:'<%=basePath%>corp/findbyid?id='+id,
                type:'post',
                dataType:'JSON',
            success:function (obj) {
                corpdetail=obj;
                document.title=obj.corpName+"详细信息";
                // console.log("回调函数中");
                // console.log(corpdetail);
                setDocValue();
                initMap();
            },
            complete:function () {
                //layer.close(index);
            }
            })
        });

        function setDocValue() {
            document.getElementById('corpname').innerText=corpdetail.corpName;
            document.getElementById('scale').innerText=corpdetail.corpScale+"人以上";
            document.getElementById('tags').innerText=corpdetail.tag;
            document.getElementById('jobsCnt').innerText=20;
            document.getElementById('address').innerText=corpdetail.address;
            document.getElementById('intro').innerText=corpdetail.introduction;
            document.getElementById('fullname').innerText=corpdetail.fullCropName;
            document.getElementById('legalperson').innerText="法人："+corpdetail.legalPerson;
            document.getElementById('scope').innerText="经营范围："+corpdetail.bussinessScope;
        }
        function initMap(){
            createMap();//创建地图
            setMapEvent();//设置地图事件
            addMapControl();//向地图添加控件
            addMapOverlay();//向地图添加覆盖物
        }
        function createMap(){
            map = new BMap.Map("map");
            lng=corpdetail.addressLngLat.split(',')[0];
            lat=corpdetail.addressLngLat.split(',')[1]
            map.centerAndZoom(new BMap.Point(lng,lat),15);
        }
        function setMapEvent(){
            map.enableScrollWheelZoom();
            map.enableKeyboard();
            map.enableDragging();
            map.enableDoubleClickZoom()
        }
        function addClickHandler(target,window){
            target.addEventListener("click",function(){
                target.openInfoWindow(window);
            });
        }
        function addMapOverlay(){
            var markers = [
                {content:"我的备注",title:corpdetail.fullCropName,imageOffset: {width:-46,height:3},position:{lat:lat,lng:lng}}
            ];
            for(var index = 0; index < markers.length; index++ ){
                var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
                var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
                        imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
                    })});
                var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
                var opts = {
                    width: 200,
                    title: markers[index].title,
                    enableMessage: false
                };
                var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
                marker.setLabel(label);
                addClickHandler(marker,infoWindow);
                map.addOverlay(marker);
            };
        }
        //向地图添加控件
        function addMapControl(){
            var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
            scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
            map.addControl(scaleControl);
            var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
            map.addControl(navControl);
            var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
            map.addControl(overviewControl);
        }

    </script>
</body>
</html>
