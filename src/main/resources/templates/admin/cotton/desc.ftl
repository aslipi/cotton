<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta charset="utf-8">
	<meta name="Keywords" content="忠华棉仓">
	<meta name="Description" content="忠华棉仓">
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=0.3, maximum-scale=2.0, minimum-scale=0">
	
	<title>忠华棉仓-资源详情</title>
	<link rel="stylesheet" href="/css/public.css">
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/resourceDetail.css">
	
	<style>
		.layui-layer-btn .layui-layer-btn0 {
			background:#4abcfc;
		}
		.basicprocus{
			font-size:20px;
		}
		.basistet{
			color:#000;
		}
		.midbtn{
			width:105px;
			height:30px;
			margin:0 auto;
		}
		.onebtn{
			display:inline-block;
			width:105px;
			height:30px;
			line-height:30px;
			color: #fff;
    		font-size: 16px;
			background:#ff652e;
			text-align:center;
			border-radius: 3px;
		    -webkit-border-radius: 3px;
		    -moz-border-radius: 3px;
		}
	</style>
	<style>
    *{margin:0px;padding:0px;}
  	.tb_zupi{
  		text-align:center;
  		width:710px;
  		border-collapse:collapse;
  		margin-top:10px;
  		
	}
  	.tb_zupi td{
	  	border-width: 1px;
		border-style: solid;
	
	}
  	.font_weight{ 
  		font-weight:bold;
  	}
  	.ver_td{
  		vertical-align:middle;
  	}
 
  </style>
 	<style media="print" type="text/css"> 
.noprint{visibility:hidden}
 </style>	
	<style>
	 .chansty td{
		 border-bottom: 1px solid #030303;
	    border-right: 1px solid #030303;
	    color:#333;
	    font-size:18px;
	}
    </style>
</head>
<body> 
	<div class="surfacer" id="content">
		<div class="caption" style="margin-top: 50px;">
			<p>${quotation.processUnit!}</p>
			<p class="secsur">棉包组批信息汇总表</p>
		</div>
		<#--<div class="flrttal">
			<div class="gjsj fl">入库日期：2018-11-15</div>
			<!-- 右侧打印 &ndash;&gt;
			<div class="factily rt">
				<div class="printbx" onclick="printArea()">
					<img src="/public/images/dwy.png" alt="" class="dayin">
					<a href="javascript:;">打印</a>
				</div>
				<div class="printbx orthpri" onclick="addcompareGj(65732181025)">
					<img src="/public/images/duicdfdbi.png" alt="" class="jiaruduib">
					<a href="javascript:;">加入对比</a>
				</div>
				<div class="printbx orthpri" onclick="openShareDiv('/product/content/content--532355.html')">
					<img src="/public/images/wefenx.png" alt="" class="weixinshare">
					<a href="javascript:;">微信分享</a>
				</div>
				<div class="printbx orthpri noneri" onclick="urlToImg(65732181025)">
					<img src="/public/images/shentugc.png" alt="" class="shengchengtu">
					<a href="javascript:;">生成图片</a>
				</div>
			</div>
		</div>-->

		<!-- 资源表 -->
		<table class="summar tabw" cellspacing="0">
			<tbody>
				<tr>
					<td colspan="2" class="tongzh">
						<span style="font-weight:bold">${quotation.batchNumber!}</span>（${quotation.pick!}）
					</td>
					
					<td colspan="2" class="tongzh">${quotation.type!}
						<span>
							<#if quotation.colorLevel != "0">
								${quotation.colorLevel!}{{lengths["${lengths[0].len!}"]}}{{mainMv["${mvs[0].mv!}"]}}
							</#if>
						</span>
					</td>
					<td colspan="4" style="border-right:none">存放仓库：${quotation.depository!}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td colspan="2" class="qitatz">证书编号（重量）：</td>
					<td colspan="2" class="qitatz">${quotation.weightCer!}</td>
					<td colspan="2" class="qitatz">执行标准：</td>
					<td colspan="2" class="qitatz wuri"></td>
				</tr>
				<tr>
					<td colspan="2" class="qitatz">合计包数：</td>
					<td colspan="2" class="qitatz">${quotation.number!}</td>
					<td colspan="2" class="qitatz">合计皮重：</td>
					<td colspan="2" class="qitatz wuri">${quotation.tareWeight!}kg</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td colspan="2" class="qitatz">合计毛重：</td>
					<td colspan="2" class="qitatz">${quotation.grossWeight!}t</td>
					<td colspan="2" class="qitatz">平均含杂：</td>
					<td colspan="2" class="qitatz wuri">${quotation.impurity!}</td>
				</tr>
                <tr style="background-color: rgb(246, 246, 246);">
                    <td colspan="2" class="qitatz">合计净重：</td>
                    <td colspan="2" class="qitatz">${quotation.netWeight!}t</td>
                    <td colspan="2" class="qitatz">平均回潮：</td>
                    <td colspan="2" class="qitatz wuri">${quotation.resurgence!}</td>
                </tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td colspan="2" class="qitatz">合计公重：</td>
					<td colspan="2" class="qitatz">${quotation.weight!}t</td>
					<td colspan="2" class="qitatz">轧工质量：</td>
					<td colspan="2" class="qitatz wuri">
						<#list gqs! as item>
                            ${item.gq}:${item.ratio}%&nbsp;
						</#list>
					</td>
				</tr>
				<tr>
					<td colspan="2">证书编号（质量）：</td>
					<td colspan="2">${quotation.qualityCer!}</td>
					<td rowspan="10" class="bgwhite">长度</td>
					<td colspan="2">主体长度级</td>
					<td class="wuri">{{lengths["${lengths[0].len!}"]}}mm</td>
				</tr>
				 <tr style="background-color: rgb(246, 246, 246);">
					<td rowspan="14">颜色级</td>
					<td colspan="2">主体颜色级</td>
					<td>{{colourLevel["${quotation.colorLevel}"]}}</td>
					<td colspan="2">长度平均值</td>
					<td class="wuri">${quotation.length!}</td>
				</tr>
				<tr>
					<td rowspan="13" class="bgwhite">各颜色比例(%)</td>
					<td>白棉1级</td>
					<td>{{clRatio["11"]}}</td>
					<td rowspan="8" class="bgwhite">各长度值比例(%)</td>
					<td>32mm</td>
					<td class="wuri">{{lRatio["7"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>白棉2级</td>
					<td>{{clRatio["21"]}}</td>
					<td>31mm</td>
					<td class="wuri">{{lRatio["6"]}}</td>
				</tr>
				<tr>
					<td>白棉3级</td>
					<td>{{clRatio["31"]}}</td>
					<td>30mm</td>
					<td class="wuri">{{lRatio["5"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>白棉4级</td>
					<td>{{clRatio["41"]}}</td>
					<td>29mm</td>
					<td class="wuri">{{lRatio["4"]}}</td>
				</tr>
				<tr>
					<td>白棉5级</td>
					<td>{{clRatio["51"]}}</td>
					<td>28mm</td>
					<td class="wuri">{{lRatio["3"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>淡点污棉1级</td>
					<td>{{clRatio["12"]}}</td>
					<td>27mm</td>
					<td class="wuri">{{lRatio["2"]}}</td>
				</tr>
				<tr>
					<td>淡点污棉2级</td>
					<td>{{clRatio["22"]}}</td>
					<td>26mm</td>
					<td class="wuri">{{lRatio["1"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>淡点污棉3级</td>
					<td>{{clRatio["32"]}}</td>
					<td>25mm</td>
					<td class="wuri">{{lRatio["0"]}}</td>
				</tr>
				<tr>
					<td>淡黄染棉1级</td>
					<td>{{clRatio["13"]}}</td>
					<td rowspan="7" class="bgwhite">马克隆值</td>
					<td colspan="2">马克隆主体级</td>
					<td class="wuri">{{mainMv["${mvs[0].mv!}"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>淡黄染棉2级</td>
					<td>{{clRatio["23"]}}</td>
					<td colspan="2">马克隆值平均值</td>
					<td class="wuri">${quotation.micronValue!}</td>
				</tr>
				<tr>
					<td>淡黄染棉3级</td>
					<td>{{clRatio["33"]}}</td>
					<td rowspan="5" class="bgwhite" style="width:175px">各马克隆值级比例(%)</td>
					<td>C1</td>
					<td class="wuri">{{mvRatio["0"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>黄染棉1级</td>
					<td>{{clRatio["14"]}}</td>
					<td>B1</td>
					<td class="wuri">{{mvRatio["1"]}}</td>
				</tr>
				<tr>
					<td>黄染棉2级</td>
					<td>{{clRatio["24"]}}</td>
					<td>A</td>
					<td class="wuri">{{mvRatio["2"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td rowspan="3">长度整齐度</td>
					<td colspan="2">最小值</td>
					<td>${limaxmin.minli!}</td>
					<td>B2</td>
					<td class="wuri">{{mvRatio["3"]}}</td>
				</tr>
				<tr>
					<td colspan="2">最大值</td>
					<td>${limaxmin.maxli!}</td>
					<td>C2</td>
					<td class="wuri">{{mvRatio["4"]}}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td colspan="2">平均值</td>
					<td>${quotation.longInteger!}</td>
					<td rowspan="3">断裂比强度(cN/tex)</td>
					<td colspan="2">最小值</td>
					<td class="wuri">${stmaxmin.minst!}</td>
				</tr>
				<tr>
					<td>+b</td>
					<td colspan="2">平均值</td>
					<td>${quotation.yellowIndex!}</td>
					<td colspan="2">最大值</td>
					<td class="wuri">${stmaxmin.maxst!}</td>
				</tr>
				<tr style="background-color: rgb(246, 246, 246);">
					<td>Rd(%)</td>
					<td colspan="2">平均值</td>
					<td>${quotation.reflectivity!}</td>
					<td colspan="2">平均值</td>
					<td class="wuri">${quotation.strength!}</td>
				</tr>
			</tbody>
		</table>

		<!-- 棉花数据186包 -->
		<table class="tabl tabw" cellspacing="0">
			<thead align="center">
				<tr>
					<th colspan="2">条码</th>
					<th>颜色级</th>
					<th>长度</th>
					<th>马值</th>
					<th>比强</th>
					<th>长整</th>
					<th>轧工</th>
					<th>公检日期</th>
					<th>黄度</th>
					<th>反射率</th>
				</tr>
			</thead>
			<tbody>
				<#list list! as item>
					<tr style="background-color: rgb(246, 246, 246);">
						<td class="xuhao">${item_index+1}</td>
                        <td class="barcode">${item.barCode!}</td>
						<td>{{colourLevel["${item.colorLevel!}"]}}</td>
						<td>${item.length!}</td>
						<td>${item.micronValue!}</td>
						<td>${item.strength!}</td>
						<td>${item.longInteger!}</td>
						<td>${item.rollProcess!}</td>
						<td>${item.inspectionDate!?date}</td>
						<td>${item.yellowIndex!}</td>
						<td class="lastli">${item.reflectivity!}</td>
					</tr>
				</#list>
			</tbody>
		</table>
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
            micronValue:{"0":"C1","1":"B1","2":"A","3":"B2","4":"C2"},
			lengths:{"0":"25","1":"26","2":"27","3":"28","4":"29",
                "5":"30","6":"31","7":"32"},
            mainMv:{"0":"C","1":"B","2":"A","3":"B","4":"C"},
			clRatio:{"11":"——","21":"——","31":"——","41":"——","51":"——",
					"12":"——","22":"——","32":"——","13":"——","23":"——",
					"33":"——","14":"——","24":"——"},
			mvRatio:{"0":"——","1":"——","2":"——","3":"——","4":"——"},
			lRatio:{"0":"——","1":"——","2":"——","3":"——","4":"——",
                "5":"——","6":"——","7":"——"}
        },
        mounted:function() {
            _this = this;
            <#list cls as item>
    			_this.clRatio[${item.colorlevel}] = ${item.ratio};
			</#list>
			<#list lengths as item>
				_this.lRatio[${item.len}] = ${item.ratio};
			</#list>
			<#list mvs as item>
				_this.mvRatio[${item.mv}] = ${item.ratio};
			</#list>
        },
        watch: {
        },
        methods:{
        }
    });
</script>
</html>