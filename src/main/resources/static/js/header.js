$(document).ready(function (){
/*导航菜单切换*/
	   $(".clck").click(function(){
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
		});
	   /*鼠标移入下拉菜单出现*/
	   $(".drop_menu").hover(
	   		function(){
	   			$(".menu_down").css("display","block");
	  		},
	  		function(){
	  			$(".menu_down").css("display","none");
	  		}
	   );
	    $(".xiala_menu").hover(
	    	function(){
	    		$(this).addClass("active1");
	   	 	},
	   	 	function(){
	   	 		$(this).removeClass("active1");
	   	 	}
	    );
	    $(".newziyuan").click(
	    		function(){
	    			window.open("/work/mmzx/newzuixin.jsp");
	    	}
	    );
	    /*批量检索*/
		$(".batchSear").click(
			function(e){
				e.stopPropagation()
				$(".batchsearch-box").css("display","block");
			}
		);
		$(document).bind('click',function(e){
			var target = $(e.target)
			if(target.closest(".batchsearch-box").length == 0){
				$(".batchsearch-box").css("display","none");
				/*$('.textarea_inner').val("");*/
			}
		});
		$(".delete_btn").click(
			function(){
				$(".batchsearch-box").css("display","none");
			//	$('.textarea_inner').val("");
			}
		);
		$(".reset_btn").click(
			function(){
				$('.textarea_inner').val("");
			}
		);
		
})

function	checkNum() {
   var arr = $('#searchcontent').val().split(/[\s\n]/);
   var reg = /^\d{11}$/; //定义正则表达式
   var num=0;
       if(!(reg.test(Trim(arr[arr.length-1])))){
		 //  alert('您已输入'+Trim(arr[i])+'批号格式有误，请调整');
			   return;
 
		   } else {
			   
			   $('#searchcontent').val(  $('#searchcontent').val()+"\n"); 
				  num++;

		   } ;
  
   
	   
   }
 function	searchPl() {
   var arr = $('#searchcontent').val().split(/[\s\n]/);
   var reg = /^\d{11}$/; //定义正则表达式
   var num=0;
   for ( var i = 0; i <arr.length; i++){
	   if(Trim(arr[i])!=''){
	   }else {
		   continue;
	   }
	   
	   if(!(reg.test(Trim(arr[i])))){
		   alert('您已输入'+Trim(arr[i])+'批号格式有误，请调整');
			   return;
   
		   };
			  num++;

		}
	   if(num>10){
		   alert('您已输入'+num+'个有效批号，最多可以输入10个批号，请调整');
     return;
   }
   
   $.ajax({
		type: "post",
		url: "/work/gjsj/plsearch.mvc",
		dataType:"JSON",

		data:"data="+$('#searchcontent').val(),
		success: function(msg){	
		
		   if (msg.result=='0')				    
		    {						       	
        	   var u = '/work/mmzx/batchSear.jsp';
			var form = document.createElement('form');
			form.action = '/work/mmzx/batchSear.jsp';
			form.target = '_blank';
			
			form.method = 'POST';
			
			document.body.appendChild(form);
			form.submit();
		  }					   
			else
			{
				layer.alert("提交失败");
				} 
			}						
		});
   
	   
   }
   function Trim(str)
   { 
    return str.replace(/(^\s*)|(\s*$)/g, ""); 
  }
