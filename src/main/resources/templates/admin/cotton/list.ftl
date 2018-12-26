<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>棉仓管理</title>
    <link href="/css/v_basic.css" rel="stylesheet" type="text/css">
    <link href="/css/v_style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/v_member-css.css" type="text/css">
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/js/layer.js"></script>
    <link rel="stylesheet" href="/css/layer/layer.css" id="layui_layer_skinlayercss" style="">
    <script type="text/javascript" src="/js/cszyMgr.js"></script>

    <script type="text/javascript" src="/js/alertMessage.js"></script>
    <script type="text/javascript" src="/js/public/common.js"></script>
    <style>

        body{  font-size:12px; font-family:Microsoft YaHei; line-height:150%; margin:0; padding:0; color:#555; width:100%; }

    </style>
    <style>
        .dow {
            display: block;
            width: 120px;
            height: 30px;
            line-height: 26px;
            text-align: center;
            font-family: arial, verdana, sans-serif, '新宋体';
            font-weight: bold;
            font-size: 14px;
            background: #50c08e;
            color: #fff;
            text-decoration: none;
            cursor: pointer
        }
    </style>

    <style type="text/css">
        .kuangline {
            border: 1px solid #E3E1E1;
            font-size: 12px;
            color: #555;
            padding-left: 0px;
            padding-top: 18px;
        }
        .zxzy_detail {
            border: 1px solid #E3E1E1;

            color: #555;

        }
        .zxzy {
            border: 1px solid #E3E1E1;
            font-size: 12px;
            color: #555;
            padding-left: 30px;

        }

        .bottonline {
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-bottom-color: #E3E1E1;
            font-size: 13px;
            color: #444;
        }

        .loginfont {
            font-size: 12px;
            color: #555;
        }

        .loginfont2 {
            font-size: 10px;
        }

        .foot {
            font-size: 11px;
            color: #666;
            background-image: url(images/foot_bg.jpg);
            background-repeat: repeat-x;
        }

        * {
            margin: 0px;
            padding: 0px;
        }

        .strong_tr_font {
            font-weight: bold;
            vertical-align: middle;
        }
        .font {
            font-family: "微软雅黑";
            font-size: 16px;
            color: #3391BA;
            padding-left: 18px;
        }

        .font2 {
            font-size: 12px;
            color: #444;
            line-height: 140%;
        }

        a:link {
            color: #555;
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
            color: #FF8533;
        }

        a:active {
            text-decoration: none;
        }

        .office_green_bt_bd {
            font-family: Microsoft YaHei;
            font-size: 15px;
            color: #1c9c64;
        }
    </style>
    <script type="text/javascript">
        function getDataByPageSel(page){
            var url = window.location.href;
            url = setQueStr(url,"currentPage",page);
            window.location.href = url;
        }

        function checkgopagevalue(){
            var url = window.location.href;
            url = setQueStr(url,"currentPage",$("#pagegoto").val()-1);
            window.location.href = url;
        }

        function goSearch(){
            var params = $("#conForm").serialize().split("&");
            var url = window.location.href.split('?')[0];
            for(var i = 0;i<params.length;i++){
                var param = params[i].split("=");
                var key = param[0];
                var value = param[1];
                if(value != ''){
                    if(getQueStr(url,key)!=''){
                        var value2 = getQueStr(url,key);
                        value2 += ";" + value;
                        url = setQueStr(url,key,value2);
                    }else{
                        url = setQueStr(url,key,value);
                    }
                }
            }
            window.location.href = url;
        }

        function close_img(){
            $("#float").css('display','none');
        }

        function reset1(){
            $("#kuangline :text").val('');
            $("#kuangline :checkbox").attr("checked", false);
            $("#ckmc").val('');
            $("#scnd").val('');
            $("#ckcfd").val('');
            $("#sel_jgdw").val('加工厂代码或者加工厂名称');
            $("#sel_jgdw").css('color', '#ddd');
        }
        function genQuotation(){
            var code_Values = document.getElementById("resultTable").getElementsByTagName("input");
            var check_flag = false;
            //var product_id_arr = [];
            for(i = 0;i < code_Values.length;i++){
                if(code_Values[i].type == "checkbox") {
                    if(code_Values[i].checked == true){
                        check_flag = true;
                        //product_id_arr.push(code_Values[i].value);
                    }
                }
            }
        }
    </script>
</head>

<body>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="Keywords" content="棉仓管理">
    <meta name="Description" content="棉仓管理">
    <meta http-equiv="x-ua-compatible" content="IE=EmulateIE8">

    <title>棉仓管理系统</title>
    <link rel="stylesheet" href="/css/public.css">
    <script type="text/javascript">
        $(function () {
            var pageFlag = "";
            if (pageFlag != "") {
                $('#' + pageFlag).addClass('active').siblings().removeClass("active");
            }
        });
    </script>
    <script type="text/javascript" src="/js/header.js"></script>

    <!-- 顶部导航 -->
    <header class="header">
        <!--顶部菜单-->
        <div class="top">
            <div class="top_menu">
                <div class="top_left">
                    <p class="welcome">欢迎！</p>
                    <div class="fr">
                        <span class="loginw">${loginUser.username}</span>
                        <span class="regist"><a href="/logout">退出</a></span>
                    </div>
                </div>
                <div class="top_right">
                    <ul class="right_intro">
                    </ul>
                </div>
            </div>
        </div>
        <!--顶部导航-->
    </header>
    <!-- logo区域 -->
    <div class="lodoarea">
        <div class="leftbufen">
            <a href="#"></a>
            <h2>棉仓管理-<span>忠华集团</span></h2>
        </div>
    </div>
    <!-- 主体部分 -->
    <input type="hidden" name="se_user_id" id="se_user_id" value="107276">
    <input type="hidden" name="se_cust_type" id="se_cust_type" value="1">

        <div id="FrameR">
            <!--搜索框-->
            <div class="chaxun1">
                <form name="conForm" id="conForm" action="" method="post" width="100%" class="jishou_guochan">
                    <div class="tiaojian_office">
                        <div class="tiaojian_office_bt">查询条件</div>
                    </div>
                    <ul class="cons">
                        <li class="pihao" style="width:200px">
                            <span>批号:</span>
                            <span class="same">
                                <input type="text" name="ph" value="${params.ph!}" size="13" class="chaxun">
                            </span>
                        </li>
                        <li class="pihao">
                            <span>存放仓库:</span>
                            <span class="same saec">
                                <input type="text" name="cfck" value="${params.cfck!}" size="20" class="chaxun">
                            </span>
                        </li>
                    </ul>
                    <ul class="cons">
                        <span>主 体 颜 色 级:</span>
                        <#assign x = params.ztys!?split(';')>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="11" ${x!?seq_contains("11")?string("checked", "")}>11
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="21" ${x!?seq_contains("21")?string("checked", "")}>21
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="31" ${x!?seq_contains("31")?string("checked", "")}>31
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="41" ${x!?seq_contains("41")?string("checked", "")}>41
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="51" ${x!?seq_contains("51")?string("checked", "")}>51
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="12" ${x!?seq_contains("12")?string("checked", "")}>12
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="22" ${x!?seq_contains("22")?string("checked", "")}>22
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="32" ${x!?seq_contains("32")?string("checked", "")}>32
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="13" ${x!?seq_contains("13")?string("checked", "")}>13
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="23" ${x!?seq_contains("23")?string("checked", "")}>23
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="33" ${x!?seq_contains("33")?string("checked", "")}>33
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="14" ${x!?seq_contains("14")?string("checked", "")}>14
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="24" ${x!?seq_contains("24")?string("checked", "")}>24
                        </li>
                        <li class="danBtn">
                            <input type="checkbox" name="ztys" value="0" ${x!?seq_contains("0")?string("checked", "")}>无主体
                        </li>
                    </ul>
                    <ul class="cons">
                        <li class="zhimin">
                            <span>长度:</span>
                            <input type="text" name="cd_q" value="${params.cd_q!}" size="3" class="zhi"> -
                            <input type="text" name="cd_z" value="${params.cd_z!}" size="3" class="zhi">
                        </li>

                        <li class="zhimin">
                            <span>马值:</span>
                            <input type="text" name="mz_q" value="${params.mz_q!}" size="3" class="zhi"> -
                            <input type="text" name="mz_z" value="${params.mz_z!}" size="3" class="zhi">
                        </li>
                        <li class="zhimin" style="width:230px">
                            <span>断裂比强度: &gt;=</span>
                            <input type="text" name="dlbqd" value="${params.dlbqd!}" size="3" class="zhi"> cn/tex
                        </li>
                        <li class="zhimin">
                            <span>含杂:</span>
                            <input type="text" name="hz_q" value="${params.hz_q!}" size="3" class="zhi"> -
                            <input type="text" name="hz_z" value="${params.hz_z!}" size="3" class="zhi">
                        </li>
                        <li class="zhimin">
                            <span>回潮:</span>
                            <input type="text" name="hc_q" value="${params.hc_q!}" size="3" class="zhi"> -
                            <input type="text" name="hc_z" value="${params.hc_z!}" size="3" class="zhi">
                        </li>

                    </ul>
                    <ul class="cons" style="border-bottom:none">

                        <li class="zhimin price1" style="width:280px">
                            <span>价格（元/吨）:</span>
                            <input type="text" name="price_q" value="${params.price_q!}" size="5" class="zhi"> -
                            <input type="text" name="price_z" value="${params.price_z!}" size="5" class="zhi">
                        </li>
                        <li class="pihao" style="width:200px">
                            <span>状态:</span>
                            <span class="same sele">
                                    <select id="e_product_publish_status" name="e_product_publish_status" style="width:85px">
                                        <option value="" selected="selected">请选择...</option>
                                        <option value="00">未发布</option>
                                        <option value="01">已发布</option>
                                    </select>
                                  </span>
                        </li>

                        <li class="pihao" style="margin-left:38px">
                            <div class="cutton" style="margin:0">
                                <div class="cuttonButton">
                                    <input type="button" name="button" onclick="goSearch();" value="查&nbsp;询" class="button">
                                    <input type="reset" name="reset" value="重&nbsp;置" class="buttonReset">
                                </div>
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <form name="classForm" method="post" action="product_manage.jsp" target="_self">
            <div id="resultdiv">
                <style type="text/css">
                    .data {
                        width: 100%;
                        border: 0;
                        border-collapse: collapse;
                    }

                    .list_tb  td {
                        text-align: center;
                    }
                    #resultTable a {
                        text-decoration: underline
                    }
                </style>

                <!--内容列表-->
                <div class="list-div">
                    <div class="list_data">
                        <div class="list-name">列表</div>
                        <div class="office_list_top_l_zts">
                            共搜到：<span id="e_num">0</span>条数据
                        </div>
                    </div>
                    <div class="list-title-new" style="float:right">
                        <span class="button-add-info">
                            <a href="javascript:func('新增');">新增</a>
                        </span>
                        <span class="button-add-info">
                            <a href="javascript:func('发布');">发布</a>
                        </span>
                        <span class="button-add-info">
                            <a href="javascript:func('导入批号');">导入批号</a>
                        </span>
                        <span class="button-add-info">
                            <a href="javascript:func('导入条码');">导入条码</a>
                        </span>
                        <span class="button-add-info">
                            <a href="javascript:func('修改');">修改</a>
                        </span>
                        <span class="button-add-info">
                            <a href="javascript:func('取消发布');">取消发布</a>
                        </span>
                        <span class="button-add-info">
                            <a href="javascript:func('删除');">删除</a>
                        </span>
                    </div>
                    <div class="clear"></div>
                    <table class="list_tb" style="width:100%;" cellpadding="3" cellspacing="0">
                        <tbody>
                        <tr>
                            <th>全选<input name="selectAll" id="selectAll" type="checkbox" value=""></th>
                            <th>批号</th>
                            <th>加工单位</th>
                            <th>重量</th>
                            <th>颜色级</th>
                            <th>长度</th>
                            <th>马值</th>
                            <th>比强</th>
                            <th>含杂</th>
                            <th>回潮</th>
                            <th>存放仓库</th>
                            <th>销售价</th>
                            <th>状态</th>
                        </tr>
                        <#if (list)!??>
                            <#list list as item>
                                <tr>
                                    <td><input name="id" id="id" type="checkbox" value="${item.id!}"></td>
                                    <td><a href="/admin/cotton/desc?batchNumber=${item.batchNumber!}" target="_blank">${item.batchNumber!}</a></td>
                                    <td>${item.processUnit!}</td>
                                    <td>${item.weight!}</td>
                                    <td>${(item.colorLevel! == "0")?string("--","${item.colorLevel!}")}</td>
                                    <td>${item.length!}</td>
                                    <td>${item.micronValue!}</td>
                                    <td>${item.strength!}</td>
                                    <td>${item.impurity!}</td>
                                    <td>${item.resurgence!}</td>
                                    <td>${item.depository!}</td>
                                    <td>${item.price!}</td>
                                    <td>
                                        <#if item.state! == 0>
                                            <font color="red">未发布</font>
                                        <#elseif item.state! == 1>
                                            已发布
                                        </#if>
                                    </td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="19"><font size="2" color="red">暂无数据</font></td>
                            </tr>
                        </#if>
                        </tbody>
                    </table>
                    <#if (list)!??>
                    <!-- 分页 -->
                        <table id="page-table" cellspacing="0" style="float:right;margin;margin-bottom:20px">
                            <tbody><tr>
                                <td align="right" nowrap="nowrap" class="first" style="border-left:none">
                                    <div id="turn-page" class="office_list_top_l_zts">总计${params.count!'0'}
                                        <span id="pageTotalId"></span>个记录/共
                                        <span>${params.pageCount!}</span>页,&nbsp;第
                                        <span>${(params.currentPage?number+1)!}</span>页&nbsp;
                                        <span id="page-link">
                                            <a href="javascript:void('0')" onclick="getDataByPageSel('0')">首页</a>&nbsp;
                                            <#if (params.currentPage?number!) != 0>
                                                <a href="javascript:void('0')" onclick="getDataByPageSel(${params.currentPage?number-1!})">上一页</a>&nbsp;
                                            <#elseif (params.currentPage?number!) != (params.pageCount?number-1!)>
                                                <a href="javascript:void('0')" onclick="getDataByPageSel(${params.currentPage?number+1!})">下一页</a>&nbsp;
                                            <#else>
                                                <a href="javascript:void('0')" onclick="getDataByPageSel(${params.currentPage?number-1!})">上一页</a>&nbsp;
                                                <a href="javascript:void('0')" onclick="getDataByPageSel(${params.currentPage?number+1!})">下一页</a>&nbsp;
                                            </#if>
                                            <a href="javascript:void('0')" onclick="getDataByPageSel(${params.pageCount?number-1!})">尾页</a>
                                        </span>&nbsp;第<input type="text" value="1" id="pagegoto" name="pagegoto" maxlength="6" size="6" onkeyup="value=this.value.replace(/\D+/g,'')">页<input type="button" id="buttontz" value="跳转" onclick="return checkgopagevalue();"> &nbsp;
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    <#else>
                    </#if>
                </div>
            </div>
            <script language="JavaScript">
                function func(p) {
                    var ids = document.getElementsByName("id");
                    var id = '';
                    var n = 0;
                    for ( var i = 0; i < ids.length; i++) {
                        if (ids[i].checked == true) {
                            var arr = ids[i].value;
                            id += arr + ',';
                            n++;
                        }
                    }
                    if (p == '新增') {
                        openUrl("/admin/cotton/addXzph",p+'资源')
                        return;
                    }
                    if (p == '导入批号') {
                        openUrl("/admin/cotton/goImportQuo",p+'资源')
                        return;
                    }
                    if (p == '导入条码') {
                        openUrl("/admin/cotton/goImportQua",p+'资源')
                        return;
                    }
                    if (!id == '') {
                        id = id.substring(0,id.length-1)
                        if (p == '修改') {
                            if(n>1){
                                layer.alert("只能选择一个");
                            }else{
                                openUrl("/admin/cotton/goUpdate?id="+id,p+'资源')
                            }
                            return;
                        }
                        if (p == '发布') {
                            layer.confirm('您选择了'+(n)+'批资源，确定要发布?', function(index){
                                var checkUrl="/admin/cotton/release?ids="+id;
                                $.ajax({
                                    method:"post",
                                    url:checkUrl,
                                    success:function(isSuccess){
                                        if($.trim(isSuccess)=="1"){
                                            layer.alert("发布成功");
                                            location.reload();
                                            closeAll();//关闭弹出层
                                        } else
                                        {
                                            layer.alert("发布失败");
                                        }
                                    },
                                    beforeSend: function(){
                                        layer.load();
                                    }
                                });
                                layer.close(index);
                            });
                        }
                        if (p == '取消发布') {
                            layer.confirm('您选择了'+(n)+'批资源，确定要取消发布?', function(index){
                                var checkUrl="/admin/cotton/unrelease?ids="+id;
                                $.ajax({
                                    method:"post",
                                    url:checkUrl,
                                    success:function(isSuccess){
                                        if($.trim(isSuccess)=="1"){
                                            layer.alert("取消发布成功");
                                            location.reload();
                                            closeAll();//关闭弹出层
                                        } else
                                        {
                                            layer.alert("取消发布失败");
                                        }
                                    },
                                    beforeSend: function(){
                                        layer.load();
                                    }
                                });
                                layer.close(index);
                            });
                        }
                        if (p == '删除') {
                            layer.confirm('您选择了'+(n)+'批资源，确定要删除?', function(index){
                                var checkUrl="/admin/cotton/remove?ids="+id;
                                $.ajax({
                                    method:"post",
                                    url:checkUrl,
                                    success:function(isSuccess){
                                        if($.trim(isSuccess)=="1"){
                                            layer.alert("删除成功");
                                            location.reload();
                                            closeAll();//关闭弹出层
                                        } else
                                        {
                                            layer.alert("删除失败");
                                        }
                                    },
                                    beforeSend: function(){
                                        layer.load();
                                    }
                                });
                                layer.close(index);
                            });
                        }
                    } else {
                        var info = '请至少选择一批资源';
                        layer.alert(info);
                        return;
                    }
                }

                $(function(){
                    $("#selectAll").click(function(){
                        var all = document.getElementById('selectAll').checked;
                        var ids = document.getElementsByName("id");
                        if (all == true) {
                            for ( var j = 0; j < ids.length; j++) {
                                ids[j].checked = "checked";
                            }
                        } else {
                            for ( var j = 0; j < ids.length; j++) {
                                ids[j].checked = "";
                            }
                        }
                    })
                })
            </script>
            <div style="clear:both"></div>
        </form>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0.1">

        <meta name="Keywords" content="棉仓管理">
        <meta name="Description" content="棉仓管理">
        <meta http-equiv="x-ua-compatible" content="IE=EmulateIE8">
        <title>棉仓管理系统</title>
        <link rel="stylesheet" href="/css/public.css">
        <link rel="stylesheet" href="/css/index.css">

        <!--底部链接-->
        <div class="foot_02">
            <div class="foot_box">
                <a href="#">关于我们</a> |
                <a href="#">法律声明</a> |
                <span>诚聘英才</span> |
                <a href="#">征集合作</a> |
                <a href="#">联系我们</a>
            </div>
        </div>
    </body>
</html>