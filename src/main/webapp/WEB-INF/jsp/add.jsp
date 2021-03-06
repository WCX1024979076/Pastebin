<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
						<li class="nav-item " style="margin-right:20px;margin-top:10px"><div class="form-group"> <lable for="index" style="float:left display:inline-block;">?????????</lable> <input id="index" type="text" class="form-control" style=" display:inline-block;width:200px" placeholder="??????????????????"></input>
							<input id="index_submit" type="submit"value="??????" class="form-control" style=" display:inline-block;;width:70px"></input>
						</div></li>
						<li class="nav-item " style=";margin-top:10px"><div class="form-group"> <lable for="email" style="float:left">?????????</lable> <input id="email" type="text" class="form-control" style=" display:inline-block;width:200px" placeholder="??????????????????"></input>
							<input id="email_submit" type="submit" value="??????" class="form-control" style=" display:inline-block;width:70px"></input>
						</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<script>
    //????????????
    document.getElementById("index_submit").onclick=function(){window.location.href="./"+document.getElementById("index").value; }
    document.getElementById("email_submit").onclick=function(){window.location.href="./email?email="+document.getElementById("email").value; }
  </script>
</header>



<div style="width:80%;margin-left:10%;margin-top:50px;" id="add_div">
      <div class="form-group">
        <label for="email">??????</label>
        <input style="width:40%" type="email" class="form-control" id="email" placeholder="??????????????????????????????????????????">
    </div>
      <div class="form-group">
        <label for="password">??????</label>
        <input style="width:40%"  type="password" class="form-control" id="password" placeholder="???????????????????????????">
      </div>
      <div class="form-group">
          <label for="codetype">????????????</label>
          <select id="codetype" style="width:40%" class="form-control">
            <option value="txt">?????????</option>
            <option value="C/C++">C/C++</option>
            <option value="Python">Python</option>
            <option value="Java">Java</option>
            <option value="HTML">HTML</option>
          </select>
      </div>
        <div class="form-group">
            <textarea id="code" name="code" ></textarea>
        </div>
        <div class="form-group">
            <button id="submit" type="submit" class="btn btn-default" style="margin-bottom:auto;">??????</button>
          <label >
            <input style="margin-left:10px;margin-top:30px;" id="is_secret" type="checkbox"> ????????????
          </label>
        </div>
</div>

<div style="width:80%;margin-left:10%;margin-top:50px;display:none" id="finish_div">
    <h1>????????????</h1>
      <div class="form-group">
        <label for="id">??????</label>
        <input style="width:40%" type="text" class="form-control" id="id" placeholder="??????????????????????????????????????????" readonly="readonly" >
    </div>
      <div class="form-group">
        <label for="password">????????????</label>
        <a id="id_a" href=""></a>
      </div>
</div>

<script>
    let editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        mode: 'javascript', //??????????????????????????????????????????????????????mode/javascript/javascript.js
        lineNumbers: true, //????????????
        smartIndent: true, //????????????????????????
        indentUnit: 4, //????????????
        theme: 'idea', //????????????
        styleActiveLine: true, //??????????????????????????????????????????addon/selection/active-line.js
        keyMap: 'sublime', // ????????????default??????????????????????????????????????????emacs???sublime???vim?????????????????????????????????,keymap/sublime.js
        extraKeys: {'Ctrl-Q': 'autocomplete'}, //???????????????
    });
</script>
<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
<script>
document.getElementById("submit").onclick=function()
{
    var email=document.getElementById("email").value;
    var code=editor.getValue();
    var password=document.getElementById("password").value;
    var codetype=document.getElementById("codetype").value;
    var is_secret=0;
    if(document.getElementById("is_secret").checked)
        is_secret=1;
    var jsonObj = JSON.stringify({"action":"insert","email":email,"code":code,"password":password,"codetype":codetype,"is_secret":is_secret});
    console.log(jsonObj);
    $.ajax({
        type:"post",						//????????????
        url:"http://paste.tim-wcx.ltd/api",		//?????????url(?????????/????????????)
        async:true,							//????????????
        data:jsonObj,						//??????form???????????????
        datatype:'json',					//????????????
        contentType : "application/json",			//????????????
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
function after_upload(data)
{
    var obj=eval("("+data+")");
    var id=obj.id;
    document.getElementById("add_div").style.display="none";
    document.getElementById("finish_div").style.display="block";
    document.getElementById("id_a").innerHTML="http://paste.tim-wcx.ltd/"+id;
    document.getElementById("id_a").href="http://paste.tim-wcx.ltd/"+id;
    document.getElementById("id").value=id;
}
</script>

</body>
</html>
