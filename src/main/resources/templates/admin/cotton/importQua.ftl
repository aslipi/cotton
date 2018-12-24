<html>
    <head>
        <title>导入Excl</title>
        <meta http-equiv="X-UA-Compatible" content="IE=8">
        <link href="/css/basic.css" rel="stylesheet" type="text/css">
        <link href="/css/member-css.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="/js/my97/WdatePicker.js"></script><link href="http://www.emiancang.com/include/js/my97/skin/WdatePicker.css" rel="stylesheet" type="text/css">
        <script src="/js/jquery.js" language="jscript" type="text/jscript"></script>
        <link rel="stylesheet" type="text/css" href="/js/fancyBox/jquery.fancybox.css" media="screen">
        <script type="text/javascript" src="/js/fancyBox/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="/js/fancyBox/jquery.fancybox-1.2.1.js"></script>

        <script type="text/javascript" src="/public/js/public.js"></script>
        <script type="text/javascript" src="/public/js/labelauty.js"></script>
        <script type="text/javascript">

            function getFullPath(obj) {
                if(obj) {
                    //ie
                    if (window.navigator.userAgent.indexOf("MSIE")>=1) {
                        obj.select();
                        document.body.focus();
                        return document.selection.createRange().text;
                    }
                    //firefox
                    else if(window.navigator.userAgent.indexOf("Firefox")>=1) {
                        obj.files;
                        return window.URL.createObjectURL(obj.files[0]);
                    }
                    return obj.value;
                }
            }

            function Check_Value_My(val){
                var fobj = document.getElementById('uoloadExcel');

                var fvalue = getFullPath(fobj);

                // alert(fvalue);
                var fname = fobj.value;
                var uploadclass = "xls";
                if (fname == null || fname == "") {
                    alert("请选择Excel文件上传");
                    return false;
                }
                else {
                    var pos = fname.lastIndexOf(".");
                    var lastname = fname.substring(pos+1, fname.length);
                    if (fname.indexOf("(") != -1||fname.indexOf(")") != -1){
                        alert("您上传的文件名包含英文小括号()字符，请修改后再次上传！");
                        return false;
                    }
                }
                $("#subbutton").val('提交中');
                $('#subbutton').attr('disabled',"true");
                document.uploadExcelform.submit();
            }

            function closeAll(){
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            }
        </script>
    </head>
    <body>
    <input type="hidden" name="csrf_token" id="csrf_token" value="null">
    <div id="FrameR">
        <form name="uploadExcelform" action="/cotton/importQua" method="post" target="_self" enctype="multipart/form-data">
            <div style="padding:10px;">
                提示：<font color="red">
                （1）本次上传的excel只发布平台未发布的批次，<br>
                <p style="padding-left:68px;">  本企业已发布未锁定资源的批次进行相应数据更新。</p>

                <p style="padding-left:38px;">（2）点击下载资源发布模版（文件格式为Excel97-2003)</p>
                <p style="padding-left:68px;"> <a target="_blank" href="/file/quality.xlsx" style="color:blue;">模板</a></p>

                <p style="padding-left:38px;">（3）发布不成功的原因：该资源公检数据不存在；该资源已下单；该资源您已销售；其他原因请联系xxxx-xxxxxxx。 </p>

            </font>
            </div>
            <!-- tab body -->
            <div id="tabbody-div">

                <table width="100%" align="center">
                    <tbody><tr>
                        <td class="label"><font class="red">*</font>Excel名称：</td>
                        <td>
                            <input type="file" name="uploadExcel" id="uoloadExcel" accept=".xlsx,.xls">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="button-div" style="padding-top:50px;">
                    <input type="button" name="button" value="提交" id="subbutton" class="button" onclick="Check_Value_My(0)">
                    <input type="button" name="button" value="取消" class="button" onclick="closeAll();">
                </div>
            </div>
        </form>
    </div>
    <div id="fancy_overlay"></div>
    <div id="fancy_wrap">
        <div class="fancy_loading" id="fancy_loading">
            <div></div>
        </div>
        <div id="fancy_outer">
            <div id="fancy_inner">
                <div id="fancy_close"></div>
                <div id="fancy_bg">
                    <div class="fancy_bg fancy_bg_n"></div>
                    <div class="fancy_bg fancy_bg_ne"></div>
                    <div class="fancy_bg fancy_bg_e"></div>
                    <div class="fancy_bg fancy_bg_se"></div>
                    <div class="fancy_bg fancy_bg_s"></div>
                    <div class="fancy_bg fancy_bg_sw"></div>
                    <div class="fancy_bg fancy_bg_w"></div>
                    <div class="fancy_bg fancy_bg_nw"></div>
                </div>
                <a href="javascript:;" id="fancy_left">
                    <span class="fancy_ico" id="fancy_left_ico"></span>
                </a>
                <a href="javascript:;" id="fancy_right">
                    <span class="fancy_ico" id="fancy_right_ico"></span>
                </a><div id="fancy_content"></div><div id="fancy_title">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr>
                            <td class="fancy_title" id="fancy_title_left"></td>
                            <td class="fancy_title" id="fancy_title_main">
                                <div></div>
                            </td>
                            <td class="fancy_title" id="fancy_title_right"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>
    </body>
</html>