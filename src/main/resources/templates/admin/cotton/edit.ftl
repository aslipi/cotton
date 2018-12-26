<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>棉仓管理系统</title>
    <link href="/css/basic.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/member-css.css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/css/layer/layer.js"></script>
    <link rel="stylesheet" href="css/layer/layer.css" id="layui_layer_skinlayercss" style="">
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
    <style>
        input,select{width:180px;}
        input.title{width:180px;}
        .Wdate{width:110px;}
        ul li {float:left;padding-right:10px;}
        a {color:red;}
        .main_tab   td {
            line-height: 22px;
            border: 1px solid #ebebeb;

            background-color: #ffffff;
            white-space: nowrap;}
        .office_gray td {    text-align: right;
            vertical-align: center;
            font-family: Microsoft YaHei;
            font-size: 15px;
            color: #1c9c64;
            width: 120px;
        }
        #tabbody-div td.label {height: 0 !important;}
    </style>
<body>
<div id="FrameR">
    <div id="tabbody-div">
        <table width="100%" style="padding-top:15px;">
            <tbody>
            <tr>
                <td class="label"><font class="red">*</font>批号：</td>
                <td>
                    ${batchNumber}
                </td>
            </tr>
            </tbody>
        </table>
        <div id="resultMgr">
            <form id="form">
                <input type="hidden" name="batchNumber" id="batchNumber" value="${batchNumber!}">
                <table width="100%" style="padding-top:15px;">
                    <tbody>
                    <tr>
                        <td class="label"><font class="red">*</font>价格：</td>
                        <td>
                            <input type="text" class="input1" style="width:70px;" name="price" id="price" maxlength="50" size="8" value="${(quotation.price)!?replace(",","")}"> 元/吨
                        </td>
                    </tr>
                    <tr>
                        <td class="label">供应商：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="supplier" id="supplier" maxlength="50" size="16" value="${(quotation.supplier)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">存放仓库：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="depository" id="depository" maxlength="50" size="16" value="${(quotation.depository)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">加工单位：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="processUnit" id="processUnit" maxlength="50" size="16" value="${(quotation.processUnit)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">证书编号(重量)：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="weightCer" id="weightCer" maxlength="50" size="16" value="${(quotation.weightCer)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">证书编号(质量)：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="qualityCer" id="qualityCer" maxlength="50" size="16" value="${(quotation.qualityCer)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">联系人：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="contacts" id="contacts" maxlength="50" size="16" value="${(quotation.contacts)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">联系电话：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="tel" id="tel" maxlength="50" size="16" value="${(quotation.tel)!}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">联系地址：</td>
                        <td colspan="4">
                            <input type="text" class="input1" style="width:300px;" name="address" id="address" maxlength="50" size="16" value="${(quotation.address)!}">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
            <table class="main_tab" style="width:90%;margin-left:40px;">
                <tbody>
                    <tr class="office_gray">
                        <td style="text-align:center;">颜色级</td>
                        <td style="text-align:center;">长度</td>
                        <td style="text-align:center;">马值</td>
                        <td style="text-align:center;">比强</td>
                        <td style="text-align:center;">含杂</td>
                        <td style="text-align:center;">回潮</td>
                        <td style="text-align:center;">公重</td>
                        <td style="text-align:center;">毛重</td>
                    </tr>
                    <tr class="office_gray">
                        <td style="text-align:center;">${item.cl}</td>
                        <td style="text-align:center;">${item.len}</td>
                        <td style="text-align:center;">${item.mv}</td>
                        <td style="text-align:center;">${item.stre}</td>
                        <td style="text-align:center;">${item.imp}</td>
                        <td style="text-align:center;">${item.res}</td>
                        <td style="text-align:center;">${item.weight}</td>
                        <td style="text-align:center;">${item.gw}</td>
                    </tr>
                </tbody>
            </table>
            <div class="clear"></div>

        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="tabbody-div">
    <div class="button-div">
        <input type="button" class="button" name="button" id="checkbutton" value="保存" onclick="save()">
        <input type="button" class="button" name="Submit2" value="取消" onclick="closeAll();">
    </div>
</div>
</body>
<script>
    function closeAll(){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }

    function save(){
        $.ajax({
            type:"post",
            url:"/admin/cotton/${msg}",
            data:$("#form").serialize(),
            success:function(result){
                if(result == "0"){
                    parent.location.reload();
                    closeAll();
                }else{
                    layer.alert("添加失败")
                }
            }
        })
    }
</script>
</html>