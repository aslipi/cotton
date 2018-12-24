<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>资源查询</title>
		<#include "/common/header.ftl">
    	<style type="text/css">
		body{font: 12px Arial,"PingFang SC","Hiragino Sans GB",STHeiti,"Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;}
    	.noselect{background: #e8e8e8;} 
    	.exam-person h2{width: 98%;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		.exam-person h2 button{background-color: #e66700;border: 1px;border-radius: 5px;color: white;float: right;margin-top: 5px;}
    	.exam-person span{font-size:12px;}
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
                            <#--<div class="buttons buttons-left">
                                <span class="left-buttons">
                                    <a class="button back-button" href="javascript:history.back(-1);">
                                        <i class="icon iconfont icon-back"></i>
                                    </a>
                                </span>
                            </div>-->
                            <div class="title title-center header-item" style="left: 71px; right: 71px;">资源查询</div>
                        	<#--<div class="buttons buttons-right">
							    <span class="secondary-buttons">
							        <button class="button icon iconfont icon-search button-middle" style="padding: 0 0 0 0;" @click="goSearch"></button>
							    </span>
							</div>-->
                        </div>
                    </div>
                </div>
                <div class="view-container">
                    <div class="pane" style="opacity: 1; box-shadow: rgba(0, 0, 0, 0) 0px 0px 10px; transform: translate3d(0%, 0px, 0px);">
                        <div class="has-tabs">
                            <div class="head-condition">
                                <div class="head-search" >
	                                <div class="item item-input normal-search">
		                                <input type="text" placeholder="批号/加工厂/供应商" class="ng-pristine ng-untouched ng-valid ng-empty" v-model="keyword">
		                                <button class="button-clear button-light" style="" @click="search">
		                                	<i class="icon iconfont icon-search"></i>
		                                </button>
		                            </div>
		                            <#--<button class="btn-high-search" style="">
		                            	<i class=""></i>
		                            </button>-->
								</div>
                            </div>
                            <div class="has-header has-tabs scroll-content ionic-scroll has-filter has-search" ref="ioncontent">
                                <div class="scroll" style="transform: translate3d(0px, 0px, 0px) scale(1);">
                                    <div class="disable-user-behavior" style="display: none;" v-bind:style="{ display: setListHS }">
                                        <div ref="list" class="list" style="overflow-y:scroll" v-bind:style=" {height: scrollHeight} ">
											<div class="scroll" style="transform: translate3d(0px, 0px, 0px) scale(1);">
				                                <div ref="content" class="exam-content">
				                                	<div v-for="(item,index) in list" style="margin: 5px;">
										   				<div class="exam-person">
													        <h2>批号：{{item.batchNumber}}&nbsp;&nbsp;&nbsp;&nbsp;
																<span style='font-size:15px;'>价格：{{item.price}}(元/吨)</span>
																<button @click="goDesc(item.batchNumber)">查看</button>
															</h2>
													        <p style="color: #666">供应商：{{item.supplier}}</p>
                                                            <p style="color: #666">存放仓库：{{item.depository}}</p>
															<table style="width: 100%;">
																<tr>
																	<td>颜色级</td>
                                                                    <td>长度</td>
                                                                    <td>比强</td>
                                                                    <td>马值</td>
                                                                    <td>回潮</td>
                                                                    <td>含杂</td>
                                                                    <td>长整</td>
                                                                    <td>轧工</td>
																</tr>
                                                                <tr>
                                                                    <td>{{item.colorLevel==null||item.colorLevel=="0"?'--':item.colorLevel}}</td>
                                                                    <td>{{item.length==null?'--':item.length}}</td>
                                                                    <td>{{item.strength==null?'--':item.strength}}</td>
                                                                    <td>{{item.micronValue==null?'--':item.micronValue}}</td>
                                                                    <td>{{item.resurgence==null?'--':item.resurgence}}</td>
                                                                    <td>{{item.impurity==null?'--':item.impurity}}</td>
                                                                    <td>{{item.longInteger==null?'--':item.longInteger}}</td>
                                                                    <td>{{item.rollProcess==null?'--':item.rollProcess}}</td>
                                                                </tr>
															</table>
												        </div>
											        </div>

                                                    <div style="text-align: center;margin: 10px;" :style="{ 'display': loading && list.length > 1 ? 'block' : 'none' }">没有更多了</div>
                                                    <div ref="loading" style="text-align: center;margin: 10px;" :style="{ 'display': loading ? 'none' : 'block' }">
                                                        <img src="/img/loading2.gif" style="width:16px;height:16px;margin-right: 5px;" >加载中...
													</div>
				                                </div>
                            				</div>
										</div>
                                    </div>
                                    <#--<div id="loading" style="position:absolute;left:0;right:0;top:0;bottom:0;z-index:0;text-align:center" :class="loadClass">
										<img src="/img/loading.gif" style="margin-top:10%;width:60px">
									<div style="width:100%;margin-top:10px">Loading...</div></div>-->
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
                 list:[],
				 item:"",
                 state:"",
                 keyword:"",
                 setEmpty:"ng-hide",
                 setListHS:"",
                 scrollHeight: "",
                 selects:false,
                 loadingToast:false,
				 loading:false,
                 backdrop:false,
                 container:false,
                 currentPage:0
             },
             mounted:function() {
            	_this = this;
         	    _this.send();
                _this.$refs.list.addEventListener('scroll', _this.handleScroll)
             },
			 watch: {

			 },
             methods:{
                 send(){
                	 _this = this;
                	 _this.setEmpty = "ng-hide";
                	 axios.post("/web/cotton/loadList",{
                	     currentPage:_this.currentPage,
                         keyword:_this.keyword
                     },{timeout: 15000}).then(function(resp){
                    	 if(resp.data!=null&&resp.data.length>0){
                    	     for(var i=0;i<resp.data.length;i++){
                                 _this.list.push(resp.data[i]);
							 }
                         }else{
                    	     if(_this.list.length < 1){
                                 _this.setEmpty = "";
                                 _this.setListHS="none";
							 }else{
                    	         _this.loading = true;
							 }
                    	 }
                    	 _this.scrollHeight = _this.$refs.ioncontent.offsetHeight+'px';
                     }).catch(resp => {
                         console.log('请求失败：'+resp.status+','+resp.statusText);
                     });
                 },
                 handleScroll () {
                     _this = this;
					 var scrollTop = _this.$refs.list.scrollTop+_this.$refs.list.offsetHeight+1;
                     var scrollHeight = _this.$refs.list.scrollHeight;
                     if (scrollTop = scrollHeight && !_this.loading) {
                         _this.currentPage += 1;
                         _this.send();
                     }

                 },
                 goDesc(num){
                     window.location.href = "/web/cotton/desc?num="+num;
                 },
                 search(){
                	 _this = this;
                	 _this.list = [];
                     _this.currentPage = 0;
                	 _this.send();
                 },
                 backList(){
                	 _this = this;
         			 _this.searchBackdrop = false;
                 }
             }
         });
    </script>
</html>