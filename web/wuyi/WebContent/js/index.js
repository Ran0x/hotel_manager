$(function(){
    		 $.ajax({
     	   		   url: "LoginRegisterServlet?method=isLogin",
     	   		   data: {},
     	   		   dataType : "json", 
     	   		   success: function(msg){
     	   			   if(msg.tip=="请登录")
     	   			   		location.href = "signin.jsp";
     	   		   }
     	   	});
    	})
    	
          function quit(){
        	  $.ajax({
   	   		   type: "GET",
   	   		   url: "LoginRegisterServlet?method=quit",
   	   		   data: {},
   	   		   dataType : "json", 
   	   		   success: function(msg){
   	   			   	location.href = "signin.jsp";
   	   		   }
   	   	});
          }
          
         opentab = function addTab(title, url){
        		//先判断是否存在标题为title的选项卡
        		var tab=$('#easytabs').tabs('exists',url);
        		if(tab){
        			//若存在，则直接打开
        			$('#easytabs').tabs('select',url);
        		}else{
        			//否则创建
        			$('#easytabs').tabs('add',{
        				title:title,
        				content:"<iframe width='100%' height='100%'  id='iframe' frameborder='0' scrolling='auto'  src='"+url+"'></iframe>",
        				closable:true
        			});
        		}
        	};