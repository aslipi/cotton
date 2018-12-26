<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>棉仓管理系统</title>
    <link href="/public/css/basic.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/member-css.css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/layer.js"></script>
    <link rel="stylesheet" href="/css/layer/layer.css" id="layui_layer_skinlayercss" style="">
    <script type="text/javascript" src="/js/jszyMgr.js"></script>

    <script type="text/javascript" src="/js/alertMessage.js"></script>
    <style>
        input,select{width:180px;}
        input.title{width:180px;}
        .Wdate{width:110px;}
        ul li {float:left;padding-right:10px;}
        a {color:blue;}
        #tabbody-div td.label {height: 0 !important;}
    </style>
</head>
<body>
<div id="FrameR">
    <div id="tabbody-div">
        <table width="100%" style="padding-top:15px;">
            <tbody><tr>
                <td class="label"><font class="red">*</font>批号：</td>
                <td>
                    <input type="text" class="input1" style="width:170px;" value="65489123654" name="num" id="num" maxlength="50" size="16">
                </td>
            </tr>
            </tbody></table>
        <div id="resultMgr"></div>
    </div>
    <div class="clear"></div>
</div>
<div id="tabbody-div">
    <div class="button-div">
        <input type="button" class="button" name="button" id="checkbutton" value="保存" onclick="save()">
        <input type="button" class="button" name="Submit2" value="取消" onclick="closeAll();">
    </div>
</div>

<script type="text/javascript">
    function save(){
        var num = $("#num").val();
        if(num.length!=11)
        {
            layer.alert('请输入正确的批号。');
            return false;
        }
        $.ajax({
            method:"post",
            url:"/admin/cotton/xzph?batchNumber="+num,
            success:function(isSuccess){
                if($.trim(isSuccess)=="0"){
                    layer.alert("当前批次不存在");
                }else if($.trim(isSuccess)=="1"){
                    layer.alert("当前批号已添加");
                }else{
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.iframeSrc(index, "/admin/cotton/goAdd?batchNumber="+num)
                    //parent.layer.url = "/admin/cotton/addZlxq?batchNumber="+num;
                }
            },
            beforeSend: function(){
                //layer.load();
            }
        });


    }

</script>
</body></html>