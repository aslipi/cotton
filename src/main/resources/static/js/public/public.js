var common = common || {} ;

 parr=[];

// 菜单栏样式切换
common._menu_style_switch = function(){
	$("#menu_nav li a").wrapInner( '<span class="out"></span>' );
	$("#menu_nav li a").each(function() {
		$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
		if($(this).attr("class")=="menu_active"){
			$(this).children(".out").css('top','48px');
			$(this).children(".over").css('top','0px');
		}
	});
	$("#menu_nav li a[class!='menu_active']").hover(function() {
		$(".out",this).stop().animate({'top':'48px'}, 300);
		$(".over",this).stop().animate({'top':'0px'}, 300);
	}, function() {
		$(".out",this).stop().animate({'top':'0px'}, 300);
		$(".over",this).stop().animate({'top':'-48px'}, 300);
	});
};
//下拉列表样式
common._drop_down_list_style = function(){
	$("ul.topnav li span").mouseover(function() {
		$(this).parent().find("ul.gtcom_com").slideDown('fast').show();
		$(this).parent().hover(function() {
		}, function(){	
			$(this).parent().find("ul.gtcom_com").slideUp('slow'); 
		});
	}).hover(function() { 
		$(this).addClass("subhover");
	}, function(){
		$(this).removeClass("subhover");
		$("ul.gtcom_com").hover(function(){
			$("ul.topnav li span").addClass("subhover")   
		},function(){
			$("ul.topnav li span").removeClass("subhover")   
		});
	});
};
//下拉菜单

//根据路径设置menu样式
common._menu_style_setting = function(){
	var pathname = getPathName();
//	console.log(pathname);
	if(pathname.indexOf("work/zxcgMgr/searchdetail/sousuo.jsp")>=0){//在线采购
		setMenuStyle("jydt"); //交易大厅
	} else
	if(pathname.indexOf("product/content")>=0){//在线采购
		setMenuStyle("jydt"); //交易大厅
	}
	else
	if(pathname.indexOf("work/financeOnline")>=0){//网上金融
		setMenuStyle("mfjf");
	}
	else
		if(pathname.indexOf("work/purchArea")>=0){//采购专区
			setMenuStyle("cgzq");
		}
	else
	if(pathname.indexOf("work/tradingMgr")>=0){//交易专场
		setMenuStyle("mmzx");
	}
	else
	if(pathname.indexOf("work/logisticsMgr")>=0){//物流配送
		setMenuStyle("mcwl");
	}
	else
	if(pathname.indexOf("work/zxcgMgr/searchdetail/resourceProduct.jsp")>=0){//现货资源
		setMenuStyle("jydt");
	}
	else
		if(pathname.indexOf("/work/zxcgMgr/searchdetail/basisTrade.jsp")>=0){//基差资源
			setMenuStyle("jydt");
		}
	else
	if(pathname.indexOf("work/zxcgMgr/searchdetail/resourceProduct.jsp")>=0){//现货资源
		setMenuStyle("jydt");
	} else { setMenuStyle("shouye");}
	
};

//处理input输入框 输入前后颜色样式变化
common._input_style_tips = function(){
	$("input[class*=greenTips]").each(function(){
		var _origin_val = $(this).val(); //默认的提示性文本 
		$(this).css({"color":"#99c3b1"})
			.focus(function(){
				if($(this).val() != _origin_val){
					$(this).css({"color":"#000"});
				}else{
					$(this).val("").css({"color":"#99c3b1"});
				}
			})
			.blur(function(){
				if($(this).val()==""){
					$(this).val(_origin_val).css({"color":"#99c3b1"});
				}
			})
		   .keydown(function(){
			   $(this).css({"color":"#000"});
		   });
	});
};


$(document).ready(function() {
	!function(){
		if(window['public.js']) return;
		window['public.js'] = true;
		
		common._menu_style_setting();
		common._menu_style_switch();
		common._drop_down_list_style();
		common._input_style_tips();
	}();
});

/**
 * 获取URL中的参数
 * @param val
 * @returns
 */
function getParameter(val) {
	var uri = window.location.search;
	var re = new RegExp("" + val + "=([^&?]*)", "ig");
	return ((uri.match(re)) ? (uri.match(re)[0].substr(val.length + 1)) : null);
}

/**
 * 返回路径参数名
 * @returns
 */
function getPathName(){
	return window.location.pathname;
}

/**
 * 根据menu_id设置菜单样式
 * @param menu_id
 */
function setMenuStyle(menu_id){
//	console.log(menu_id);
	$('.active').removeClass("active");
	$("#"+menu_id).addClass("active");
   
}

/**
 * 加入对比
 * @param batchNo
 */
function addcompareGj(batchNo,from){
	addDuibi(batchNo,from);
	
	
}



/**
 * 清除对比
 * @param batchNo
 * @param from
 */
function clearduibi(){
		$.ajax({
			type:"POST",
			url:"/work/account/clearduibi.mvc",
			data:"pihao="+'111'+"&shzt="+'00',
			success:function(res){}
				
		});
		
}

/**
 * 加入对比
 * @param batchNo
 * @param from
 */
function addDuibi(batchNo,from){
		$.ajax({
			type:"POST",
			url:"/work/account/addDuibi.mvc",
			data:"pihao="+batchNo+"&shzt="+'00',
			success:function(res){
				if(res.result=="0"){
				var array=res.biduiarray
						
					}else if(res.result=="1"){
						
						alert("记录已存在！");
						return ;
					}else if(res.result=="2"){
						alert("最多加入4条对比记录！");
						return ;
						
					}
				if(from=='gwc'){
					window.parent.updateBdside(array,from);
				}else{
					updateBdside(array,from);
					
				}	
				
			}
		});
		
}





/**
 * 加入购物车
 * @param productId
 */
function addGwc(productId,userId,custId,userType){
	if(userId!=""){
		$.ajax({
			type:"POST",
			url:"/work/gwcMgr/add.mvc",
			data:{'productId':productId,'ly':'00'},
			dataType: "json",
			success:function(data){
				if(data.resCode=='1'){
					alert(data.resMsg);
					updateGwcside( custId,userId,userType );
				}else{
					alert(data.resMsg);
				}
			}
		});
	}else{
		alert("请先登录！");
		window.location.href ='/thb2b/templates/login.jsp';
	}
}

/**
 * 加入购物车（进口棉）
 * @param productId
 */
function addGwcImport(productId,userId,custId,userType,type){
	if(userId!=""){
		$.ajax({
			type:"POST",
			url:"/work/gwcMgr/addImport.mvc",
			data:{'productId':productId,'ly':'00','type':type},
			dataType: "json",
			success:function(data){
				if(data.resCode=='1'){
					alert(data.resMsg);
					updateGwcside( custId,userId,userType );
				}else{
					alert(data.resMsg);
				}
			}
		});
	}else{
		alert("请先登录！");
		window.location.href ='/thb2b/templates/login.jsp';
	}
}

/**
 * 采购管理
 * @param productId
 */
function caigou(productId,userId,custId,userType){
	if(userId!="" && userId!="0"){
		$.ajax({
			type:"POST",
			url:"/work/gwcMgr/add.mvc",
			data:{'productId':productId,'ly':'00'},
			dataType: "json",
			success:function(data){
				if(data.resCode=='1'){
					alert(data.resMsg);
				    updateGwcside( custId,userId,userType );
					query_cart_num_by_user( userId,custId,userType );
				}else{
					alert(data.resMsg);
				}
			}
		});
	}else if(userId=="0"){
		alert("请先登录！");
		window.location.href ='/thb2b/templates/login.jsp';
	}else{
		alert("请先登录！");
		window.location.href ='/thb2b/templates/login.jsp';
	}
}

/**
 * 进口棉采购管理
 * @param productId
 */
function caigouImport(productId,userId,custId,userType,type){
	if(userId!="" && userId!="0"){
		$.ajax({
			type:"POST",
			url:"/work/gwcMgr/addImport.mvc",
			data:{'productId':productId,'ly':'00','type':type},
			dataType: "json",
			success:function(data){
				if(data.resCode=='1'){
					alert(data.resMsg);
				    updateGwcside( custId,userId,userType );
					query_cart_num_by_user( userId,custId,userType );
				}else{
					alert(data.resMsg);
				}
			}
		});
	}else if(userId=="0"){
		alert("请先登录！");
		window.location.href ='/thb2b/templates/login.jsp';
	}else{
		alert("请先登录！");
		window.location.href ='/thb2b/templates/login.jsp';
	}
}

//更新头
 function query_cart_num_by_user(userId,custId,userType){
	if(userId!=""){//用户已登录，查询登录状态下购物车数量
		$.ajax({
			type: "POST",
			url: "/work/myOffice/getCartCount.mvc",
			data: "custId="+custId+"&userId="+userId+"&userType="+userType,
			success: function(res) {
				$("#cart_num_login").text(res.result);
				$("#cart_num_login_menu").text(res.result);						
			}
		});
	}	
}


/*

 (function($){

 	
	 $.fn.qrcode_share = function(url) {
		
	
		var jsonData = {
			"param_name" : "appliaction_req_url"
		};
		$.ajax({
			url : "/work/account/getParamByName.mvc",
			dataType : 'json',
			data : jsonData,
			type : "post",
			async : false,
			success : function(data) {
				
				var rooturl="";
				if(data.result==1){
					rooturl=data.param_value
					
				}
				
				
					var $this = $(this);
					var options = {
							render: 'canvas',
							ecLevel: 'H',//识别度
							background: '#fff',//背景颜色
							quiet: 0, //边距
							radius: 0, //边角
							mode: 4,//中间logo start
							fill: '#000',
							size: 284,
							mSize: 20 * 0.01,
							mPosX: 50 * 0.01,
							mPosY: 50 * 0.01,
							image: $("#img_buffer")[0],//中间logo end
							text: "http://new.emiancang.com:8080" + url
					};
					
						$this.find('canvas').remove();
						return $this.qrcode(options);
					
						},
						error : function() {
						}
		//});
	};
 })(jQuery);

*/

	
 (function($){
	
					
		$.fn.qrcode_share = function(url) {
			var $this = $(this);
			var rooturl="";
		 	var jsonData = {
					"param_name" : "appliaction_req_url"
				};
				$.ajax({
					url : "/work/account/getParamByName.mvc",
					dataType : 'json',
					data : jsonData,
					type : "post",
					async : false,
					success : function(data) {
						
						
						if(data.result==1){
							rooturl=data.param_value
							
							var options = {
									render: 'canvas',
									ecLevel: 'H',//识别度
									background: '#fff',//背景颜色
									quiet: 0, //边距
									radius: 0, //边角
									mode: 4,//中间logo start
									fill: '#000',
									size: 284,
									mSize: 20 * 0.01,
									mPosX: 50 * 0.01,
									mPosY: 50 * 0.01,
									image: $("#img_buffer")[0],//中间logo end
									text: rooturl + url
							};
							$this.find('canvas').remove();
							return $this.qrcode(options);
						}
						
						
					}})
			
		};
	})(jQuery);



