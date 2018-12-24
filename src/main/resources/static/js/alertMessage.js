
    	//提示信息内容，用html页面
    	function alertMessage (obj,msg){
    		
    		$("#"+obj).css('borderColor','red');
			$("#"+obj).next('span').html('<font color="red">'+msg+'</font>');
			$("#"+obj).focus();
		
    	}
    	//成功取消焦点
	    function alertMessageSucess (obj){
    		
    		$("#"+obj).css('borderColor','black');
			$("#"+obj).next('span').html('');
		
    	}
    	//提示信息内容，通过id显示
    	//提示信息内容，用html页面
    	function alertMessageById (obj,msg){
    		
    		$("#"+obj).css('borderColor','red');
			$("#"+obj).html('<font color="red">'+msg+'</font>');
			$("#"+obj).parent(".invalid").css('display','block');
			$("#"+obj).focus();
		
    	}
    	//提示信息内容，用html页面
    	function alertMessageByIdSuce (obj){
		
    		$("#"+obj).css('borderColor','black');
    		$("#"+obj).parent(".invalid").css('display','none');

			$("#"+obj).html('');
					
    	}
    	var index;
       function　loadPage(){
    	   
    	   
    	 //加载层
    	    index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
    	 /*  //loading层
    	   var index = layer.load(1, {
    	     shade: [0.1,'#fff'] //0.1透明度的白色背景
    	   });*/
       }
       function　closeLoad(){
    	  
    	   
      	 //加载层
      	  layer.close(index);   
         }
       function openUrl(Url,title){
       layer.open({
    	      type: 2,
    	      title:title,
    	      shadeClose: true,
    	      shade: false,
    	      maxmin: true, //开启最大化最小化按钮
    	      area: ['693px', '460px'],
    	      content: Url
    	    });}
       
       function openUrlOrTitle(Url,title){
           layer.open({
        	      type: 2,
        	      title:title,
        	      shadeClose: true,
        	      shade: false,
        	      maxmin: true, //开启最大化最小化按钮
        	      area: ['693px', '460px'],
        	      content: Url
        	    });}
       function openUrlOrMax(Url,title){
           layer.open({
        	      type: 2,
        	      title:title,
        	      shadeClose: true,
        	      shade: false,
        	      maxmin: true, //开启最大化最小化按钮
        	      area: ['1250px', '320px'],
        	      content: Url
        	    });}