package SpringBoot_jsp.springbootJsp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import SpringBoot_jsp.springbootJsp.pojo.pastebin;
import SpringBoot_jsp.springbootJsp.service.pastebinService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.Math.min;


@RestController
@ComponentScan({"SpringBoot_jsp.springbootJsp.service","SpringBoot_jsp.springbootJsp.mapper"})
@MapperScan("SpringBoot_jsp.springbootJsp.mapper")
public class UserController {
	@Autowired
	private pastebinService PastebinService;

	@RequestMapping(value = "/")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("add");
		return mv;
	}

	@RequestMapping("/api")
	public String get(@RequestBody Map paste) {
		if(paste.get("action").toString().equals("insert"))
		{
			Map<String, Object> map = new HashMap<>();
			pastebin Pastebin= PastebinService.insert(paste);
			map.put("status",200);
			if(paste.get("is_secret")!=null&&(Integer)paste.get("is_secret")==1)
				map.put("id",hash(Pastebin.get_id()));
			else
				map.put("id",Pastebin.get_id());
			String str = JSON.toJSONString(map);
			return str;
		}
		else if(paste.get("action").toString().equals("select")) {
            Map<String, Object> map = new HashMap<>();
            Integer is_hash = 0;
            if ((Integer) paste.get("id") > 655360000) {
                paste.put("id", hash((Integer) paste.get("id")));
                is_hash = 1;
            }
            pastebin Pastebin = PastebinService.select(paste);
            String password1, password2;
            try {
                password1 = (String) paste.get("password");
            } catch (Exception e) {
                password1 = "";
            }

            try {
                password2 = (String) Pastebin.get_password();
            } catch (Exception e) {
                password2 = "";
            }

			if (password1 == null)
				password1 = "";
            if (password2 == null)
                password2 = "";

            if(!password2.equals(password1))
			{
				map.put("status",400);
				map.put("messgae","密码错误");
			}
            else if (is_hash == 1 && Pastebin.get_is_secret() == 0)
			{
				map.put("status",400);
				map.put("messgae","无法访问");
			}
			else if (is_hash == 0 && Pastebin.get_is_secret() == 1)
			{
				map.put("status",400);
				map.put("messgae","无法访问");
			}
			else
			{
				map.put("status",200);
				map.put("code",Pastebin.get_content());
				map.put("codetype",Pastebin.get_codetype());
			}

			String str = JSON.toJSONString(map);
			if(is_hash==1&&Pastebin.get_is_secret()==1)
			{
				PastebinService.delete(paste);
			}
			return str;
		}
		else if(paste.get("action").toString().equals("select_email"))
		{
			Map<String, Object> map = new HashMap<>();
			List<pastebin> Pastebin= PastebinService.select_email(paste);
			List<String> str_arr=new ArrayList<>();
			for(pastebin tem : Pastebin)
			{
				if(tem.get_is_secret()==1)
					continue;
				map.put("id",tem.get_id());
				String code=tem.get_content();
				if(!tem.get_password().equals(""))
					map.put("code","加密访问，暂无法查看");
				else if(code.length()>300)
					map.put("code",code.substring(0,300)+"...");
				else
					map.put("code",code);
				str_arr.add(JSON.toJSONString(map));
			}
			StringBuilder str= new StringBuilder("[");
			int flag=0;
			for(String str1:str_arr)
            {
                if(flag==0)
                {
                    str.append(str1);
                    flag=1;
                }
                else
                    str.append(",").append(str1);
            }
			str.append("]");
			return str.toString();
		}
		return "";
	}

	@RequestMapping(value = "/{id:\\d+}")
	public ModelAndView index(@PathVariable(value = "id") Integer id) {
		Map<String,Object> paste =new HashMap<>();
		paste.put("id",id);
		ModelAndView mv = new ModelAndView("show");
		mv.addObject("id",id);
		return mv;
	}



	@RequestMapping(value = "/email")
	public ModelAndView email(@RequestParam String email){
		ModelAndView mv = new ModelAndView("show_email");
		mv.addObject("email",'"'+email+'"');
		return mv;
	}

	public Integer hash(Integer n)
	{
		return ((0x0000FFFF & n)<<16) + ((0xFFFF0000 & n)>>16);
	}

	@RequestMapping("/skip")
	public String skip(HttpServletRequest request){
		return "skip/skipped";
	}
	
}
