<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2019/7/6
  Time: 21:02
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
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>static/plugin/layui/css/layui.css">
</head>
<body>
    <script type="text/html" id="toolbarDemo">
        <div class="demoTable">
            一级分类：
            <div class="layui-inline">
                <input class="layui-input" name="k1" id="demoReload" autocomplete="off">
            </div>
            二级分类：
            <div class="layui-inline">
                <input class="layui-input" name="k2" id="_demoReload" autocomplete="off">
            </div>
            <button class="layui-btn" data-type="reload" id="search">搜索</button>
            <div class="layui-btn-group" style="float: right">
                <button type="button" class="layui-btn layui-btn-sm" lay-event="addcorp">
                    <i class="layui-icon">&#xe654;</i>
                </button>
                <button type="button" class="layui-btn layui-btn-sm" lay-event="editcorp">
                    <i class="layui-icon">&#xe642;</i>
                </button>
                <button type="button" class="layui-btn layui-btn-sm" lay-event="delcorp">
                    <i class="layui-icon">&#xe640;</i>
                </button>
                <button type="button" class="layui-btn layui-btn-sm">
                    <i class="layui-icon">&#xe602;</i>
                </button>
            </div>
        </div>
    </script>

    <table id="jobClassify" lay-filter="jobclassify" class="layui-table"></table>
    <script src="<%=basePath%>static/plugin/layui/layui.js"></script>
    <script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'table','jquery'], function(){
        var layer = layui.layer,
            table=layui.table,
            $=layui.jquery;
        var rowsCnt=0;

        table.render({
            elem: '#jobClassify'
            ,height: 512
            ,url: '<%=basePath%>jobClassify/list' //数据接口
            ,page: true //开启分页
            ,limit:8
            , toolbar: '#toolbarDemo'
            ,cols: [[ //表头
                {type:'checkbox', fixed: true}
                ,{field: 'jobKindId', title: 'ID', width:80, sort: true, fixed: 'left'}
                ,{field: 'k1', title: '一级分类'}
                ,{field: 'k2', title: '二级分类'}
                ,{field: 'k3', title: '三级分类'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]],done:function (res, curr, count) {
                //console.log(count);
                rowsCnt=count;
            }
            ,id: 'testReload'
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');
                var _demoReload = $('#_demoReload');
                var k1=demoReload.val(),k2=_demoReload.val();
                //alert(demoReload.val()+_demoReload.val())
                if(k1==="")
                    k1='%';
                if(k2==="")
                    k2='%';
                //执行重载
                table.reload('testReload', {
                    url:'<%=basePath%>jobClassify/findByk1k2',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        k1: k1,
                        k2: k2
                    }
                }, 'data');
            }
        };

        $(document).on('click','#search',function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //头工具栏事件
        table.on('toolbar(jobclassify)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id),
                data = checkStatus.data,editList=[];
            for(var i=0;i<data.length;i++){
                $.each(data[i],function(name,value) {
                    editList.push(value);
                }); }
            //alert("toolbar");
            switch(obj.event){
                case 'addcorp':
                    layer.open({
                        type: 2,
                        title: '添加职位分类信息',
                        shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['60%', '60%'],
                        content: 'jcEdit.jsp?typt=add',
                        success: function(layero, index){
                            var body = layer.getChildFrame('body', index);
                            //var iframeWin = window[layero.find('iframe')[0]['name']];
                            //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                            var inputList = body.find("input");
                            $(inputList[0]).val(rowsCnt+1);
                        }
                    });
                    break;
                case 'editcorp':
                    var len = checkStatus.data.length;
                    if(len===0){
                        layer.alert("请选择一条数据");
                    }else if(len>1){
                        layer.alert("一次编辑一条记录");
                    }else{
                        layer.open({
                            type: 2,
                            title: '编辑公司信息',
                            shadeClose: true,
                            shade: 0.8,
                            maxmin: true,
                            area: ['70%', '70%'],
                            content: 'jcEdit.jsp?typt=edit',
                            success: function(layero, index){
                                var body = layer.getChildFrame('body', index);
                                var inputList = body.find("input");
                                for (var i = 0; i < inputList.length; i++ ) {
                                    $(inputList[i]).val(editList[i]);
                                }
                            }
                        });
                    }
                    break;
                case 'delcorp':
                    var idarr=[];
                    for(var i=0;i<data.length;i++)
                        idarr.push(data[i].jobKindId);
                    //layer.alert(JSON.stringify(idarr));
                    layer.confirm('真的删除这'+idarr.length+'行吗', function (index) {
                        $.ajax({
                            url: '<%=basePath%>jobClassify/delete',
                            data: {strId:JSON.stringify(idarr)},
                            type: 'post',
                            dataType: 'JSON',
                            success: function (d) {
                                if (d.code === 10000) {
                                    window.location.reload();
                                } else {
                                    layer.alert("删除失败，你联系管理员");
                                }
                            },
                            complete: function () {
                                layer.close(index);
                            }
                        })
                    });
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(jobclassify)', function(obj){
            var data = obj.data //获得当前行数据（json格式的键值对）
                , editList = []; //存放获取到的那条json数据中的value值（不放key）
            $.each(data, function (name, value) {//循环遍历json数据
                editList.push(value);//将json数据中的value放入数组中（下面的子窗口显示的时候要用到）
            });
            if (obj.event === 'del') {
                var idarr=[];
                idarr.push(data.jobKindId);
                layer.confirm('真的删除这'+idarr.length+'行吗', function (index) {
                    $.ajax({
                        url: '<%=basePath%>jobClassify/delete',
                        data: {strId:JSON.stringify(idarr)},
                        type: 'post',
                        dataType: 'JSON',
                        success: function (d) {
                            alert(d);
                            if (d.code === 10000) {
                                obj.del();
                            } else {
                                layer.alert("删除失败，你联系管理员");
                            }
                        },
                        complete: function () {
                            layer.close(index);
                        }
                    })
                });
            } else if (obj.event === 'edit') {
                //var name = encodeURIComponent(data.toolName);
                // console.log(data.toolName);
                layer.open({
                    type: 2,
                    title: '编辑公司信息',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['70%', '70%'],
                    content: 'jcEdit.jsp?typt=edit',
                    success: function (layero, index) {
                        var body = layer.getChildFrame('body', index);
                        //var iframeWin = window[layero.find('iframe')[0]['name']];
                        //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        var inputList = body.find("input");//获取到子窗口的所有的input标签
                        for (var i = 0; i < inputList.length; i++) {
                            $(inputList[i]).val(editList[i]); //遍历子窗口的input标签，将之前数组中的值一次放入显示
                        }
                    }
                });
            }
        });


    });
    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
</body>
</html>
