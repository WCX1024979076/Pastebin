<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pastebin</title>
<link rel="stylesheet" href="./static/css/bootstrap.min.css">
<link rel="stylesheet" href="./static/css/animate.min.css">
<link rel="stylesheet" href="./static/css/main.css">
<link rel="stylesheet" href="./static/css/swiper.min.css">
<script src="./static/js/jquery.min.js"></script>
<script src="./static/js/popper.min.js"></script>
<script src="./static/js/bootstrap.min.js"></script>
<script src="./static/js/anime.min.js"></script>
<script src="./static/js/swiper.min.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/theme/idea.css" rel="stylesheet">
<link href="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/codemirror.css" rel="stylesheet">
<script src="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/codemirror.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/addon/selection/active-line.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/addon/edit/matchbrackets.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/keymap/sublime.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/mode/javascript/javascript.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/codemirror/5.61.1/mode/python/python.js"></script>
<style>
	.CodeMirror {
		border: 1px solid #eee;
		height: auto;
	}

	.CodeMirror-scroll {
		height: auto;
		overflow-y: hidden;
		overflow-x: auto;
	}

	.code_span
	{
		margin-top:10px;
		display:block;
		font-size:20px;
		word-wrap:
		break-word;
		white-space:normal;
	}
	.code_div
	{
		padding-left:5%;
		padding-right:5%;
		padding-top:2%;
	}
</style>
</head>
<body>

<header id="header">
	<div class="my-container">
		<div class="row">
			<nav class="navbar navbar-expand-lg navbar-light"> <a class="navbar-brand" href="./">	<h1> Pastebin </h1> </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
					<ul class="navbar-nav ">
						<li class="nav-item " style="margin-right:20px;margin-top:10px"><div class="form-group"> <lable for="index" style="float:left display:inline-block;">索引：</lable> <input id="index" type="text" class="form-control" style=" display:inline-block;width:200px" placeholder="根据索引检索"></input>
							<input id="index_submit" type="submit"value="前往" class="form-control" style=" display:inline-block;;width:70px"></input>
						</div></li>
						<li class="nav-item " style=";margin-top:10px"><div class="form-group"> <lable for="email" style="float:left">邮箱：</lable> <input id="email" type="text" class="form-control" style=" display:inline-block;width:200px" placeholder="根据邮箱检索"></input>
							<input id="email_submit" type="submit" value="前往" class="form-control" style=" display:inline-block;width:70px"></input>
						</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<script>
    //索引跳转
    document.getElementById("index_submit").onclick=function(){window.location.href="./"+document.getElementById("index").value; }
    document.getElementById("email_submit").onclick=function(){window.location.href="./email?email="+document.getElementById("email").value; }
  </script>
</header>

<div id="content_div">

</div>

</div>
<div id="nodata" class="code_div" style="display:none;padding-left:5%"><span style="font-size:20px">别滚动了，已经到底了。。。</span> </div>
<script>

	var winH = $(window).height(); //页面可视区域高度
	var email=${email};
	var page=0;
    var can_load=1;
    var vis=new Array();
	function refresh()
	{
		var pageH = $(document.body).height();
		var scrollT = $(window).scrollTop(); //滚动条top
		var aa = (pageH - winH - scrollT) / winH;
		if(!can_load)
		{
		    document.getElementById("nodata").style.display="block";
			return false;
		}
		if (aa < 0.02) {
			var jsonObj = JSON.stringify({"action":"select_email","email":email,"page":page});
			console.log(jsonObj);
			$.ajax({
				type:"post",						//提交方式
				url:"http://paste.tim-wcx.ltd/api",		//执行的url(控制器/操作方法)
				async:true,							//是否异步
				data:jsonObj,						//获取form表单的数据
				datatype:'json',					//数据格式
				contentType : "application/json",			//数据格式
				success:function(data){
					console.log(data);
					after_upload(data);
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
	}
	$(window).scroll(function (){refresh();});
	refresh();
	function after_upload(data)
	{
		var obj=eval("("+data+")");
		if(obj.length==0||!can_load)
		{
		    document.getElementById("nodata").style.display="block";
			return false;
		}
        if(obj.length!=10)
            can_load=0;
		var str = "";
		for(var i=0;i<obj.length;i++)
		{
		    if(vis[obj[i].id]==1)
		        continue;
		    vis[obj[i].id]=1;
			str="";
			str+="<div class=\"code_div\">";
			str+="<a href=\"http://paste.tim-wcx.ltd/"+obj[i].id+"\"><h4>http://paste.tim-wcx.ltd/"+obj[i].id+"</h4></a>";
			str+="<span class=\"code_span\" >"+obj[i].code+"</span>";
			str+="<hr>";
			str+="</div>";
			$("#content_div").append(str);
		}
		page++;
	}
</script>
</body>
</html>
