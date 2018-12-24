
  /*     $(function())
      {
      $("#showCustState").hover(function(){
            alert($('#showCustState').val());
                   layer.tips($('#showCustState').val(), '#showCustState', { tips: [4, '#78BA32'] });
       
         });
      } */
         //封装tip方法
         function  showTip(msg,idName)
         {
         			layer.tips(msg, idName, {  tips: [1, '#FF3333'] });
         
         }
           //封装tip方法
         function  showTitle(msg,idName)
         {
            layer.tips(msg, idName, { tips: [4, '#78BA32'] });

         
         }
          //成功提示消息
          function  alertSuc(msg)
         {
         	layer.msg(  
         			msg,{ offset: '100px', time: 1000}, {icon : 1});
         }
        //成功提示信息居中
          function  alertSucJz(msg)
         {
        	  layer.alert(msg, {
        		  icon: 1,
        		  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
        		})
         }
         //失败提示消息
           function  alertFail(msg)
         {
         		layer.msg(  
         				msg,{ offset: '100px'}, {icon : 2});
         
         }
		function bcxm() {
 
         var xm=$("#xm").val();
			if(''==xm||null==xm)
			{
		//	layer.tips('请输入姓名', '#xm', {  tips: [1, '#0FA6D8'] });
			showTip('姓名不能为空,请输入姓名！','#xm');
				return;
			}
			//询问框
			layer.confirm('确认要修改姓名吗？', {icon: 3, title:'提示',offset: '100px'}, function(index){
				   bcxmS();//新增保存姓名数据  
				});
			

		}
		//异步保存数据
		function bcxmS() {

			//手机登陆跳出验证直接进行登录处理

			var xm=$("#xm").val();
			if(''==xm||null==xm)
			{
			showTip('姓名不能为空,请输入姓名！','#xm');
		
				return;
			}
			xm = encodeURI(encodeURI(xm));
			 var checkUrl="/work/user/saveXm.mvc?xm="+xm;  
		   
			 $.ajax({
				method:"post",
				url:checkUrl,
				success:function(isSuccess){
					if($.trim(isSuccess)=="1"){
					alertSuc("保存成功");
					//location.reload();
					} else
					{
					alertFail("保存失败");
					}
				}
			});
		
			
		

		}
		
	 function showJgdwDetaile(){
	 

		

		//iframe层-禁滚动条
			layer.open({
				type : 2,
				   offset: '100px',
				title : '已关联加工厂',
				area : [ '410px', '350px' ],
				skin : 'layui-layer-rim', //加上边框
				content : [ '/work/jszyMgr/jgdwDetail.jsp', 'no' ]
			});
		/* 	layer.open({
				type : 2,
				title : '修改手机号',
				shadeClose : false,
				shade : true,
				shade : 0.8,
				scrollbar : false,
				maxmin : false, //开启最大化最小化按钮
				area : [ '460px', '400px' ],
				content : 'modifyMobile.jsp'
			}); */
		}

			
	 function addYwy(c_tel){
		 if(c_tel!=""){
		  //iframe层-禁滚动条
			layer.open({
				type : 2,
				   offset: '100px',
				title : '新增业务员',
				area : [ '410px', '350px' ],
				skin : 'layui-layer-rim', //加上边框
				content : [ '/work/member/jbxx/addYwy.jsp', 'yes' ]
			});
		
		 }else{
		 	alert("请先认证手机号码，再进行操作！");
		 	return;
   
		 }
	 
		}
	 //<!--------------------------------删除业务员-------------------------->
	 function deleteYwy(ywynm)
	 {

		//询问框
		 layer.confirm('确认要删除业务员吗？', {icon: 3, title:'提示',offset: '100px'}, function(index){

          var checkUrl = "/work/user/deleteYwy.mvc?ywynm="+ywynm;
        	$.ajax({
				method : "post",
				url : checkUrl,
				success : function(isSuccess) {
					if ($.trim(isSuccess) == "1") {
						alertSuc('删除成功！');
						window.location.reload(); 
		 
					}else 
					{
						alertFail("删除失败！");
					}

				}

			});
			
			
			});
			
		  


		   
		 
	 }
	 function editPas()
	 {
			layer.open({
				type : 2,
				   offset: '100px',
				title : '修改密码',
				area : [ '410px', '350px' ],
				skin : 'layui-layer-rim', //加上边框
				content : [ '/member/userMgr/editUserPWD.jsp', 'no' ]
			});
		 
	 }