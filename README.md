# Pastebin

#### 																									一个可私有的代码临时存放网站

基于SpringBoot+MyBatis+Mysql+jsp+Maven实现

### 访问网站

[http://paste.tim-wcx.ltd](http://paste.tim-wcx.ltd)

### 网站截图

1. 主页

![image-20210620200403094](https://rawgithub.tim-wcx.workers.dev/WCX1024979076/image1/master/img/20210620200404.png)

2. 索引检索界面

   ![image-20210620200610931](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20210620200610931.png)



3. 邮箱检索界面

   ![image-20210620200423367](https://rawgithub.tim-wcx.workers.dev/WCX1024979076/image1/master/img/20210620200423.png)

### API 文档

注：api链接为[http://paste.tim-wcx.ltd/api](http://paste.tim-wcx.ltd/api)，且均为post形式

1. 存放代码api

   post http://paste.tim-wcx.ltd/api

   content:

   ```json
   {"action":"insert","password":"123456","code":"echo 'Hello world!'","is_secret":0}
   ```

   response

   ```json
   {"id":10053,"status":200}
   ```

2. 索引检索api

   post http://paste.tim-wcx.ltd/api

   content:

   ```json
   {"action":"select","password":"123456","id":10053}
   ```

   response:

   ```json
   {"code":"echo 'Hello world!'","status":200}
   ```

3. 邮箱检索api

   post http://paste.tim-wcx.ltd/api

   content:

   ```json
   {"action":"select_email","email":"1024979076@qq.com","page":0}
   ```

   response:

   ```json
   [{"code":"///EDA实验一代码 终终稿\nmodule test(sw,hex0,hex1,hex2,hex3);\ninput sw;\noutput hex0,hex1,hex2,hex3;\nwire[17:0] sw;\nreg[0:6] hex0,hex1,hex2,hex3;\nreg[6:0] ans1,ans2;\nreg [17:0]  ans;\ninteger flag=1;\nalways @ (sw)\nbegin\n\tans1<=sw[13:7];\n\tans2<=sw[6:0];\n\tif(sw[17]==1)\n\t\tbegin\n\t\t\thex3[0:6]<=7'b1111111;\n\t\t\tans<=a...","id":10052},{"code":"///EDA实验一代码终稿\nmodule test(sw,hex0,hex1,hex2,hex3);\ninput sw;\noutput hex0,hex1,hex2,hex3;\nwire[17:0] sw;\nreg[0:6] hex0,hex1,hex2,hex3;\nreg[6:0] ans1,ans2;\nreg [17:0]  ans;\ninteger flag=1;\nalways @ (sw)\nbegin\n\tans1<=sw[13:7];\n\tans2<=sw[6:0];\n\tif(sw[17]==1)\n\t\tbegin\n\t\t\thex3[0:6]<=7'b1111111;\n\t\t\tans<=ans...","id":10051},{"code":"///EDA 实验三 代码\nmodule test(KEY,sw,hex0,hex1,hex2,hex3,hex4,hex5);\ninput KEY,sw;\noutput hex0,hex1,hex2,hex3,hex4,hex5;\nparameter  S0=4'b0000,S1=4'b0001,S2=4'b0010,S3=4'b0011,S4=4'b0100,S5=4'b0101;\nwire [0:0] sw;\nwire[0:0] KEY;\nreg[4:1] state=S0,next_state=S0;\nreg[0:6] hex0,hex1,hex2,hex3,hex4,hex5;\nin...","id":10050},{"code":"///EDA实验二代码终版\nmodule test(sw,CLOCK_50,KEY,hex0,hex1,hex2,hex3,hex4,hex5,LEDR,LEDG);\ninput CLOCK_50,KEY,sw;\noutput hex0,hex1,hex2,hex3,hex4,hex5,LEDR,LEDG;\nreg[0:6] hex0,hex1,hex2,hex3,hex4,hex5;\n\nreg clk=0;\nreg[6:0] hour=0,minute=0,seconds=0,remain_hour=0,remain_minute=0;\ninteger i=0,day=12;\nwire[3:...","id":10049},{"code":"///EDA实验二代码修正版\nmodule test(sw,CLOCK_50,KEY,hex0,hex1,hex2,hex3,hex4,hex5,LEDR,LEDG);\ninput CLOCK_50,KEY,sw;\noutput hex0,hex1,hex2,hex3,hex4,hex5,LEDR,LEDG;\nreg[0:6] hex0,hex1,hex2,hex3,hex4,hex5;\n\nreg clk=0;\nreg[6:0] hour=0,minute=0,seconds=0,remain_hour=0,remain_minute=0;\ninteger i=0,day=12;\nwire[3...","id":10048},{"code":"///EDA实验二代码\nmodule test(sw,CLOCK_50,KEY,hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7,LEDR,LEDG);\ninput CLOCK_50,KEY,sw;\noutput hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7,LEDR,LEDG;\nreg[0:6] hex0,hex1,hex2,hex3,hex4,hex5,hex6,hex7;\n\nreg clk=0;\nreg[6:0] hour=0,minute=0,seconds=0,remain_hour=0,remain_minute=0;...","id":10047},{"code":"///EDA实验一代码\nmodule test(sw,hex0,hex1,hex2,hex3);\ninput sw;\noutput hex0,hex1,hex2,hex3;\nwire[17:0] sw;\nreg[0:6] hex0,hex1,hex2,hex3;\nreg[6:0] ans1,ans2;\nreg [17:0]  ans;\ninteger flag=1;\nalways @ (sw)\nbegin\n\tans1<=sw[13:7];\n\tans2<=sw[6:0];\n\tif(sw[17]==1)\n\t\tbegin\n\t\t\thex3[0:6]<=7'b1111111;\n\t\t\tans<=ans2;...","id":10046},{"code":"加密访问，暂无法查看","id":10045},{"code":"package SpringBoot_jsp.springbootJsp.controller;\n\nimport javax.annotation.Resource;\nimport javax.servlet.http.HttpServletRequest;\n\nimport SpringBoot_jsp.springbootJsp.pojo.pastebin;\nimport SpringBoot_jsp.springbootJsp.service.pastebinService;\nimport com.alibaba.fastjson.JSONArray;\nimport com.alibaba...","id":10041},{"code":"Hello World!","id":10039}]
   ```
