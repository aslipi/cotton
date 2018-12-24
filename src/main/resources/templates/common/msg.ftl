<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/layer.js"></script>
    <link rel="stylesheet" href="http://www.emiancang.com/public/includes/layer-v2.4/layer/skin/layer.css"
          id="layui_layer_skinlayercss" style="">
    <script type="text/javascript" src="/js/jszyMgr.js"></script>
    <link href="/css/v_basic.css" rel="stylesheet" type="text/css">
    <link href="/css/v_style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/v_member-css.css" type="text/css">
    <script type="text/javascript" src="/js/alertMessage.js"></script>
    <script language="javascript">
        function successredirectit(msg) {
            layer.alert(msg, function (index) {
                parent.location.href = parent.location.href;
                return;
            });
        }
    </script>
</head>

<body onload="successredirectit('${msg}')">
<form name="backString" action="" method="post">
    <input type="hidden" name="csrf_token" id="csrf_token" value="null">
</form>
<div class="layui-layer-shade" id="layui-layer-shade1" times="1"
     style="z-index:19891014; background-color:#000; opacity:0.3; filter:alpha(opacity=30);"></div>
<div class="layui-layer layui-layer-dialog  layer-anim" id="layui-layer1" type="dialog" times="1" showtime="0"
     contype="string" style="z-index: 19891015; top: 134px; left: 216.5px;">
    <div class="layui-layer-title" style="cursor: move;" move="ok">信息</div>
    <div id="" class="layui-layer-content">发布成功</div>
    <span class="layui-layer-setwin"><a class="layui-layer-ico layui-layer-close layui-layer-close1"
                                        href="javascript:;"></a></span>
    <div class="layui-layer-btn"><a class="layui-layer-btn0">确定</a></div>
</div>
</body>
</html>