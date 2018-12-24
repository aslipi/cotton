<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta content="IE=Edge" http-equiv="X-UA-Compatible">
<meta name="format-detection" content="telephone=no">
<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
<link rel="stylesheet" href="/css/zh-mobile.min.css">
<link rel="stylesheet" href="/css/icon/iconfont.css">
<script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
		function toast(html){
			$("#toast_html").html(html);
			$(".toast_section").css("display","block").css("opacity","1");
			setTimeout(function(){
				$("#toast_html").html("");
				$(".toast_section").css("display","none").css("opacity","0");
			},3000);
		}

		function myconfirm(msg,click){
			var html = '<div id="backdrop" class="backdrop visible active"></div>'
						+'<div id="confirm" class="popup-container popup-showing active">'
							    +'<div class="popup">'
						        +'<div class="popup-head">'
						            +'<h3 class="popup-title" style="color:white;">系统提示</h3>'
						        +'</div>'
						        +'<div class="popup-body">'
						            +msg
						        +'</div>'
						        +'<div class="popup-buttons">'
						            +'<button onclick="doFalse()" class="button button-default">取消</button>'
						            +'<button onclick="doOk()" class="button button-positive">确定</button>'
						        +'</div>'
						    +'</div>'
						+'</div>';
			$("body").append(html);
			this.doOk = function(){
                $("#confirm").remove();
                $("#backdrop").remove();
                if(typeof click=="function"){
                    click();
                    return true;
                }
                     
            }
            this.doFalse = function(){
            	$("#confirm").remove();
            	$("#backdrop").remove();
                if(typeof click=="function"){
                    return false;
                }
                     
            }
		}
		
</script>
