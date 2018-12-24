<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>包数据详情</title>
		<#include "/common/header.ftl">
    	<style type="text/css">
		body{font: 12px Arial,"PingFang SC","Hiragino Sans GB",STHeiti,"Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;}
    	.noselect{background: #e8e8e8;} 
    	.exam-person h2{width: 98%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		.exam-person h2 button{background-color: #e66700;border: 1px;border-radius: 5px;color: white;float: right;margin-top: 5px;}
    	.exam-person span{font-size:12px;}
        .exam-person p{padding: 2px;}
        .head-condition{top: 50px;padding-left: 5px;font-size: 15px;color: #ec7c03;}
        .exam-content table tr:nth-child(1){font-size: 15px;background: #e4fffd;}
        .exam-content table tr td{padding: 5px;text-align: center;border-bottom: 1px solid #c3c3c3;}
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
                            <div class="title title-center header-item" style="left: 71px; right: 71px;">${batchNumber}包数据</div>
                        </div>
                    </div>
                </div>
                <div class="has-tabs">
                    <div class="has-header has-tabs scroll-content ionic-scroll has-filter has-search" ref="ioncontent" style="top:44px;">
                        <div class="scroll" style="transform: translate3d(0px, 0px, 0px) scale(1);">
                            <div class="disable-user-behavior" style="display: none;" v-bind:style="{ display: setListHS }">
                                <div ref="list" class="list" style="overflow-y:scroll" v-bind:style=" {height: scrollHeight} ">
                                    <div class="scroll" style="transform: translate3d(0px, 0px, 0px) scale(1);">
                                        <div ref="content" class="exam-content">
                                            <table style="width: 800px;">
                                                <tbody>
                                                    <tr>
                                                        <td>序号</td>
                                                        <td>颜色级</td>
                                                        <td>长度</td>
                                                        <td>马值</td>
                                                        <td>比强</td>
                                                        <td>长整</td>
                                                        <td>轧工</td>
                                                        <td>公检日期</td>
                                                        <td>黄度</td>
                                                        <td>反射率</td>
                                                        <td>条形码</td>
                                                    </tr>
                                                    <#if list??>
                                                        <#list list! as item>
                                                            <tr>
                                                                <td>${item_index+1}</td>
                                                                <td>{{colourLevel["${item.colorLevel!}"]}}</td>
                                                                <td>${item.length!}</td>
                                                                <td>${item.micronValue!}</td>
                                                                <td>${item.strength!}</td>
                                                                <td>${item.longInteger!}</td>
                                                                <td>${item.rollProcess!}</td>
                                                                <td>${item.inspectionDate!?date}</td>
                                                                <td>${item.yellowIndex!}</td>
                                                                <td>${item.reflectivity!}</td>
                                                                <td>${item.barCode!}</td>
                                                            </tr>
                                                        </#list>
                                                    </#if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="empty-img" :class="setEmpty">
                                <img src="/img/empty.png">
                                <p>未找到相关数据</p>
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
                 colourLevel:{"11":"白棉1级","21":"白棉2级","31":"白棉3级",
                     "41":"白棉4级","51":"白棉5级","12":"淡点污棉1级",
                     "22":"淡点污棉2级","32":"淡点污棉3级","13":"淡黄染棉1级",
                     "23":"淡黄染棉2级","33":"淡黄染棉3级","14":"黄染棉1级",
                     "24":"黄染棉2级"},
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

             }
         });
    </script>
</html>