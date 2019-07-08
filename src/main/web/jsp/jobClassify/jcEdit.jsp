<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 2019/7/7
  Time: 8:31
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
<div>
    <form class="layui-form" action="" style="margin-top: 15px;margin-left: 15%">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">分类id</label>
                <div class="layui-input-inline">
                    <input name="id" lay-verify="required" readonly="" autocomplete="off"
                           class="layui-input" type="text" style="color: #9F9F9F">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">一级分类</label>
                <div class="layui-input-inline">
                    <input name="k1" lay-verify="required" autocomplete="off" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">二级分类</label>
                <div class="layui-input-inline">
                    <input name="k2" lay-verify="required" autocomplete="off" class="layui-input" type="text">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">三级分类</label>
                <div class="layui-input-inline">
                    <input name="k3" lay-verify="required" autocomplete="off" class="layui-input" type="text">
                </div>
            </div>
            <div class="layui-btn-container" >
                <button style="margin-left: 35%;margin-top: 15px" class="layui-btn" lay-submit="" lay-filter="editCorp">立即提交</button>
            </div>
        </div>
    </form>
</div>


<script src="<%=basePath%>static/plugin/layui/layui.js"></script>
<script>
    var url = location.search;
    var changeType=url.substr(6);
    //alert(changeType);
    layui.use(['form', 'layedit'] ,function(){
        var $ = layui.jquery
            ,form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
        var index = parent.layer.getFrameIndex(window.name); //修改成功的时候点击 确定 会关闭子窗口，这里获取一下子窗口
        form.render();
        //监听提交
        form.on('submit(editCorp)', function(data){ //这块要跟表单中的lay-filter="editStudent"对应
            $.ajax({
                url: "<%=basePath%>jobClassify/change?changeType="+changeType,
                type: "post",
                async: false,   //不要让它异步提交
                data: data.field,
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    if(data.code===10000){
                        layer.alert("修改成功",{icon: 1,time:2000},function () {
                            layer.close(layer.index);
                            window.parent.location.reload();    //重新加载父页面，进行数据刷新
                        });
                    } else{
                        layer.alert("修改失败，请重试",{icon: 2,time:2000});
                    }

                },
                fail:function () {
                    layer.alert("修改失败，请联系管理员",{icon: 2,time:2000},function(){
                        layer.close(layer.index);
                    });
                }
            });
            return false;
        });

    });
</script>
</body>
</html>
