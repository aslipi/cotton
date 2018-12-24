<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>质量详情</title>
		<#include "/common/header.ftl">
    	<style type="text/css">
		body{font: 12px Arial,"PingFang SC","Hiragino Sans GB",STHeiti,"Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;}
    	.noselect{background: #e8e8e8;} 
    	.exam-person h2{width: 98%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		.exam-person h2 button{background-color: #e66700;border: 1px;border-radius: 5px;color: white;float: right;margin-top: 5px;}
    	.exam-person span{font-size:12px;}
        .exam-person p{padding: 2px;}
        .head-condition{top: 50px;padding-left: 5px;font-size: 15px;color: #0087ff;}

        .index-details{margin-top: 10px;}
        .index-details h2{text-align: center;font-size: 15px;}
        .index-details table{width: 100%;text-align: center;border-bottom: 2px solid #03a9f4;border-top: 2px solid #03a9f4;margin: 5px 0 5px 0;}
        .index-details table td{width: 20%;border:1px solid rgba(0, 0, 0, 0.29)}
        .index-details ul{margin-top: 5px;border-bottom:2px solid #b1b1b1;}
        .index-details ul li:nth-child(odd){list-style:none;padding: 5px;width:50%;float:left;border-bottom:1px solid #b1b1b1;}
        .index-details ul li:nth-child(even){list-style:none;padding: 5px;width:50%;float:left;border-bottom:1px solid #b1b1b1;border-right:1px solid #b1b1b1;}
        .index-details ul li:nth-child(1){list-style:none;padding: 5px;width:50%;width:100%;font-size:15px;border: 0px;border-bottom: 1px solid #b1b1b1;}
        .button-details{text-align: center;margin-top: 15px;margin-bottom: 15px;}
        .button-details button{background: #03a9f4;color: white;border: 0px;border-radius: 2px;height: 30px;}
        select {border: solid 1px #dadada;
				appearance:none;
			  	-moz-appearance:none;
			  	-webkit-appearance:none;
				background: url("/assets/img/arrow.png") no-repeat scroll right center transparent;
			  	padding-right: 14px;
		}
		</style>
    </head>
    
    <body class="emui-theme-2 grade-a platform-browser platform-win32 platform-ready">
        <div id="content">
        <div class="bar-positive nav-bar-container hide">
            <div class="nav-bar-block">
                <div class="bar-positive bar bar-header">
                    <div class="title title-center header-item"></div>
                </div>
            </div>
            <div class="nav-bar-block">
                <div class="bar-positive bar bar-header">
                    <div class="buttons buttons-left">
                        <span class="left-buttons">
                            <a href="javascript:void(0);" class="button back-button">
                                <i class="icon iconfont icon-back"></i>
                            </a>
                        </span>
                    </div>
                    <div class="title title-center header-item" style="left: 46px; right: 46px;"></div>
                </div>
            </div>
        </div>
        <div class="view-container" >
            <div class="pane" style="opacity: 1; transform: translate3d(0%, 0px, 0px);">
                <div class="bar-positive nav-bar-container">
                    <div class="nav-bar-block">
                        <div class="bar-positive bar bar-header">
                            <div class="title title-center header-item"></div>
                        </div>
                    </div>
                    <div class="nav-bar-block">
                        <div class="bar-positive bar bar-header">
                            <div class="buttons buttons-left">
                                <span class="left-buttons">
                                    <a class="button back-button" href="javascript:history.back(-1);">
                                        <i class="icon iconfont icon-back"></i>
                                    </a>
                                </span>
                            </div>
                            <div class="title title-center header-item" style="left: 71px; right: 71px;">质量详情</div>
                        </div>
                    </div>
                </div>
                <#if quotation??>
                    <div class="view-container">
                        <div class="pane" style="opacity: 1; box-shadow: rgba(0, 0, 0, 0) 0px 0px 10px; transform: translate3d(0%, 0px, 0px);">
                            <div class="has-tabs">
                                <div class="head-condition" style="top:50px;padding-left: 5px;">
                                    <span><b>${quotation.batchNumber!}</b></span>&nbsp;&nbsp;
                                    <span style="color: #ec6d00;font-size: 14px">${quotation.pick!}</span>&nbsp;&nbsp;
                                    <span style="color: black;font-size: 14px">
                                        ${quotation.type!}&nbsp;
                                        <#if quotation.colorLevel != "0">
                                            ${quotation.colorLevel!}{{lengths["${lengths[0].len!}"]}}{{mainMv["${mvs[0].mv!}"]}}
                                        </#if>
                                    </span>
                                </div>
                                <div class="has-header has-tabs scroll-content ionic-scroll has-filter has-search" ref="ioncontent" style="top:70px;">
                                    <div class="scroll" style="transform: translate3d(0px, 0px, 0px) scale(1);">
                                        <div class="disable-user-behavior" style="display: none;" v-bind:style="{ display: setListHS }">
                                            <div ref="list" class="list" style="overflow-y:scroll" v-bind:style=" {height: scrollHeight} ">
                                                <div class="scroll" style="transform: translate3d(0px, 0px, 0px) scale(1);">
                                                    <div ref="content" class="exam-content">
                                                        <div style="margin: 2px;">
                                                            <div class="exam-person">
                                                                <p style="color: #666">供应商：<b>${quotation.supplier!}</b></p>
                                                                <p style="color: #666">存放仓库：<b>${quotation.depository!}</b></p>
                                                                <p style="color: #666">加工单位：<b>${quotation.processUnit!}</b></p>
                                                                <p style="color: #666">价格：<b style="color:#ff7300">${quotation.price!}元/吨</b></p>
                                                                <p style="color: #666">联系人：${quotation.contacts!}&nbsp;&nbsp;&nbsp;&nbsp;${quotation.tel!}</p>
                                                            </div>

                                                            <div class="index-details">
                                                                <h2>指标详情</h2>
                                                                <span style="margin: 5px;">证书编号(重量)：${quotation.weightCer!}</span>
                                                                <table>
                                                                    <tr>
                                                                        <td>公重</td>
                                                                        <td>毛重</td>
                                                                        <td>包数</td>
                                                                        <td>回潮</td>
                                                                        <td>含杂</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><b>${quotation.weight!}</b></td>
                                                                        <td><b>${quotation.grossWeight!}</b></td>
                                                                        <td><b>${quotation.number!}</b></td>
                                                                        <td><b>${quotation.resurgence!}</b></td>
                                                                        <td><b>${quotation.impurity!}</b></td>
                                                                    </tr>
                                                                </table>
                                                                <span style="margin: 5px;">证书编号(质量)：${quotation.qualityCer!}</span>

                                                                <ul>
                                                                    <li><b>主体颜色级：{{colourLevel["${quotation.colorLevel}"]}}</b></li>
                                                                    <#list cls as item>
                                                                        <li>${item.colorlevel}:<b style="float: right">${item.ratio}%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                        <#if (!item_has_next && (item_index)%2==0) >
                                                                            <li>&nbsp;&nbsp;&nbsp;</li>
                                                                        </#if>
                                                                    </#list>
                                                                    <div style="clear:both;"></div>
                                                                </ul>

                                                                <ul>
                                                                    <li><b>长度：${quotation.length!}</b></li>
                                                                    <#list lengths! as item>
                                                                        <li>{{lengths["${item.len}"]}}:<b style="float: right">${item.ratio}%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                        <#if (!item_has_next && (item_index)%2==0) >
                                                                            <li>&nbsp;&nbsp;&nbsp;</li>
                                                                        </#if>
                                                                    </#list>
                                                                    <div style="clear:both;"></div>
                                                                </ul>

                                                                <ul>
                                                                    <li><b>比强：${quotation.length!}</b></li>
                                                                    <li>最小值:<b style="float: right">${stmaxmin.minst!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                    <li>最大值:<b style="float: right">${stmaxmin.maxst!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                    <div style="clear:both;"></div>
                                                                </ul>

                                                                <ul>
                                                                    <li><b>马值：${quotation.micronValue!}</b></li>
                                                                    <#list mvs! as item>
                                                                        <li>{{micronValue["${item.mv}"]}}:<b style="float: right">${item.ratio}%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                        <#if (!item_has_next && (item_index)%2==0) >
                                                                            <li>&nbsp;&nbsp;&nbsp;</li>
                                                                        </#if>
                                                                    </#list>
                                                                    <div style="clear:both;"></div>
                                                                </ul>

                                                                <ul>
                                                                    <li><b>长整：${quotation.longInteger!}</b></li>
                                                                    <li>最小值:<b style="float: right">${limaxmin.minli!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                    <li>最大值:<b style="float: right">${limaxmin.maxli!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                    <div style="clear:both;"></div>
                                                                </ul>

                                                                <ul>
                                                                    <li><b>轧工：${quotation.rollProcess!}</b></li>
                                                                    <#list gqs! as item>
                                                                        <li>${item.gq}:<b style="float: right">${item.ratio}%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                        <#if (!item_has_next && (item_index)%2==0) >
                                                                            <li>&nbsp;&nbsp;&nbsp;</li>
                                                                        </#if>
                                                                    </#list>
                                                                    <div style="clear:both;"></div>
                                                                </ul>

                                                                <ul>
                                                                    <li><b>其他：</b></li>
                                                                    <li>+b:<b style="float: right">${quotation.yellowIndex!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                    <li>Rd(%):<b style="float: right">${quotation.reflectivity!}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></li>
                                                                    <div style="clear:both;"></div>
                                                                </ul>
                                                            </div>
                                                            <div class="button-details">
                                                                <button  @click="goTable('${quotation.batchNumber}')">包数据详情</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="scroll-bar scroll-bar-v">
                                        <div class="scroll-bar-indicator scroll-bar-fade-out" style="transform: translate3d(0px, 0px, 0px) scaleY(1); height: 0px;"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="display:none;" :style="{ 'display': loadingToast ? 'block' : 'none' }">
                                <div class="weui-mask_transparent"></div>
                                <div class="weui-toast">
                                    <i class="weui-loading weui-icon_toast"></i>
                                    <p class="weui-toast__content">数据加载中</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
        </div>
        <div class="ionic_toast">
            <div class="toast_section" style="display: none; opacity: 0;">
                <span class="ionic_toast_close">
                    <i class="ion-android-close toast_close_icon"></i>
                </span>
                <span id="toast_html"></span>
            </div>
        </div>
        <div class="click-block click-block-hide"></div>
        <div class="backdrop" :class="[{ visible: backdrop }, { active: backdrop }]"></div>
    </div>
    </body>
    <script type="text/javascript" src="/js/vue.min.js"></script>
    <script type="text/javascript" src="/js/axios.min.js"></script>
    <script type="text/javascript">
    	new Vue({
             el:'#content',
             data:{
                 colourLevel:{"0":"无主体","11":"白棉1级","21":"白棉2级","31":"白棉3级",
                     "41":"白棉4级","51":"白棉5级","12":"淡点污棉1级",
                     "22":"淡点污棉2级","32":"淡点污棉3级","13":"淡黄染棉1级",
                     "23":"淡黄染棉2级","33":"淡黄染棉3级","14":"黄染棉1级",
                     "24":"黄染棉2级"},
                 lengths:{"0":"25","1":"26","2":"27","3":"28","4":"29",
                     "5":"30","6":"31","7":"32"},
                 micronValue:{"0":"C1","1":"B1","2":"A","3":"B2","4":"C2"},
                 mainMv:{"0":"C","1":"B","2":"A","3":"B","4":"C"},
                 setEmpty:"ng-hide",
                 setListHS:"",
                 scrollHeight: "",
                 loadingToast:false,
                 backdrop:false
             },
             mounted:function() {
            	_this = this;
            	_this.scrollHeight = _this.$refs.ioncontent.offsetHeight+'px';
             },
			 watch: {

			 },
             methods:{
                 goTable(num){
                     window.location.href = "/web/cotton/table?num="+num;
                 }
             }
         });
    </script>
</html>