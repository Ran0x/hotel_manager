request=function(url,datas,callback){
	$.ajax({
 	   type: "POST",
 	   url: url,
 	   data: datas,
 	   dataType:"json",
 	   success: function(msg){
 		   	callback(msg);
 		   
 	   }
 });

}